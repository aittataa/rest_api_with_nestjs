import { Body, Controller, Delete, Get, Param, Post, Put, Query } from '@nestjs/common';
import { Rating } from './rating.entity';
import { RatingsService } from './ratings.service';

@Controller('ratings')
export class RatingsController {
    constructor(private service: RatingsService) {}

  @Get()
  async getRatings(
    @Query('limit') limit: number,
    @Query('page_index') page_index: number,
  ) {
    return this.service.getRatings(limit, page_index);
  }

  @Get(':id')
  getRating(@Param('id') id: number) {
    return this.service.getRating(id);
  }

  @Post()
  createRating(@Body() rating: Rating) {
    return this.service.createRating(rating);
  }

  @Put(':id')
  updateFavorite(@Param('id') id: number, @Body() rating: Rating) {
    return this.service.updateRating(id, rating);
  }

  @Delete(':id')
  deleteRating(@Param('id') id) {
    return this.service.deleteRating(id);
  }
}
