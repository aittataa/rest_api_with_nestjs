import { IsAlpha, IsNotEmpty } from 'class-validator';
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
  id_wallpaper: number;

  @Column({ nullable: false })
  @IsAlpha()
  @IsNotEmpty()
  wallpaper_image: string;

  @Column({ default: 0 })
  wallpaper_featured: number;

  @Column({ default: 'Portrait' })
  wallpaper_type: string;

  @Column({ default: 'Wallpaper' })
  wallpaper_tags: string;

  @Column()
  wallpaper_colors: string;

  @Column({ nullable: false, default: 0 })
  wallpaper_status: number;

  @CreateDateColumn()
  create_at: Date;

  @UpdateDateColumn()
  update_at: Date;

  @DeleteDateColumn()
  delete_at: Date;

  @ManyToOne(() => Category, (category) => category.wallpapers)
  @JoinColumn({ name: 'category_id' })
  category: Category;
}
