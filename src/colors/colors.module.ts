import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Color } from './color.entity';
import { ColorsController } from './colors.controller';
import { ColorsService } from './colors.service';

@Module({
  imports: [TypeOrmModule.forFeature([Color])],
  providers: [ColorsService],
  controllers: [ColorsController],
})
export class ColorsModule {}
