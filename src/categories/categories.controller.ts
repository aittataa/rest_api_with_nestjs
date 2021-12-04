import {
  Body,
  Controller,
  Delete,
  Get,
  Param,
  ParseIntPipe,
  Patch,
  Post,
  Put,
  Query,
} from '@nestjs/common';
import { CategoriesService } from './categories.service';
import { Category } from './category.entity';

@Controller('categories')
export class CategoriesController {
  constructor(private service: CategoriesService) {}

  @Get()
  async getCategories(
    @Query('limit') limit: number,
    @Query('page_index') page_index: number,
  ) {
    return this.service.getCategories(limit, page_index);
  }

  @Get(':id')
  getCategory(@Param('id') id: number) {
    return this.service.getCategory(id);
  }

  @Post()
  createCategory(@Body() category: Category) {
    return this.service.createCategory(category);
  }

  @Put(':id')
  updateCategory(@Param('id') id: number, @Body() category: Category) {
    return this.service.updateCategory(id, category);
  }

  @Delete(':id')
  deleteCategory(@Param('id') id) {
    return this.service.deleteCategory(id);
  }
}
