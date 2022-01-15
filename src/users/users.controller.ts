import {
  Body,
  Controller,
  Delete,
  Get,
  Param,
  Post,
  Put,
  Query,
} from '@nestjs/common';
import { User } from './user.entity';
import { UsersService } from './users.service';

@Controller('users')
export class UsersController {
  constructor(private service: UsersService) {}

  @Get()
  async getCategories(
    @Query('limit') limit: number,
    @Query('page_index') page_index: number,
  ) {
    return this.service.getUsers(limit, page_index);
  }

  @Get(':id')
  getCategory(@Param('id') id: number) {
    return this.service.getUser(id);
  }

  @Post()
  createCategory(@Body() user: User) {
    return this.service.createUser(user);
  }

  @Put(':id')
  updateCategory(@Param('id') id: number, @Body() user: User) {
    return this.service.updateUser(id, user);
  }

  @Delete(':id')
  deleteCategory(@Param('id') id) {
    return this.service.deleteUser(id);
  }
}
