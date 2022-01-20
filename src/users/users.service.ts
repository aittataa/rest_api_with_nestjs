import {
  BadRequestException,
  Injectable,
  InternalServerErrorException,
  NotFoundException,
} from '@nestjs/common';
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

  async getUser(id: number): Promise<User> {
    const value = await this.repository.findOne(id);
    if (value) {
      return value;
    } else {
      throw new NotFoundException();
    }
  }

  async createUser(user: User): Promise<User> {
    if (
      user.user_name != null &&
      user.user_username != null &&
      user.user_email != null &&
      user.user_password != null &&
      user.user_phone != null
    ) {
        const value = await this.repository.findOne({
          where: [
            { user_username: user.user_username },
            { user_email: user.user_email },
          ],
        });
        if (!value) {
          const salt = await bcrypt.genSalt();
          const password = await bcrypt.hash(user.user_password, salt);
          user.user_password = password;
          const newUser = await this.repository.save(user);
          return await this.getUser(value.id_user);
        } else {
          throw new InternalServerErrorException({
            message: 'Email or username already exists.',
          });
        }
    } else {
      throw new BadRequestException({
        message: 'All the fields are required.',
      });
    }
  }

  async updateUser(id: number, user: User): Promise<User> {
    const value = await this.repository.findOne(id);
    if (value) {
      const salt = await bcrypt.genSalt();
      const password = await bcrypt.hash(user.user_password, salt);
      user.user_password = password;
      await this.repository.update(id, user);
      return await this.getUser(value.id_user);
    } else {
      throw new NotFoundException();
    }
  }

  async deleteUser(id: number) {
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
