enum ApiService {
  changeProfilePhoto,
  getUserData,
  getUsers,
  register,
  login;

  String get baseEndpoint => 'https://super-mybg.onrender.com';

  String get endpoint {
    const auth = '/auth';
    switch (this) {
      case ApiService.getUsers:
        return '$baseEndpoint$auth/users';
      case ApiService.login:
        return '$baseEndpoint$auth/login';
      case ApiService.register:
        return '$baseEndpoint$auth/registration';
      case ApiService.getUserData:
        return '$baseEndpoint$auth/getUserData';
      case ApiService.changeProfilePhoto:
        return '$baseEndpoint$auth/changeProfileImage';
    }
  }
}

class EndpointConfig {
  String get getUsersEndpoint => ApiService.getUsers.endpoint;
  String get loginEndpoint => ApiService.login.endpoint;
  String get registerEndpoint => ApiService.register.endpoint;
  String get userDataEndpoint => ApiService.getUserData.endpoint;
  String get changeProfileImageEndpoint => ApiService.changeProfilePhoto.endpoint;
}
