import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { User } from './user.entity';
import * as bcrypt from 'bcrypt';

@Injectable()
export class UsersService {
  constructor(
    @InjectRepository(User)
    private repository: Repository<User>,
  ) {}

  async getUsers(limit: number, page_index: number) {
    try {
      const [data, total] = await this.repository.findAndCount({
        where: { user_status: 1 },
        take: limit,
        skip: (page_index - 1) * limit,
      });
      return {
        limit: data.length,
        total: total,
        page_index: Math.ceil(page_index) || 1,
        page_count: Math.ceil(total / limit) || 1,
        data: data.sort((a, b) => b.id_user - a.id_user),
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

  async getUser(id: number): Promise<User> {
    const value = await this.repository.findOne(id, {
      where: { user_status: 1 },
      relations: ['favorites'],
    });
    if (!value) {
      throw new NotFoundException();
    } else {
      return value;
    }
  }

  async createUser(user: User): Promise<User> {
    const salt = await bcrypt.genSalt();
    const password = await bcrypt.hash(user.user_password, salt);
    user.user_password = password;
    const value = await this.repository.save(user);
    return await this.getUser(value.id_user);
  }

  async updateUser(id: number, user: User): Promise<User> {
    const value = await this.repository.findOne(id);
    if (!value) {
      throw new NotFoundException();
    } else {
      await this.repository.update(id, user);
      return await this.getUser(value.id_user);
    }
  }

  async deleteUser(id: number) {
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
