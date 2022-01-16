import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Rating } from './rating.entity';

@Injectable()
export class RatingsService {
  constructor(
    @InjectRepository(Rating)
    private repository: Repository<Rating>,
  ) {}

  async getRatings(limit: number, page_index: number) {
    try {
      const [data, total] = await this.repository.findAndCount({
        where: { rating_status: 1 },
        take: limit,
        skip: (page_index - 1) * limit,
      });
      return {
        limit: data.length,
        total: total,
        page_index: Math.ceil(page_index) || 1,
        page_count: Math.ceil(total / limit) || 1,
        data: data.sort((a, b) => b.id_rating - a.id_rating),
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

  async getRating(id: number): Promise<Rating> {
    const value = await this.repository.findOne(id, {
      where: { rating_status: 1 },
    });
    if (!value) {
      throw new NotFoundException();
    } else {
      return value;
    }
  }

  async createRating(rating: Rating): Promise<Rating> {
    const value = await this.repository.save(rating);
    return this.getRating(value.id_rating);
  }

  async updateRating(id: number, rating: Rating): Promise<Rating> {
    const value = await this.repository.findOne(id);
    if (!value) {
      throw new NotFoundException();
    } else {
      await this.repository.update(id, rating);
      return this.getRating(value.id_rating);
    }
  }

  async deleteRating(id: number) {
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
