import 'package:call_app/features/auth/models/token_model.dart';

sealed class AuthState {
  const AuthState();
}

class AuthLoadingState extends AuthState {}

class AuthAuthorizedState extends AuthState {
  AuthAuthorizedState({required this.tokenModel});

  TokenModel tokenModel;  
}

class AuthErrorState extends AuthState {
  AuthErrorState({required this.errorString});

  String errorString;
}
