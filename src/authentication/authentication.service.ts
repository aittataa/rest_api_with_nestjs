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

  async keepUser(id: number) {
    const user = await this.repository.findOne(id);
    if (user) {
      return user;
      // return {
      //   id_user: user.id_user,
      //   user_name: user.user_name,
      //   user_username: user.user_username,
      //   user_email: user.user_email,
      //   user_password: user.user_password,
      //   user_phone: user.user_phone,
      // };
    } else {
      throw new NotFoundException();
    }
  }

  async loginUser(user: User) {
    const value = await this.repository.findOne({
      where: [
        { user_email: user.user_email },
        { user_username: user.user_username },
      ],
    });
    if (value) {
      const isMatch = bcrypt.compare(user.user_password, value.user_password);
      if (isMatch) {
        return value;
      } else {
        throw new NotFoundException();
      }
    } else {
      throw new NotFoundException();
    }
  }

  async registerUser(user: User) {
    const salt = await bcrypt.genSalt();
    const password = await bcrypt.hash(user.user_password, salt);
    user.user_password = password;
    const value = await this.repository.save(user);
    return await this.repository.findOne(value.id_user);
  }
}
