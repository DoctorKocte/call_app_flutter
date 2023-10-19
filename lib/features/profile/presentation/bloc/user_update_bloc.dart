import 'dart:async';

import 'package:call_app/features/main/domain/service/user_service.dart';
import 'package:call_app/features/profile/presentation/bloc/user_update_event.dart';
import 'package:call_app/features/profile/presentation/bloc/user_update_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserUpdateBloc extends Bloc<UserUpdateEvent, UserUpdateState> {
  UserUpdateBloc({required this.userService}) : super(UserUpdateSuccessState()) {
    on<UserChangeImageEvent>(_changeImage);
  }

  final UserService userService;

  Future<void> _changeImage(
    UserChangeImageEvent event,
    Emitter<UserUpdateState> emit
  ) async {
      emit(UserUpdateLoadingState());
      try {
        final result = await userService.changeProfileImage(imageString: event.imageString);

        result.fold(
          (l) => emit(UserUpdateErrorState()),
          (r) => emit(UserUpdateSuccessState())
        );
      } catch (e) {
        emit(UserUpdateErrorState());
      }
  }
}
