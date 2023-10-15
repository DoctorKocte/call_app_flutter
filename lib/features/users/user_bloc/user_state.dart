import 'package:call_app/features/users/models/users_model.dart';

sealed class UserState {
  const UserState();
}

class UserEmptyState extends UserState {}

class UserLoadingState extends UserState {}

class UserDataState extends UserState {
  UserDataState({required this.usersData});
  Users usersData;
}

class UserErrorState extends UserState {}
