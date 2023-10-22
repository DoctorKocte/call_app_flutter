import 'package:call_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:call_app/features/auth/presentation/bloc/auth_state.dart';
import 'package:call_app/features/main/presentation/main_screen.dart';
import 'package:call_app/network/endpoint_config.dart';
import 'package:call_app/network/request_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView(
      {required this.isLoginLoading,
      required this.requestService,
      required this.endpointConfig,
      super.key});

  final ValueNotifier<bool> isLoginLoading;
  final RequestService requestService;
  final EndpointConfig endpointConfig;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthAuthorizedState) {
            isLoginLoading.value = false;
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) => MainScreen(
                    requestService: requestService,
                    endpointConfig: endpointConfig)));
          } else if (state is AuthErrorState) {
            isLoginLoading.value = false;
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                        title: const Center(child: Text('Error')),
                        content: Text(state.errorString),
                        actions: [
                          TextButton(
                              child: const Text('Ok'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              })
                        ]));
          } else {
            isLoginLoading.value = true;
          }
        },
        child: Container());
  }
}
