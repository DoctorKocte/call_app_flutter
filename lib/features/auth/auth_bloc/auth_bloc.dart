import 'package:call_app/features/auth/auth_bloc/auth_event.dart';
import 'package:call_app/features/auth/auth_bloc/auth_state.dart';
import 'package:call_app/services/auth/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required this.authRepository}) : super(AuthLoadingState()) {
    on<AuthLoginEvent>(_login);
    on<AuthRegisterEvent>(_register);
  }

  final AuthRepository authRepository;

  Future<void> _login(
    AuthLoginEvent event,
    Emitter<AuthState> emit,
  ) async {
      emit(AuthLoadingState());
      final result = await authRepository.login(
          username: event.username, password: event.password);

      result.fold(
        (l) => emit(AuthErrorState(errorString: l)),
        (r) => emit(AuthAuthorizedState(tokenModel: r)),
      );
  }

  Future<void> _register(
    AuthRegisterEvent event,
    Emitter<AuthState> emit,
  ) async {
      emit(AuthLoadingState());
      final result = await authRepository.register(
          username: event.username,
          password: event.password,
          phoneNumber: event.phoneNumber,
          firstName: event.firstName,
          lastName: event.lastName);

      result.fold(
        (l) => emit(AuthErrorState(errorString: l)),
        (r) => emit(AuthAuthorizedState(tokenModel: r)),
      );
  }
}
