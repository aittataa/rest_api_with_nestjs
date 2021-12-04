import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { WallpapersController } from './wallpapers.controller';
import { Wallpaper } from './wallpaper.entity';
import { WallpaperService } from './wallpapers.service';

@Module({
  imports: [TypeOrmModule.forFeature([Wallpaper])],
  controllers: [WallpapersController],
  providers: [WallpaperService],
})
export class WallpaperModule {}
