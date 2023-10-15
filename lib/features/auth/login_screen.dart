import 'package:call_app/features/auth/auth_bloc/auth_bloc.dart';
import 'package:call_app/features/auth/auth_bloc/auth_event.dart';
import 'package:call_app/features/auth/auth_bloc/auth_state.dart';
import 'package:call_app/features/auth/login_button.dart';
import 'package:call_app/features/auth/text_field.dart';
import 'package:call_app/features/users/users_screen.dart';
import 'package:call_app/services/auth/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final authRepository = AuthRepository();

  String username = '';
  String password = '';
  bool isLoading = false;
  ValueNotifier<bool> isLoginLoading = ValueNotifier(false);

   @override
   void dispose() {
    isLoginLoading.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthBloc>(
        create: (context) => AuthBloc(authRepository: authRepository),
        child: Scaffold(
            appBar: AppBar(
                title: const Text('Login'),
                centerTitle: true,
                backgroundColor: Colors.transparent),
            backgroundColor: const Color.fromARGB(255, 216, 228, 229),
            body: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 28),
                child: Column(children: [
                  InputTextField(
                    textFieldTitle: 'Login',
                    //type: TextFieldType.username,
                    onChanged: (value) {
                      // valuenotifier
                      setState(() {
                        username = value;
                      });
                    },
                  ),
                  InputTextField(
                    textFieldTitle: 'Password',
                    //type: TextFieldType.password,
                    isObscureTextNeeded: true,
                    onChanged: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                  ),
                  const Spacer(),
                  LoginView(isLoginLoading: isLoginLoading),
                   ValueListenableBuilder(
                    valueListenable: isLoginLoading,
                    builder: (context, value, child) {
                      return  Builder(builder: (context) {
                    return LoginButton(
                      buttonText: 'Login',
                      isLoading: isLoginLoading.value,
                      onPressed: () {                    
                        if (isLoginLoading.value) {
                          isLoginLoading.value = false;
                        } else {
                          isLoginLoading.value = true;
                          final AuthBloc authBloc = BlocProvider.of(context);
                          authBloc.add(AuthLoginEvent(username: username, password: password));
                        }
                      }
                      ,
                    );
                  });
                   },
                ),
                 
                ]))));
  }
}

class LoginView extends StatelessWidget {
  const LoginView({required this.isLoginLoading, super.key});

  final ValueNotifier<bool> isLoginLoading;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthAuthorizedState) {
            isLoginLoading.value = false;
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => MyHomePage()));
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
            // ScaffoldMessenger.of(context).showSnackBar(
            //   SnackBar(
            //     content: Text(state.errorString),
            //   ),
            // );
          } else {
            isLoginLoading.value = true;
          }},
          child: const Spacer()
        //}
        // builder: (context, state) {
        //   isLoginLoading.value = state is AuthLoadingState;
        //   return const Spacer();
        // }
      );    
  }
}
