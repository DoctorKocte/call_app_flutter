import 'package:call_app/assets/fonts.gen.dart';
import 'package:call_app/features/auth/auth_bloc/auth_bloc.dart';
import 'package:call_app/features/auth/auth_bloc/auth_event.dart';
import 'package:call_app/features/auth/auth_bloc/auth_state.dart';
import 'package:call_app/features/auth/login_button.dart';
import 'package:call_app/features/auth/registration/registration_screen.dart';
import 'package:call_app/features/auth/segment_control.dart';
import 'package:call_app/features/auth/text_field.dart';
import 'package:call_app/features/users/users_screen.dart';
import 'package:call_app/services/auth/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_ui/open_ui.dart';

enum LoginType {
  email,
  phoneNumber;

  int get intValue => index;
}

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
  LoginType selectedLoginType = LoginType.email;
  ValueNotifier<bool> isLoginLoading = ValueNotifier(false);

  @override
  void dispose() {
    isLoginLoading.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    final colorScheme = appTheme.colorScheme;

    return BlocProvider<AuthBloc>(
        create: (context) => AuthBloc(authRepository: authRepository),
        child: Scaffold(
            appBar: AppBar(
              toolbarHeight: 0,
              surfaceTintColor: Colors.transparent,
              backgroundColor: Colors.transparent,
              systemOverlayStyle: SystemUiOverlayStyle.dark,
            ),
            backgroundColor: colorScheme.background.main,
            body: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 44),
                          const Text('Welcome Back',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontFamily: FontFamily.graphik,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold)),
                          const SizedBox(height: 32),
                          Text('To use your account,\nyou should log in first',
                              style: TextStyle(
                                  fontFamily: FontFamily.graphik,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color:
                                      colorScheme.textColor.disableSecondary)),
                          const SizedBox(height: 56),
                          MyStatefulWidget(
                            onTap: (tabIndex) {
                              if (tabIndex == LoginType.email.intValue) {
                                setState(() {
                                  selectedLoginType = LoginType.email;
                                });
                              } else {
                                setState(() {
                                  selectedLoginType = LoginType.phoneNumber;
                                });
                              }
                            },
                          ),
                          const SizedBox(height: 42),
                          LoginTextFieldsView(
                            loginType: selectedLoginType,
                            username: username,
                            password: password,
                            onChanged: (username, password) {
                              this.username = username;
                              this.password = password;
                            },
                          ),
                          const SizedBox(height: 56),
                          LoginView(isLoginLoading: isLoginLoading),
                          ValueListenableBuilder(
                            valueListenable: isLoginLoading,
                            builder: (context, value, child) {
                              return Builder(builder: (context) {
                                return LoginButton(
                                  buttonText: 'Login',
                                  isLoading: isLoginLoading.value,
                                  color: colorScheme.background.blue,
                                  textStyle: TextStyle(
                                    fontFamily: FontFamily.graphik,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: colorScheme.textColor.white,
                                  ),
                                  onPressed: () {
                                    if (isLoginLoading.value) {
                                      isLoginLoading.value = false;
                                    } else {
                                      isLoginLoading.value = true;
                                      final AuthBloc authBloc =
                                          BlocProvider.of(context);
                                      authBloc.add(AuthLoginEvent(
                                          username: username,
                                          password: password));
                                    }
                                  },
                                );
                              });
                            },
                          ),
                          const SizedBox(height: 16),
                          Center(
                              child: Text('or',
                                  style: TextStyle(
                                    fontFamily: FontFamily.graphik,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color:
                                        colorScheme.textColor.disableSecondary,
                                  ))),
                          const SizedBox(height: 16),
                          Center(
                              child: Text('Sign in with Google or Facebook',
                                  style: TextStyle(
                                    fontFamily: FontFamily.graphik,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color:
                                        colorScheme.textColor.disableSecondary,
                                  ))),
                          const SizedBox(height: 30),
                          Row(children: [
                            Expanded(
                                child: LoginButton(
                                    buttonText: 'Facebook',
                                    color: colorScheme.background.lightGray,
                                    textStyle: TextStyle(
                                      fontFamily: FontFamily.graphik,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                      color: colorScheme.textColor.black,
                                    ),
                                    onPressed: () {})),
                            const SizedBox(width: 16),
                            Expanded(
                                child: LoginButton(
                                    buttonText: 'Google',
                                    color: colorScheme.background.lightGray,
                                    textStyle: TextStyle(
                                      fontFamily: FontFamily.graphik,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                      color: colorScheme.textColor.black,
                                    ),
                                    onPressed: () {}))
                          ]),
                          const SizedBox(height: 16),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Do not have an account? ',
                                    style: TextStyle(
                                      fontFamily: FontFamily.graphik,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 15,
                                      color: colorScheme
                                          .textColor.disableSecondary,
                                    )),
                                GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const RegistrationScreen()));
                                    },
                                    child: Text('Sign up',
                                        style: TextStyle(
                                          fontFamily: FontFamily.graphik,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15,
                                          color: colorScheme.textColor.blue,
                                        )))
                              ]),
                        ])))));
  }
}

class LoginTextFieldsView extends StatefulWidget {
  LoginTextFieldsView(
      {required this.loginType,
      required this.username,
      required this.password,
      required this.onChanged, 
      super.key});

  final LoginType loginType;
  String username;
  String password;

  final Function(String, String) onChanged;

  @override
  State<LoginTextFieldsView> createState() => _LoginTextFieldsViewState();
}

class _LoginTextFieldsViewState extends State<LoginTextFieldsView> {

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      InputTextField(
        textFieldTitle: widget.loginType == LoginType.email ? 'Login' : 'Phone number',
        //type: TextFieldType.username,
        onChanged: (value) {
          // valuenotifier
         
          // setState(() {
          //   widget.username = value;
          // });
          widget.username = value;
          widget.onChanged(widget.username, widget.password);
        },
      ),
      SizedBox(height: 24),
      InputTextField(
        textFieldTitle: 'Password',
        //type: TextFieldType.password,
        isObscureTextNeeded: true,
        onChanged: (value) {
          // setState(() {
          //   widget.password = value;
          // });
          widget.password = value;
          widget.onChanged(widget.username, widget.password);
        },
      )
    ]);
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
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => MyHomePage()));
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
          }
        },
        child: Container()
        //}
        // builder: (context, state) {
        //   isLoginLoading.value = state is AuthLoadingState;
        //   return const Spacer();
        // }
        );
  }
}
