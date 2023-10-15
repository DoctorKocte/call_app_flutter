abstract class AuthEvent {}

class AuthLoginEvent extends AuthEvent {
  AuthLoginEvent({required this.username, required this.password});

  String username;
  String password;
}
