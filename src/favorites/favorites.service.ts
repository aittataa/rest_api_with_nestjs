import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Favorite } from './favorite.entity';

@Injectable()
export class FavoritesService {
  constructor(
    @InjectRepository(Favorite)
    private repository: Repository<Favorite>,
  ) {}

  async getFavorites(limit: number, page_index: number) {
    try {
      const [data, total] = await this.repository.findAndCount({
        relations: ['user', 'wallpaper'],
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

  async getFavorite(id: number): Promise<Favorite> {
    const value = await this.repository.findOne(id, {
      relations: ['user', 'wallpaper'],
    });
    if (value) {
      return value;
    } else {
      throw new NotFoundException();
    }
  }

  async createFavorite(favorite: Favorite): Promise<Favorite> {
    const value = await this.repository.save(favorite);
    return this.getFavorite(value.id_favorite);
  }

  async updateFavorite(id: number, favorite: Favorite): Promise<Favorite> {
    const value = await this.repository.findOne(id);
    if (value) {
      await this.repository.update(id, favorite);
      return this.getFavorite(value.id_favorite);
    } else {
      throw new NotFoundException();
    }
  }

  async deleteFavorite(id: number) {
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
