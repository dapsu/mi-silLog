import { MiddlewareConsumer, Module, NestModule } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { AppController } from '@src/app.controller';
import { AppService } from '@src/app.service';
import { LoggerMiddleware } from '@src/middlewares/logger/logger.middleware';
import { modules } from '@src/modules';
import { PrismaService } from '@src/prisma/prisma.service';

@Module({
  imports: [ConfigModule.forRoot(), ...modules],
  controllers: [AppController],
  providers: [AppService, PrismaService],
})
export class AppModule implements NestModule {
  configure(consumer: MiddlewareConsumer) {
    consumer.apply(LoggerMiddleware).forRoutes('*');
  }
}
