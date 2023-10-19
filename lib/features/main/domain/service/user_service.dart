import 'package:call_app/features/main/domain/repository/user_repository.dart';
import 'package:call_app/features/users/models/user_model.dart';
import 'package:dartz/dartz.dart';

final class UserService {
  const UserService({required this.userRepository});

  final UserRepository userRepository;

  Future<Either<String, User>> getUserData() async {
    final result = await userRepository.getUserData();
    return result.fold(
      Left.new,
      Right.new,
    );
  }

  Future<Either<String, void>> changeProfileImage({required String imageString}) async {
     final result = await userRepository.changeProfileImage(imageString: imageString);
    return result.fold(
      Left.new,
      Right.new,
    );
  }
}
