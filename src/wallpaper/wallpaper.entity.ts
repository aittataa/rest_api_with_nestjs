import { Category } from 'src/categories/category.entity';
import {
  Column,
  CreateDateColumn,
  DeleteDateColumn,
  Entity,
  JoinColumn,
  ManyToOne,
  PrimaryGeneratedColumn,
  UpdateDateColumn,
} from 'typeorm';

@Entity({ name: 'tbl_wallpaper' })
export class Wallpaper {
  @PrimaryGeneratedColumn()
  id: number;

  @Column({ default: 0 })
  featured: number;

  @Column({ default: 'Portrait' })
  wallpaper_type: string;

  @Column()
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

  @CreateDateColumn()
  create_at: Date;

  @UpdateDateColumn()
  update_at: Date;

  @DeleteDateColumn()
  delete_at: Date;

  @ManyToOne(() => Category, (category) => category.wallpapers)
  @JoinColumn({ name: 'cat_id' })
  category: Category;
}
