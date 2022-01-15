import {
  Column,
  CreateDateColumn,
  DeleteDateColumn,
  Entity,
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

  @Column({ nullable: false })
  user_email: string;

  @Column({ nullable: false })
  user_password: string;

  @Column({ nullable: false })
  user_phone: string;

  @Column({ nullable: false })
  user_type: string;

  @Column({ nullable: false, default: 0 })
  user_status: number;

  @CreateDateColumn()
  create_at: Date;

  @UpdateDateColumn()
  update_at: Date;

  @DeleteDateColumn()
  delete_at: Date;
}
