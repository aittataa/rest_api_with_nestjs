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
import { RatingsService } from './ratings/ratings.service';
import { RatingsController } from './ratings/ratings.controller';
import { RatingsModule } from './ratings/ratings.module';
import { Rating } from './ratings/rating.entity';
import { AuthenticationService } from './authentication/authentication.service';
import { AuthenticationController } from './authentication/authentication.controller';
import { AuthenticationModule } from './authentication/authentication.module';

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
    TypeOrmModule.forFeature([
      User,
      Category,
      Wallpaper,
      Favorite,
      Color,
      Rating,
    ]),
    UsersModule,
    CategoriesModule,
    WallpaperModule,
    FavoritesModule,
    ColorsModule,
    RatingsModule,
    AuthenticationModule,
  ],
  providers: [
    UsersService,
    CategoriesService,
    WallpaperService,
    FavoritesService,
    ColorsService,
    RatingsService,
    AuthenticationService,
  ],
  controllers: [
    UsersController,
    CategoriesController,
    WallpapersController,
    FavoritesController,
    ColorsController,
    RatingsController,
    AuthenticationController,
  ],
})
export class AppModule {
  constructor(private connection: Connection) {}
}
