import { Wallpaper } from 'src/wallpaper/wallpaper.entity';
import {
  Column,
  CreateDateColumn,
  DeleteDateColumn,
  Entity,
  OneToMany,
  PrimaryGeneratedColumn,
  UpdateDateColumn,
} from 'typeorm';

@Entity({ name: 'tbl_category' })
export class Category {
  @PrimaryGeneratedColumn()
  id_category: number;

  @Column({ nullable: false })
  category_name: string;

  @Column({ nullable: false })
  category_image: string;

  @Column({ nullable: false, default: 1 })
  category_status: number;

  @CreateDateColumn()
  create_at: Date;

  @UpdateDateColumn()
  update_at: Date;

  @DeleteDateColumn()
  delete_at: Date;

  @OneToMany(() => Wallpaper, (wallpaper) => wallpaper.category)
  wallpapers: Wallpaper[];
}
