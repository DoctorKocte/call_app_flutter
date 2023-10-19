import 'package:call_app/features/auth/domain/repository/auth_repository.dart';
import 'package:call_app/features/auth/models/token_model.dart';
import 'package:dartz/dartz.dart';

final class AuthService {
  const AuthService({required this.authRepository});

  final AuthRepository authRepository;

  Future<Either<String, TokenModel>> login(
      {required String username, required String password}) async {
    final result =
        await authRepository.login(username: username, password: password);

    return result.fold(
      Left.new,
      Right.new,
    );
  }

  Future<Either<String, TokenModel>> register(
      {required String username,
      required String password,
      required String phoneNumber,
      String? firstName,
      String? lastName}) async {
    final result = await authRepository.register(
        username: username,
        password: password,
        phoneNumber: phoneNumber,
        firstName: firstName,
        lastName: lastName);

    return result.fold(
      Left.new,
      Right.new,
    );
  }
}
