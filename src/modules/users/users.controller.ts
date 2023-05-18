import { Controller, Post, Delete, Body } from '@nestjs/common';
import { AuthService } from '@src/modules/auth/auth.service';
import { UserRequestDto } from './dto/users.request.dto';
import { UsersService } from './users.service';

@Controller('users')
export class UsersController {
  constructor(
    private readonly usersService: UsersService,
    private readonly authService: AuthService,
  ) {}

  @Post('signup')
  async signUp(@Body() body: UserRequestDto) {
    return await this.usersService.signUp(body);
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
