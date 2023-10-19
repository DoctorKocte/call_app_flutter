import 'package:call_app/features/users/models/user_model.dart';
import 'package:call_app/features/users/models/users_model.dart';

sealed class UsersState {
  const UsersState();
}

class UsersEmptyState extends UsersState {}

class UsersLoadingState extends UsersState {}

class UsersDataState extends UsersState {
  UsersDataState({required this.usersData});
  Users usersData;
}

class UsersErrorState extends UsersState {}

sealed class UserState {
  const UserState();
}

class UserEmptyState extends UserState {}

class UserLoadingState extends UserState {}

class UserDataState extends UserState {
  UserDataState({required this.userData});
  User userData;
}

class UserErrorState extends UserState {}
