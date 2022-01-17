import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { User } from 'src/users/user.entity';
import { Repository } from 'typeorm';
import * as bcrypt from 'bcrypt';
import console from 'console';

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
    const salt = await bcrypt.genSalt();
    const password = await bcrypt.hash(user.user_password, salt);
    user.user_password = password;
    // console.log(user.user_password);
    const value = await this.repository.findOne({
      where: { user_email: user.user_email, user_password: user.user_password },
    });
    if (!value) {
      throw new NotFoundException();
    } else {
      //const state = await bcrypt.compare(password, value.user_password);
      //if (state) {
      //return value;
      //} else {
      //throw new NotFoundException();
      //}
      return value;
    }
  }

  //   async updateCategory(id: number, category: Category): Promise<Category> {
  //     const value = await this.repository.findOne(id);
  //     if (!value) {
  //       throw new NotFoundException();
  //     } else {
  //       await this.repository.update(id, category);
  //       return await this.getCategory(value.id_category);
  //     }
  //   }

  //   async deleteCategory(id: number) {
  //     const value = await this.repository.findOne(id);
  //     if (!value) {
  //       throw new NotFoundException();
  //     } else {
  //       value.delete_at = new Date(Date.now());
  //       await this.repository.update(id, value);
  //       return {
  //         message: 'Successfully deleted',
  //       };
  //     }
  //   }
}
