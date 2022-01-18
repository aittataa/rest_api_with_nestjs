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
      where: [
        { user_email: user.user_email },
        { user_username: user.user_username },
      ],
    });
    if (value) {
      const isMatch = bcrypt.compare(value.user_password, user.user_password);
      if (isMatch) {
        return value;
      } else {
        throw new NotFoundException({ description: `${isMatch}` });
      }
    } else {
      throw new NotFoundException();
    }
  }
}
