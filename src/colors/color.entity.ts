import {
  Column,
  CreateDateColumn,
  DeleteDateColumn,
  Entity,
  PrimaryGeneratedColumn,
  UpdateDateColumn,
} from 'typeorm';

@Entity({ name: 'tbl_color' })
export class Color {
  @PrimaryGeneratedColumn()
  id_color: number;

  @Column({ nullable: false })
  color_name: string;

  @Column({ nullable: false, unique: true })
  color_code: string;

  @Column({ nullable: false, default: 1 })
  color_status: number;

  @CreateDateColumn()
  create_at: Date;

  @UpdateDateColumn()
  update_at: Date;

  @DeleteDateColumn()
  delete_at: Date;

  // @OneToMany(() => Wallpaper, (wallpaper) => wallpaper.category)
  // wallpapers: Wallpaper[];
}
