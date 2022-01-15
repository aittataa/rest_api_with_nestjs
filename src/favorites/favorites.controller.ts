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
import { Favorite } from './favorite.entity';
import { FavoritesService } from './favorites.service';

@Controller('favorites')
export class FavoritesController {
  constructor(private service: FavoritesService) {}

  @Get()
  async getFavorites(
    @Query('limit') limit: number,
    @Query('page_index') page_index: number,
  ) {
    return this.service.getFavorites(limit, page_index);
  }

  @Get(':id')
  getFavorite(@Param('id') id: number) {
    return this.service.getFavorite(id);
  }

  @Post()
  createFavorite(@Body() favorite: Favorite) {
    return this.service.createFavorite(favorite);
  }

  @Put(':id')
  updateFavorite(@Param('id') id: number, @Body() favorite: Favorite) {
    return this.service.updateFavorite(id, favorite);
  }

  @Delete(':id')
  deleteFavorite(@Param('id') id) {
    return this.service.deleteFavorite(id);
  }
}
