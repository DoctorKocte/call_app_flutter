abstract class AuthEvent {}

class AuthLoginEvent extends AuthEvent {
  AuthLoginEvent({required this.username, required this.password});

  String username;
  String password;
}

class AuthRegisterEvent extends AuthEvent {
  AuthRegisterEvent({
    required this.username, 
    required this.password,
    required this.phoneNumber,
    this.firstName,
    this.lastName
  });

  String username;
  String password;
  String phoneNumber;
  String? firstName;
  String? lastName;
}
