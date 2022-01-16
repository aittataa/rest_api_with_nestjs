import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Connection } from 'typeorm';
import { CategoriesModule } from './categories/categories.module';
import { Category } from './categories/category.entity';
import { Wallpaper } from './wallpaper/wallpaper.entity';
import { WallpaperModule } from './wallpaper/wallpapers.module';
import { FavoritesService } from './favorites/favorites.service';
import { FavoritesController } from './favorites/favorites.controller';
import { FavoritesModule } from './favorites/favorites.module';
import { UsersService } from './users/users.service';
import { UsersController } from './users/users.controller';
import { UsersModule } from './users/users.module';
import { User } from './users/user.entity';
import { WallpaperService } from './wallpaper/wallpapers.service';
import { CategoriesService } from './categories/categories.service';
import { WallpapersController } from './wallpaper/wallpapers.controller';
import { CategoriesController } from './categories/categories.controller';
import { Favorite } from './favorites/favorite.entity';
import { ColorsService } from './colors/colors.service';
import { ColorsController } from './colors/colors.controller';
import { ColorsModule } from './colors/colors.module';
import { Color } from './colors/color.entity';

@Module({
  imports: [
    TypeOrmModule.forRoot({
      type: 'mysql',
      host: 'localhost',
      port: 3306,
      username: 'root',
      password: '',
      database: 'app_wallpaper',
      autoLoadEntities: true,
      synchronize: true,
    }),
    TypeOrmModule.forFeature([User, Category, Wallpaper, Favorite, Color]),
    UsersModule,
    CategoriesModule,
    WallpaperModule,
    FavoritesModule,
    ColorsModule,
  ],
  providers: [
    UsersService,
    CategoriesService,
    WallpaperService,
    FavoritesService,
    ColorsService,
  ],
  controllers: [
    UsersController,
    CategoriesController,
    WallpapersController,
    FavoritesController,
    ColorsController,
  ],
})
export class AppModule {
  constructor(private connection: Connection) {}
}
