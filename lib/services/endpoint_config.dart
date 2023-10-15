enum ApiService {
    getUsers,
    login;

    String get baseEndpoint => 'https://super-mybg.onrender.com';

    String get endpoint {
      const auth = '/auth';
      switch (this) {
        case ApiService.getUsers:
          return '$baseEndpoint$auth/users';
        case ApiService.login:
          return '$baseEndpoint$auth/login';
      }
    }
}

class EndpointConfig {
    String get getUsersEndpoint => ApiService.getUsers.endpoint;
    String get loginEndpoint => ApiService.login.endpoint;
}
