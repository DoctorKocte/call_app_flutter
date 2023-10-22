import 'package:call_app/features/auth/domain/repository/auth_repository.dart';
import 'package:call_app/features/auth/models/login_model.dart';
import 'package:call_app/features/auth/models/token_model.dart';
import 'package:dartz/dartz.dart';

final class AuthService {
  const AuthService({required this.authRepository});

  final AuthRepository authRepository;

  Future<Either<String, TokenModel>> login(
      {required LoginModel loginModel}) async {
    final result = await authRepository.login(loginModel: loginModel);

    return result.fold(
      Left.new,
      Right.new,
    );
  }

  Future<Either<String, TokenModel>> register(
      {required RegisterModel registerModel}) async {
    final result = await authRepository.register(registerModel: registerModel);

    return result.fold(
      Left.new,
      Right.new,
    );
  }
}
