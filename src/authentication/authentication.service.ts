import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { User } from 'src/users/user.entity';
import { Repository } from 'typeorm';
import * as bcrypt from 'bcrypt';
import { UsersService } from 'src/users/users.service';

@Injectable()
export class AuthenticationService {
  constructor(
    @InjectRepository(User)
    private repository: Repository<User>,
  ) {}

  async keepUser(id: number): Promise<User> {
    const user = await this.repository.findOne(id, {
      relations: [
        'favorites',
        'favorites.wallpaper',
        'ratings',
        'ratings.wallpaper',
      ],
    });
    if (user) {
      return user;
    } else {
      throw new NotFoundException();
    }
  }

  async loginUser(user: User): Promise<User> {
    const value = await this.repository.findOne({
      where: [
        { user_email: user.user_email },
        { user_username: user.user_username },
      ],
      relations: [
        'favorites',
        'favorites.wallpaper',
        'ratings',
        'ratings.wallpaper',
      ],
    });
    if (value) {
      const isMatch = bcrypt.compare(value.user_password, user.user_password);
      if (isMatch) {
        return value;
      } else {
        throw new NotFoundException();
      }
    } else {
      throw new NotFoundException();
    }
  }

  async registerUser(user: User): Promise<User> {
    const salt = await bcrypt.genSalt();
    const password = await bcrypt.hash(user.user_password, salt);
    user.user_password = password;
    const value = await this.repository.save(user);
    return await this.repository.findOne(value.id_user, {
      relations: [
        'favorites',
        'favorites.wallpaper',
        'ratings',
        'ratings.wallpaper',
      ],
    });
  }
}
