class LoginModel {
  LoginModel({required this.username, required this.password});

  String username;
  String password;
  String? firstName;
  String? lastName;
  String? phoneNumber;
}

class RegisterModel {
  RegisterModel(
      {required this.username,
      required this.password,
      required this.phoneNumber});

  String username;
  String password;
  String phoneNumber;
  String? firstName;
  String? lastName;
}
