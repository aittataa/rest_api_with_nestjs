import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Connection } from 'typeorm';
import { CategoriesModule } from './categories/categories.module';
import { Category } from './categories/category.entity';
import { Wallpaper } from './wallpaper/wallpaper.entity';
import { WallpaperModule } from './wallpaper/wallpapers.module';
import { FavoriteModule } from './favorite/favorite.module';

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
    TypeOrmModule.forFeature([Category, Wallpaper]),
    CategoriesModule,
    WallpaperModule,
    FavoriteModule,
  ],
})
export class AppModule {
  constructor(private connection: Connection) {}
}
