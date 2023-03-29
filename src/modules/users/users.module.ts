import { forwardRef, Module } from '@nestjs/common';
import { AuthModule } from '@src/modules/auth/auth.module';
import { PrismaService } from '@src/prisma/prisma.service';
import { UsersController } from './users.controller';
import { UsersService } from './users.service';

@Module({
  imports: [forwardRef(() => AuthModule)],
  controllers: [UsersController],
  providers: [UsersService, PrismaService],
  exports: [UsersService],
})
export class UsersModule {}
