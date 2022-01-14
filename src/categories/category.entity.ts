import { IsNotEmpty, IsString, ValidateIf } from 'class-validator';
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
  cid: number;

  @Column({ nullable: false })
  @IsString()
  @IsNotEmpty()
  category_name: string;

  @Column()
  category_image: string;

  @Column({ default: 1 })
  status: number;

  @CreateDateColumn()
  create_at: Date;

  @UpdateDateColumn()
  update_at: Date;

  @DeleteDateColumn()
  delete_at: Date;

  @OneToMany(() => Wallpaper, (wallpaper) => wallpaper.category)
  wallpapers: Wallpaper[];
}
function ApiModelProperty(arg0: { description: string; required: boolean }) {
  throw new Error('Function not implemented.');
}
