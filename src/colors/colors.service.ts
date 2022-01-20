import {
  BadRequestException,
  Injectable,
  InternalServerErrorException,
  NotFoundException,
} from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Color } from './color.entity';

@Injectable()
export class ColorsService {
  constructor(
    @InjectRepository(Color)
    private repository: Repository<Color>,
  ) {}

  async getColors(limit: number, page_index: number) {
    try {
      const [data, total] = await this.repository.findAndCount({
        take: limit,
        skip: (page_index - 1) * limit,
      });
      return {
        limit: data.length,
        total: total,
        page_index: Math.ceil(page_index) || 1,
        page_count: Math.ceil(total / limit) || 1,
        data: data,
      };
    } catch (e) {
      return {
        limit: 0,
        total: 0,
        page_index: 0,
        page_count: 0,
        data: [],
      };
    }
  }

  async getColor(id: number): Promise<Color> {
    const value = await this.repository.findOne(id);
    if (value) {
      return value;
    } else {
      throw new NotFoundException();
    }
  }

  async createColor(color: Color): Promise<Color> {
    if (color.color_name != null && color.color_code != null) {
      const value = await this.repository.findOne({
        where: [
          { color_name: color.color_name },
          { color_code: color.color_code },
        ],
      });
      if (!value) {
        const newColor = await this.repository.save(color);
        return await this.getColor(newColor.id_color);
      } else {
        throw new InternalServerErrorException({
          message: 'This color name or color code already exists.',
        });
      }
    } else {
      throw new BadRequestException({
        message: 'The color name and color code are required.',
      });
    }
  }

  async updateColor(id: number, color: Color): Promise<Color> {
    const value = await this.repository.findOne(id);
    if (value) {
      await this.repository.update(id, color);
      return await this.getColor(value.id_color);
    } else {
      throw new NotFoundException();
    }
  }

  async deleteColor(id: number) {
    const value = await this.repository.findOne(id);
    if (value) {
      value.delete_at = new Date(Date.now());
      await this.repository.update(id, value);
      return {
        message: 'Successfully deleted',
      };
    } else {
      throw new NotFoundException();
    }
  }
}
