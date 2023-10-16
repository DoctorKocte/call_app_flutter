import 'package:call_app/features/auth/models/token_model.dart';
import 'package:call_app/services/auth/auth_provider.dart';
import 'package:dartz/dartz.dart';

class AuthRepository {
  final AuthProvider _authProvider = AuthProvider();

  Future<Either<String, TokenModel>> login({required String username, required String password}) {
    return _authProvider.login(username: username, password: password);
  }

  Future<Either<String, TokenModel>> register({
    required String username, 
    required String password,
    required String phoneNumber,
    String? firstName,
    String? lastName
    }) {
    return _authProvider.register(
      username: username,
      password: password,
      phoneNumber: phoneNumber,
      firstName: firstName,
      lastName: lastName
    );
  }
}
