sealed class UserUpdateState {
  const UserUpdateState();
}

class UserUpdateErrorState extends UserUpdateState {}

class UserUpdateLoadingState extends UserUpdateState {}

class UserUpdateSuccessState extends UserUpdateState {}
