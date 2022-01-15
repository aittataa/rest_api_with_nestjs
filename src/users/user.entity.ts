import { Favorite } from 'src/favorites/favorite.entity';
import * as bcrypt from 'bcrypt';
import {
  BeforeInsert,
  Column,
  CreateDateColumn,
  DeleteDateColumn,
  Entity,
  OneToMany,
  PrimaryGeneratedColumn,
  UpdateDateColumn,
} from 'typeorm';

@Entity({ name: 'tbl_user' })
export class User {
  @PrimaryGeneratedColumn()
  id_user: number;

  @Column({ nullable: false })
  user_name: string;

  @Column({ nullable: false })
  user_username: string;

  @Column({ nullable: false, unique: true })
  user_email: string;

  @BeforeInsert()
  async hashPassword() {
    this.user_password = await bcrypt.hash(
      this.user_password,
      Number(process.env.HASH_SALT),
    );
  }
  @Column({ nullable: false })
  user_password: string;

  @Column({ nullable: false })
  user_phone: string;

  @Column({ nullable: false, default: 'User' })
  user_type: string;

  @Column({ nullable: false })
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
}
