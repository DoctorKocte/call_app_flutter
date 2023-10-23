import 'package:call_app/components/primary_button.dart';
import 'package:call_app/components/segment_control.dart';
import 'package:call_app/features/auth/domain/repository/auth_repository.dart';
import 'package:call_app/features/auth/domain/service/auth_service.dart';
import 'package:call_app/features/auth/models/login_model.dart';
import 'package:call_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:call_app/features/auth/presentation/bloc/auth_event.dart';
import 'package:call_app/features/auth/presentation/login/login_text_fields_view.dart';
import 'package:call_app/features/auth/presentation/login/login_view.dart';
import 'package:call_app/features/auth/presentation/registration/registration_screen.dart';
import 'package:call_app/network/endpoint_config.dart';
import 'package:call_app/network/request_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_ui/open_ui.dart';

enum LoginType {
  email,
  phoneNumber;
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

  final loginModel = LoginModel(username: '', password: '');
  bool isLoading = false;
  LoginType selectedLoginType = LoginType.email;
  ValueNotifier<bool> isLoginLoading = ValueNotifier(false);
  ValueNotifier<bool> isLoginTypeChanged = ValueNotifier(false);

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
    final spacer = appTheme.spacer;
    final tabsTitles = ['Username', 'Phone number'];

    return BlocProvider<AuthBloc>(
        create: (context) => AuthBloc(authService: authService),
        child: Scaffold(
            appBar: AppBar(
                toolbarHeight: 0,
                surfaceTintColor: Colors.transparent,
                backgroundColor: Colors.transparent,
                systemOverlayStyle: SystemUiOverlayStyle.dark),
            backgroundColor: colorScheme.background.main,
            body: SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.fromLTRB(
                        spacer.sp20, 0, spacer.sp20, spacer.sp40),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 44),
                          Text('Welcome Back', style: textStyles.graphik24bold),
                          const SizedBox(height: 32),
                          Text('To use your account,\nyou should log in first',
                              style: textStyles.graphik16semibold.copyWith(
                                  height: 0.9,
                                  color:
                                      colorScheme.textColor.disableSecondary)),
                          const SizedBox(height: 56),
                          SegmentControl(
                            tabsTitles: tabsTitles,
                            onTap: (tabIndex) {
                              setState(() {
                                isLoginTypeChanged.value = true;
                                loginModel
                                  ..username = ''
                                  ..password = '';
                                selectedLoginType =
                                    tabIndex == LoginType.email.index
                                        ? LoginType.email
                                        : LoginType.phoneNumber;
                              });
                            },
                          ),
                          const SizedBox(height: 42),
                          ValueListenableBuilder(
                              valueListenable: isLoginTypeChanged,
                              builder: (context, value, child) {
                                return LoginTextFieldsView(
                                    loginType: selectedLoginType,
                                    loginModel: loginModel,
                                    tabsTitles: tabsTitles,
                                    onChanged: (loginModel) {
                                      setState(() {
                                        this.loginModel.username =
                                            loginModel.username;
                                        this.loginModel.password =
                                            loginModel.password;
                                        isLoginLoading.value = false;
                                      });
                                    });
                              }),
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
                                  color: (loginModel.username.isEmpty ||
                                          loginModel.password.isEmpty)
                                      ? colorScheme.background.disableGray
                                      : colorScheme.background.blue,
                                  titleColor: (loginModel.username.isEmpty ||
                                          loginModel.password.isEmpty)
                                      ? colorScheme.textColor.disableSecondary
                                      : colorScheme.textColor.white,
                                  onPressed: () {
                                    isLoginLoading.value =
                                        !isLoginLoading.value;
                                    context.read<AuthBloc>().add(
                                        AuthLoginEvent(loginModel: loginModel));
                                  },
                                );
                              });
                            },
                          ),
                          const SizedBox(height: 16),
                          Center(
                              child: Text('or',
                                  style: textStyles.graphik15normal.copyWith(
                                      color: colorScheme
                                          .textColor.disableSecondary))),
                          const SizedBox(height: 16),
                          Center(
                              child: Text('Sign in with Google or Facebook',
                                  style: textStyles.graphik15normal.copyWith(
                                      color: colorScheme
                                          .textColor.disableSecondary))),
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
                                    style: textStyles.graphik15semibold
                                        .copyWith(
                                            color: colorScheme
                                                .textColor.disableSecondary)),
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
                                        style: textStyles.graphik15semibold
                                            .copyWith(
                                                color: colorScheme
                                                    .textColor.blue)))
                              ]),
                        ])))));
  }
}
