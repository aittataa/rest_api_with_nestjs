import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Category } from 'src/categories/category.entity';
import { Repository } from 'typeorm';
import { Wallpaper } from './wallpaper.entity';

@Injectable()
export class WallpaperService {
  constructor(
    @InjectRepository(Wallpaper)
    private wallpaperRepository: Repository<Wallpaper>,
  ) {}

  async getWallpapers(limit: number, page_index: number) {
    try {
      const [data, total] = await this.wallpaperRepository.findAndCount({
        take: limit,
        skip: (page_index - 1) * limit,
      });
      return {
        limit: data.length,
        total: total,
        page_index: Math.ceil(page_index) || 1,
        page_count: Math.ceil(total / limit) || 1,
        data: data.sort((a, b) => b.id - a.id),
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
    const value = await this.wallpaperRepository.findOne(id, {
      relations: ['category'],
    });
    if (!value) {
      throw new NotFoundException();
    } else {
      return value;
    }
  }

  async createWallpaper(wallpaper: Wallpaper): Promise<Wallpaper> {
    const value = await this.wallpaperRepository.save(wallpaper);
    return await this.wallpaperRepository.findOne(value.id, {
      relations: ['category'],
    });
  }

  async updateWallpaper(id: number, wallpaper: Wallpaper) {
    const value = await this.wallpaperRepository.findOne(id);
    if (!value) {
      throw new NotFoundException();
    } else {
      await this.wallpaperRepository.update(id, wallpaper);
      return await this.wallpaperRepository.findOne(id, {
        relations: ['category'],
      });
    }
  }

  async deleteWallpaper(id: number) {
    const value = await this.wallpaperRepository.findOne(id);
    if (!value) {
      throw new NotFoundException();
    } else {
      await this.wallpaperRepository.delete(id);
      return {
        message: 'Successfully deleted',
      };
    }
  }
}
