import { IsNotEmpty, ValidateIf } from 'class-validator';
import { Wallpaper } from 'src/wallpaper/wallpaper.entity';
import { Column, Entity, OneToMany, PrimaryGeneratedColumn } from 'typeorm';

@Entity({ name: 'tbl_category' })
export class Category {
  @PrimaryGeneratedColumn()
  cid: number;

  @Column()
  @IsNotEmpty()
  category_name: string;

  @Column()
  @IsNotEmpty()
  category_image: string;

  @Column()
  status: number;

  @OneToMany(() => Wallpaper, (wallpaper) => wallpaper.category)
  wallpapers: Wallpaper[];
}
