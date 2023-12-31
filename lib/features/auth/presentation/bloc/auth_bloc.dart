import 'package:call_app/features/auth/domain/service/auth_service.dart';
import 'package:call_app/features/auth/presentation/bloc/auth_event.dart';
import 'package:call_app/features/auth/presentation/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required this.authService}) : super(AuthLoadingState()) {
    on<AuthLoginEvent>(_login);
    on<AuthRegisterEvent>(_register);
  }

  final AuthService authService;

  Future<void> _login(
    AuthLoginEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoadingState());
    final result = await authService.login(loginModel: event.loginModel);

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
    final result =
        await authService.register(registerModel: event.registerModel);

    result.fold(
      (l) => emit(AuthErrorState(errorString: l)),
      (r) => emit(AuthAuthorizedState(tokenModel: r)),
    );
  }
}
