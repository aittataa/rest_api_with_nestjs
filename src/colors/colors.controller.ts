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
import { Color } from './color.entity';
import { ColorsService } from './colors.service';

@Controller('colors')
export class ColorsController {
  constructor(private service: ColorsService) {}

  @Get()
  async getColors(
    @Query('limit') limit: number,
    @Query('page_index') page_index: number,
  ) {
    return this.service.getColors(limit, page_index);
  }

  @Get(':id')
  getColor(@Param('id') id: number) {
    return this.service.getColor(id);
  }

  @Post()
  createColor(@Body() color: Color) {
    return this.service.createColor(color);
  }

  @Put(':id')
  updateColor(@Param('id') id: number, @Body() color: Color) {
    return this.service.updateColor(id, color);
  }

  @Delete(':id')
  deleteColor(@Param('id') id) {
    return this.service.deleteColor(id);
  }
}
