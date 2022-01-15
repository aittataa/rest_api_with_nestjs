import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Category } from 'src/categories/category.entity';
import { Repository } from 'typeorm';
import { Wallpaper } from './wallpaper.entity';

@Injectable()
export class WallpaperService {
  constructor(
    @InjectRepository(Wallpaper)
    private repository: Repository<Wallpaper>,
  ) {}

  async getWallpapers(limit: number, page_index: number) {
    try {
      const [data, total] = await this.repository.findAndCount({
        where: { category: { category_status: 1 } },
        relations: ['category'],
        take: limit,
        skip: (page_index - 1) * limit,
      });
      return {
        limit: data.length,
        total: total,
        page_index: Math.ceil(page_index) || 1,
        page_count: Math.ceil(total / limit) || 1,
        data: data.sort((a, b) => b.id_wallpaper - a.id_wallpaper),
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

  async getWallpaper(id: number): Promise<Wallpaper> {
    const value = await this.repository.findOne(id, {
      relations: ['category'],
    });
    if (!value) {
      throw new NotFoundException();
    } else {
      return value;
    }
  }

  async createWallpaper(wallpaper: Wallpaper): Promise<Wallpaper> {
    const value = await this.repository.save(wallpaper);
    return this.getWallpaper(value.id_wallpaper);
  }

  async updateWallpaper(id: number, wallpaper: Wallpaper): Promise<Wallpaper> {
    const value = await this.repository.findOne(id);
    if (!value) {
      throw new NotFoundException();
    } else {
      await this.repository.update(id, wallpaper);
      return this.getWallpaper(value.id_wallpaper);
    }
  }

  async deleteWallpaper(id: number) {
    const value = await this.repository.findOne(id);
    if (!value) {
      throw new NotFoundException();
    } else {
      value.delete_at = new Date(Date.now());
      await this.repository.update(id, value);
      return {
        message: 'Successfully deleted',
      };
    }
  }
}
