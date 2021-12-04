import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Category } from './category.entity';

@Injectable()
export class CategoriesService {
  constructor(
    @InjectRepository(Category)
    private categoryRepository: Repository<Category>,
  ) {}

  async getCategories(limit: number, page_index: number) {
    try {
      const [data, total] = await this.categoryRepository.findAndCount({
        where: { status: 1 },
        take: limit,
        skip: (page_index - 1) * limit,
      });
      return {
        limit: data.length,
        total: total,
        page_index: Math.ceil(page_index) || 1,
        page_count: Math.ceil(total / limit) || 1,
        data: data.sort((a, b) => b.cid - a.cid),
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

  async getCategory(id: number): Promise<Category> {
    const value = await this.categoryRepository.findOne(id, {
      relations: ['wallpapers'],
    });
    if (!value) {
      throw new NotFoundException();
    } else {
      return value;
    }
  }

  async createCategory(category: Category): Promise<Category> {
    const value = await this.categoryRepository.save(category);
    return await this.getCategory(value.cid);
  }

  async updateCategory(id: number, category: Category): Promise<Category> {
    const value = await this.categoryRepository.findOne(id);
    if (!value) {
      throw new NotFoundException();
    } else {
      await this.categoryRepository.update(id, category);
      return await this.getCategory(value.cid);
    }
  }

  async deleteCategory(id: number) {
    const value = await this.categoryRepository.findOne(id);
    if (!value) {
      throw new NotFoundException();
    } else {
      await this.categoryRepository.delete(id);
      return {
        message: 'Successfully deleted',
      };
    }
  }
}
