import { UsersModule } from '@src/modules/users/users.module';
import { AuthModule } from '@src/modules/auth/auth.module';
import { PrismaModule } from '@src/modules/prisma/prisma.module';

export const modules = [UsersModule, AuthModule, PrismaModule];
