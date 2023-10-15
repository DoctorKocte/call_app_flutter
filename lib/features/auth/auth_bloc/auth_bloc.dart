import 'package:call_app/features/auth/auth_bloc/auth_event.dart';
import 'package:call_app/features/auth/auth_bloc/auth_state.dart';
import 'package:call_app/services/auth/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required this.authRepository}) : super(AuthLoadingState()) {
    on<AuthEvent>(_login);
  }

  final AuthRepository authRepository;

  Future<void> _login(
    AuthEvent event,
    Emitter<AuthState> emit,
  ) async {
      if (event is AuthLoginEvent) {
        emit(AuthLoadingState());
        final result = await authRepository.login(username: event.username, password: event.password);

        result.fold(
          (l) => emit(AuthErrorState(errorString: l)),
          (r) => emit(AuthAuthorizedState(tokenModel: r)),
        );
    }
  }
}
