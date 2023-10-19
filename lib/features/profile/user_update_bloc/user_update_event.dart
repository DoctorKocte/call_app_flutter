sealed class UserUpdateEvent {
  const UserUpdateEvent();
}

class UserChangeImageEvent extends UserUpdateEvent {
  UserChangeImageEvent({required this.imageString});

  String imageString;
}
