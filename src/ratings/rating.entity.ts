import { User } from 'src/users/user.entity';
import { Wallpaper } from 'src/wallpaper/wallpaper.entity';
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

// @Entity({ name: 'tbl_rating' })
export class Rating {
  @PrimaryGeneratedColumn()
  id_rating: number;

  @Column({ nullable: false, default: 0 })
  rating_star: number;

  @Column({ nullable: false, default: 1 })
  rating_status: number;

  @CreateDateColumn()
  create_at: Date;

  @UpdateDateColumn()
  update_at: Date;

  @DeleteDateColumn()
  delete_at: Date;

  @ManyToOne(() => User, (user) => user.favorites)
  @JoinColumn({ name: 'user_id' })
  user: User;

  @ManyToOne(() => Wallpaper, (wallpaper) => wallpaper.favorites)
  @JoinColumn({ name: 'wallpaper_id' })
  wallpaper: Wallpaper;
}
