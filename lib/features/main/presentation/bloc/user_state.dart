import 'package:call_app/features/main/models/user_model.dart';

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
