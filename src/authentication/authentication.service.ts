import { Injectable, NotFoundException } from '@nestjs/common';
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

  //   async keepUser(id: number): Promise<User> {
  //     const user = await this.repository.findOne(id);
  //     if (!user) {
  //       throw new NotFoundException();
  //     } else {
  //       return user;
  //     }
  //   }

  async loginUser(user: User) {
    const value = await this.repository.findOne({
      where: { user_email: user.user_email },
    });
    if (value) {
      bcrypt.compare(
        value.user_password,
        user.user_password,
        function (error, isMatch) {
          if (error) {
            return error;
          } else if (!isMatch) {
            return new NotFoundException();
          } else {
            return value;
          }
        },
      );
    } else {
      throw new NotFoundException();
    }
  }
}
