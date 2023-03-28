import { MiddlewareConsumer, Module, NestModule } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { AppController } from '@src/app.controller';
import { AppService } from '@src/app.service';
import { LoggerMiddleware } from '@src/middlewares/logger/logger.middleware';
import { AuthModule } from '@src/modules/auth/auth.module';
import { UsersModule } from '@src/modules/users/users.module';

@Module({
  imports: [ConfigModule.forRoot(), AuthModule, UsersModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule implements NestModule {
  configure(consumer: MiddlewareConsumer) {
    consumer.apply(LoggerMiddleware).forRoutes('*');
  }
}
