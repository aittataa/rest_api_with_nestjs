import { Favorite } from 'src/favorites/favorite.entity';
import * as bcrypt from 'bcrypt';
import {
  BeforeInsert,
  Column,
  CreateDateColumn,
  DeleteDateColumn,
  Entity,
  JoinTable,
  ManyToMany,
  OneToMany,
  PrimaryGeneratedColumn,
  UpdateDateColumn,
} from 'typeorm';
import { Rating } from 'src/ratings/rating.entity';
import { Wallpaper } from 'src/wallpaper/wallpaper.entity';

@Entity({ name: 'tbl_user' })
export class User {
  @PrimaryGeneratedColumn()
  id_user: number;

  @Column({ nullable: false })
  user_name: string;

  @Column({ nullable: false, unique: true })
  user_username: string;

  @Column({ nullable: false, unique: true })
  user_email: string;

  @Column({ nullable: false })
  user_password: string;

  @Column({ nullable: false })
  user_phone: string;

  @Column({ nullable: false, default: 'User' })
  user_type: string;

  @Column({ nullable: false, default: 'profile.png' })
  user_image: string;

  @Column({ nullable: false, default: 0 })
  user_status: number;

  @CreateDateColumn()
  create_at: Date;

  @UpdateDateColumn()
  update_at: Date;

  @DeleteDateColumn()
  delete_at: Date;

  @OneToMany(() => Favorite, (favorite) => favorite.user)
  favorites: Favorite[];

  @OneToMany(() => Rating, (rating) => rating.user)
  ratings: Rating[];
}
