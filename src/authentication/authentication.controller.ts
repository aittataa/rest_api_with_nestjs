import { Body, Controller, Post } from '@nestjs/common';
import { User } from 'src/users/user.entity';
import { AuthenticationService } from './authentication.service';

@Controller('authentication')
export class AuthenticationController {
  constructor(private service: AuthenticationService) {}

  @Post('/login')
  loginUser(@Body() user: User) {
    return this.service.loginUser(user);
  }
}
