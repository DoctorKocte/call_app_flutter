import 'package:call_app/features/auth/models/token_model.dart';
import 'package:call_app/services/auth/auth_provider.dart';
import 'package:dartz/dartz.dart';

class AuthRepository {
  final AuthProvider _userProvider = AuthProvider();

  Future<Either<String, TokenModel>> login({required String username, required String password}) {
    return _userProvider.login(username: username, password: password);
  }
}
