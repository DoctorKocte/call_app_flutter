import 'package:call_app/components/primary_button.dart';
import 'package:call_app/components/text_field.dart';
import 'package:call_app/features/auth/domain/repository/auth_repository.dart';
import 'package:call_app/features/auth/domain/service/auth_service.dart';
import 'package:call_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:call_app/features/auth/presentation/bloc/auth_event.dart';
import 'package:call_app/features/auth/presentation/bloc/auth_state.dart';
import 'package:call_app/features/main/presentation/main_screen.dart';
import 'package:call_app/network/endpoint_config.dart';
import 'package:call_app/network/request_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_ui/open_ui.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen(
      {required this.requestService, required this.endpointConfig, super.key});

  final RequestService requestService;
  final EndpointConfig endpointConfig;

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  late AuthService authService;

  String username = '';
  String password = '';
  String phoneNumber = '';
  String? lastName;
  String? firstName;
  bool isLoading = false;
  ValueNotifier<bool> isLoginLoading = ValueNotifier(false);

  @override
  void initState() {
    authService = AuthService(
        authRepository: AuthRepository(
            requestService: widget.requestService,
            endpointConfig: widget.endpointConfig));
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
    final textStyles = appTheme.textStyles;

    return BlocProvider<AuthBloc>(
        create: (context) => AuthBloc(authService: authService),
        child: Scaffold(
            appBar: AppBar(
              foregroundColor: Colors.black,
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
                    Text('Hi there!',
                        textAlign: TextAlign.left,
                        style: textStyles.graphik24bold),
                    const SizedBox(height: 32),
                    Text('To use our app, you need to\nregister first',
                        style: textStyles
                            .withColor(colorScheme.textColor.disableSecondary)
                            .graphik16semibold),
                    const SizedBox(height: 56),
                    InputTextField(
                      textFieldTitle: 'Login',
                      onChanged: (value) {
                        setState(() {
                          username = value;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    InputTextField(
                      textFieldTitle: 'Password',
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
                      onChanged: (value) {
                        setState(() {
                          firstName = value;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    InputTextField(
                      textFieldTitle: 'Last name (optional)',
                      onChanged: (value) {
                        setState(() {
                          lastName = value;
                        });
                      },
                    ),
                    const SizedBox(height: 20),
                    InputTextField(
                      textFieldTitle: 'Phone number',
                      onChanged: (value) {
                        setState(() {
                          phoneNumber = value;
                        });
                      },
                    ),
                    const SizedBox(height: 44),
                    RegistrationView(
                      isLoginLoading: isLoginLoading,
                      requestService: widget.requestService,
                      endpointConfig: widget.endpointConfig,
                    ),
                    ValueListenableBuilder(
                      valueListenable: isLoginLoading,
                      builder: (context, value, child) {
                        return Builder(builder: (context) {
                          return PrimaryButton(
                            buttonText: 'Register',
                            isLoading: isLoginLoading.value,
                            color: colorScheme.background.blue,
                            titleColor: colorScheme.textColor.white,
                            onPressed: () {
                              if (isLoginLoading.value) {
                                isLoginLoading.value = false;
                              } else {
                                isLoginLoading.value = true;
                                final AuthBloc authBloc =
                                    BlocProvider.of(context);
                                authBloc.add(AuthRegisterEvent(
                                    username: username,
                                    password: password,
                                    phoneNumber: phoneNumber,
                                    firstName: firstName,
                                    lastName: lastName));
                              }
                            },
                          );
                        });
                      },
                    ),
                    const SizedBox(height: 24),
                    PrimaryButton(
                        buttonText: 'Sign Up with Google',
                        color: colorScheme.background.lightGray,
                        onPressed: () {})
                  ]),
            ))));
  }
}

class RegistrationView extends StatelessWidget {
  const RegistrationView(
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
                      endpointConfig: endpointConfig,
                    )));
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
