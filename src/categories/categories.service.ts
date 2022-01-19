import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Category } from './category.entity';

@Injectable()
export class CategoriesService {
  constructor(
    @InjectRepository(Category)
    private repository: Repository<Category>,
  ) {}

  async getCategories(limit: number, page_index: number) {
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

  async getCategory(id: number): Promise<Category> {
    const value = await this.repository.findOne(id);
    if (value) {
      return value;
    } else {
      throw new NotFoundException();
    }
  }

  async createCategory(category: Category): Promise<Category> {
    const value = await this.repository.save(category);
    return await this.getCategory(value.id_category);
  }

  async updateCategory(id: number, category: Category): Promise<Category> {
    const value = await this.repository.findOne(id);
    if (value) {
      await this.repository.update(id, category);
      return await this.getCategory(value.id_category);
    } else {
      throw new NotFoundException();
    }
  }

  async deleteCategory(id: number) {
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
