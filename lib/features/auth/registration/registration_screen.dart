import 'package:call_app/assets/fonts.gen.dart';
import 'package:call_app/features/auth/auth_bloc/auth_bloc.dart';
import 'package:call_app/features/auth/auth_bloc/auth_event.dart';
import 'package:call_app/features/auth/auth_bloc/auth_state.dart';
import 'package:call_app/features/auth/login_button.dart';
import 'package:call_app/features/auth/text_field.dart';
import 'package:call_app/features/users/users_screen.dart';
import 'package:call_app/services/auth/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_ui/open_ui.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final authRepository = AuthRepository();

  String username = '';
  String password = '';
  String phoneNumber= '';
  String? lastName;
  String? firstName;
  bool isLoading = false;
  ValueNotifier<bool> isLoginLoading = ValueNotifier(false);

  @override
  void initState() {
     super.initState();
  }

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
              foregroundColor: Colors.black,
              surfaceTintColor: Colors.transparent,
              backgroundColor: Colors.transparent,
              systemOverlayStyle: SystemUiOverlayStyle.dark,
            ),
            backgroundColor: colorScheme.background.main,
            body: SingleChildScrollView(child: 
            Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Hi there!',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: FontFamily.graphik,
                              fontSize: 24,
                              fontWeight: FontWeight.bold)),
                      const SizedBox(height: 32),
                      Text('To use our app, you need to\nregister first',
                          style: TextStyle(
                              fontFamily: FontFamily.graphik,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: colorScheme.textColor.disableSecondary)),
                      const SizedBox(height: 56),
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
                      const SizedBox(height: 20),
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
                      const SizedBox(height: 20),
                      InputTextField(
                        textFieldTitle: 'First name (optional)',
                        //type: TextFieldType.password,
                        isObscureTextNeeded: true,
                        onChanged: (value) {
                          setState(() {
                            firstName = value;
                          });
                        },
                      ),
                      const SizedBox(height: 20),
                      InputTextField(
                        textFieldTitle: 'Last name (optional)',
                        //type: TextFieldType.password,
                        isObscureTextNeeded: true,
                        onChanged: (value) {
                          setState(() {
                            lastName = value;
                          });
                        },
                      ),
                      const SizedBox(height: 20),
                      InputTextField(
                        textFieldTitle: 'Phone number',
                        //type: TextFieldType.password,
                        isObscureTextNeeded: true,
                        onChanged: (value) {
                          setState(() {
                            phoneNumber = value;
                          });
                        },
                      ),
                      const SizedBox(height: 44),
                      RegistrationView(isLoginLoading: isLoginLoading),
                      ValueListenableBuilder(
                        valueListenable: isLoginLoading,
                        builder: (context, value, child) {
                          return Builder(builder: (context) {
                            return LoginButton(
                              buttonText: 'Register',
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
                                  final AuthBloc authBloc = BlocProvider.of(context);
                                  authBloc.add(AuthRegisterEvent(
                                      username: username,
                                      password: password,
                                      phoneNumber: phoneNumber,
                                      firstName: firstName,
                                      lastName: lastName
                                  ));
                                }
                              },
                            );
                          });
                        },
                      ),
                    const SizedBox(height: 24),
                    LoginButton(
                                buttonText: 'Sign Up with Google',
                                color: colorScheme.background.lightGray,
                                textStyle: TextStyle(
                                  fontFamily: FontFamily.graphik,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  color: colorScheme.textColor.black,
                                ),
                                onPressed: () {})
                      ]),
                     
                    ))));
  }
}

class RegistrationView extends StatelessWidget {
  const RegistrationView({required this.isLoginLoading, super.key});

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
