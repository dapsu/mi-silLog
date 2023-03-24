import { Controller, Delete, Post } from '@nestjs/common';
import { AuthService } from './auth.service';

@Controller('auth')
export class AuthController {
  constructor(private readonly authService: AuthService) {}

  @Post('signup')
  signup(email: string, name: string, password: string) {
    return 'TODO: Create signup controller';
  }

  @Post('login')
  login(email: string, password: string) {
    return 'TODO: Create login controller';
  }

  @Post('logout')
  logout() {
    return 'TODO: Create logout controller';
  }

  @Delete('withdraw-account')
  withdrawAccount() {
    return 'TODO: Create withdraw account controller';
  }

  @Post('refresh-token')
  refreshToken() {
    return 'TODO: Create refresh token controller';
  }
}
