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
import { Wallpaper } from './wallpaper.entity';
import { WallpaperService } from './wallpapers.service';

@Controller('wallpapers')
export class WallpapersController {
  constructor(private service: WallpaperService) {}

  @Get()
  async getWallpapers(
    @Query('limit') limit: number,
    @Query('page_index') page_index: number,
    @Query('search') search: string,
  ) {
    return this.service.getWallpapers(limit, page_index, search);
  }

  @Get(':id')
  getWallpaper(@Param('id') id: number) {
    return this.service.getWallpaper(id);
  }

  @Post()
  createWallpaper(@Body() wallpaper: Wallpaper) {
    return this.service.createWallpaper(wallpaper);
  }

  @Put(':id')
  updateWallpaper(@Param('id') id: number, @Body() wallpaper: Wallpaper) {
    return this.service.updateWallpaper(id, wallpaper);
  }

  @Delete(':id')
  deleteWallpaper(@Param('id') id) {
    return this.service.deleteWallpaper(id);
  }
}
