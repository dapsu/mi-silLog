import { Controller, Post, Delete } from '@nestjs/common';
import { AuthService } from '@src/modules/auth/auth.service';
import { UsersService } from './users.service';

@Controller('users')
export class UsersController {
  constructor(
    private readonly usersService: UsersService,
    private readonly authService: AuthService,
  ) {}

  @Post('signup')
  signUp() {
    return 'TODO: Create signup controller';
  }

  @Post('login')
  logIn() {
    return 'TODO: Create login controller';
  }

  @Post('logout')
  logOut() {
    return 'TODO: Create logout controller';
  }

  @Delete('withdraw-account')
  withdrawAccount() {
    return 'TODO: Create withdraw account controller';
  }
}
