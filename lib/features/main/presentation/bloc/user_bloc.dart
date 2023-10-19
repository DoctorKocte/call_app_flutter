import 'dart:async';

import 'package:call_app/features/main/domain/service/user_service.dart';
import 'package:call_app/features/main/presentation/bloc/user_event.dart';
import 'package:call_app/features/main/presentation/bloc/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc({required this.userService}) : super(UserLoadingState()) {
    on<UserLoadEvent>(_onStarted);
    add(UserLoadEvent());
  }

  final UserService userService;

    Future<void> _onStarted(
    UserLoadEvent event,
    Emitter<UserState> emit,
  ) async {
      emit(UserLoadingState());
      try {
        final result = await userService.getUserData();

        result.fold(
          (l) => emit(UserErrorState()),
          (r) => emit(UserDataState(userData: r))
        );
      } catch (e) {
        emit(UserErrorState());
      }
  }
}
