import 'package:call_app/features/users/models/user_model.dart';
import 'package:call_app/features/users/models/users_model.dart';
import 'package:call_app/services/users/user_api_provider.dart';
import 'package:dartz/dartz.dart';

class UserRepository {
  final UserProvider _userProvider = UserProvider();

  Future<Either<String, Users>> getAllUsers() => _userProvider.getUsers();
  Future<Either<String, User>> getUserData() => _userProvider.getUserData();
}
