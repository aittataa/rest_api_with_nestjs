import { Category } from 'src/categories/category.entity';
import {
  Column,
  CreateDateColumn,
  Entity,
  JoinColumn,
  ManyToOne,
  PrimaryGeneratedColumn,
} from 'typeorm';

@Entity({ name: 'tbl_wallpaper' })
export class Wallpaper {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  featured: number;

  @Column({ default: 'Portrait' })
  wallpaper_type: string;

  @CreateDateColumn()
  image_date: Date;

  @Column({ nullable: true })
  image: string;

  @Column()
  wall_tags: string;

  @Column()
  wall_colors: string;

  @Column()
  total_rate: number;

  @Column()
  rate_avg: number;

  @Column()
  total_views: number;

  @Column()
  total_download: number;

  @ManyToOne(() => Category, (category) => category.wallpapers)
  @JoinColumn({ name: 'cat_id' })
  category: Category;
}
