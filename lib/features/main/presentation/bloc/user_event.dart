sealed class UsersEvent {}

class UsersLoadEvent extends UsersEvent {}

class UsersClearEvent extends UsersEvent {}

sealed class UserEvent {}

class UserLoadEvent extends UserEvent {}

class UserChangeImageEvent extends UserEvent {}
