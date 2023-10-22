import 'package:call_app/features/auth/models/login_model.dart';

sealed class AuthEvent {}

class AuthLoginEvent extends AuthEvent {
  AuthLoginEvent({required this.loginModel});

  LoginModel loginModel;
}

class AuthRegisterEvent extends AuthEvent {
  AuthRegisterEvent({required this.registerModel});

  RegisterModel registerModel;
}
