import 'package:call_app/components/primary_button.dart';
import 'package:call_app/components/segment_control.dart';
import 'package:call_app/components/text_field.dart';
import 'package:call_app/features/auth/domain/repository/auth_repository.dart';
import 'package:call_app/features/auth/domain/service/auth_service.dart';
import 'package:call_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:call_app/features/auth/presentation/bloc/auth_event.dart';
import 'package:call_app/features/auth/presentation/bloc/auth_state.dart';
import 'package:call_app/features/auth/presentation/registration/registration_screen.dart';
import 'package:call_app/features/main/presentation/main_screen.dart';
import 'package:call_app/network/endpoint_config.dart';
import 'package:call_app/network/request_service.dart';
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
  const LoginScreen(
      {required this.requestService, required this.endpointConfig, super.key});

  final RequestService requestService;
  final EndpointConfig endpointConfig;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late AuthService authService;

  String username = '';
  String password = '';
  bool isLoading = false;
  LoginType selectedLoginType = LoginType.email;
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
              toolbarHeight: 0,
              surfaceTintColor: Colors.transparent,
              backgroundColor: Colors.transparent,
              systemOverlayStyle: SystemUiOverlayStyle.dark
            ),
            backgroundColor: colorScheme.background.main,
            body: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 44),
                          Text('Welcome Back',
                              textAlign: TextAlign.left,
                              style: textStyles.graphik24bold),
                          const SizedBox(height: 32),
                          Text('To use your account,\nyou should log in first',
                              style: textStyles                                  
                                  .withColor(
                                      colorScheme.textColor.disableSecondary)
                                  .graphik16semibold.copyWith(height: 0.9)),
                          const SizedBox(height: 56),
                          MyStatefulWidget(
                            tabsTitles: const ['Username', 'Phone number'],
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
                              setState(() {
                                this.username = username;
                                this.password = password;
                              });
                            },
                          ),
                          const SizedBox(height: 56),
                          LoginView(
                            isLoginLoading: isLoginLoading,
                            requestService: widget.requestService,
                            endpointConfig: widget.endpointConfig,
                          ),
                          ValueListenableBuilder(
                            valueListenable: isLoginLoading,
                            builder: (context, value, child) {
                              return Builder(builder: (context) {
                                return PrimaryButton(
                                  buttonText: 'Login',
                                  isLoading: isLoginLoading.value,
                                  color: (username.isEmpty || password.isEmpty)
                                      ? colorScheme.background.disableGray
                                      : colorScheme.background.blue,
                                  titleColor: (username.isEmpty ||
                                          password.isEmpty)
                                      ? colorScheme.textColor.disableSecondary
                                      : colorScheme.textColor.white,
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
                                  style: textStyles
                                      .withColor(colorScheme
                                          .textColor.disableSecondary)
                                      .graphik15normal)),
                          const SizedBox(height: 16),
                          Center(
                              child: Text('Sign in with Google or Facebook',
                                  style: textStyles
                                      .withColor(colorScheme
                                          .textColor.disableSecondary)
                                      .graphik15normal)),
                          const SizedBox(height: 30),
                          Row(children: [
                            Expanded(
                                child: PrimaryButton(
                                    buttonText: 'Facebook',
                                    color: colorScheme.background.lightGray,
                                    onPressed: () {})),
                            const SizedBox(width: 16),
                            Expanded(
                                child: PrimaryButton(
                                    buttonText: 'Google',
                                    color: colorScheme.background.lightGray,
                                    onPressed: () {}))
                          ]),
                          const SizedBox(height: 16),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Do not have an account? ',
                                    style: textStyles
                                        .withColor(colorScheme
                                            .textColor.disableSecondary)
                                        .graphik15semibold),
                                GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  RegistrationScreen(
                                                    requestService:
                                                        widget.requestService,
                                                    endpointConfig:
                                                        widget.endpointConfig,
                                                  )));
                                    },
                                    child: Text('Sign up',
                                        style: textStyles
                                            .withColor(
                                                colorScheme.textColor.blue)
                                            .graphik15semibold))
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
        textFieldTitle:
            widget.loginType == LoginType.email ? 'Login' : 'Phone number',
        onChanged: (value) {
          widget.username = value;
          widget.onChanged(widget.username, widget.password);
        },
        onClearButtonPressed: () {
          widget.username = '';
        },
      ),
      const SizedBox(height: 24),
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
        onClearButtonPressed: () {
          widget.password = '';
        },
      )
    ]);
  }
}

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
