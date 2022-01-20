import {
  BadRequestException,
  Injectable,
  InternalServerErrorException,
  NotFoundException,
} from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { User } from 'src/users/user.entity';
import { Repository } from 'typeorm';
import * as bcrypt from 'bcrypt';

@Injectable()
export class AuthenticationService {
  constructor(
    @InjectRepository(User)
    private repository: Repository<User>,
  ) {}

  async getUser(id: number): Promise<User> {
    const user = await this.repository.findOne(id);
    if (user) {
      return user;
    } else {
      throw new NotFoundException();
    }
  }

  async loginUser(user: User): Promise<User> {
    if (
      (user.user_username != null || user.user_email != null) &&
      user.user_password != null
    ) {
      const value = await this.repository.findOne({
        where: [
          { user_email: user.user_email },
          { user_username: user.user_username },
        ],
      });
      if (value) {
        const isMatch = await bcrypt.compare(
          user.user_password,
          value.user_password,
        );
        if (isMatch) {
          return value;
        } else {
          throw new BadRequestException({
            message: 'This password is incorrect.',
          });
        }
      } else {
        throw new NotFoundException();
      }
    } else {
      throw new BadRequestException({
        message: 'All the fields are required.',
      });
    }
  }

  async registerUser(user: User): Promise<User> {
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
        return this.getUser(newUser.id_user);
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
}
