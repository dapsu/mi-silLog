import { NestFactory } from '@nestjs/core';
import { AppModule } from '@src/app.module';
import { HttpExceptionFilter } from '@src/filters/http-exception.filter';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  const PORT = process.env.PORT;
  app.useGlobalFilters(new HttpExceptionFilter());
  await app.listen(PORT);
}
bootstrap();
