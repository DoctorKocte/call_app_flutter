import 'dart:async';

import 'package:call_app/features/profile/user_update_bloc/user_update_event.dart';
import 'package:call_app/features/profile/user_update_bloc/user_update_state.dart';
import 'package:call_app/services/users/user_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserUpdateBloc extends Bloc<UserUpdateEvent, UserUpdateState> {
  UserUpdateBloc({required this.usersRepository}) : super(UserUpdateSuccessState()) {
    on<UserChangeImageEvent>(_changeImage);
  }

  final UserRepository usersRepository;

  Future<void> _changeImage(
    UserChangeImageEvent event,
    Emitter<UserUpdateState> emit
  ) async {
      emit(UserUpdateLoadingState());
      try {
        final result = await usersRepository.changeProfileImage(imageString: event.imageString);

        result.fold(
          (l) => emit(UserUpdateErrorState()),
          (r) => emit(UserUpdateSuccessState())
        );
      } catch (e) {
        emit(UserUpdateErrorState());
      }
  }
}
