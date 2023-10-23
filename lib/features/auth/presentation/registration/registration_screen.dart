import 'package:call_app/components/primary_button.dart';
import 'package:call_app/features/auth/domain/repository/auth_repository.dart';
import 'package:call_app/features/auth/domain/service/auth_service.dart';
import 'package:call_app/features/auth/models/login_model.dart';
import 'package:call_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:call_app/features/auth/presentation/bloc/auth_event.dart';
import 'package:call_app/features/auth/presentation/registration/registration_text_field_view.dart';
import 'package:call_app/features/auth/presentation/registration/registration_view.dart';
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

  final registerModel =
      RegisterModel(username: '', password: '', phoneNumber: '');
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
    final spacer = appTheme.spacer;

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
              padding:
                  EdgeInsets.fromLTRB(spacer.sp20, 0, spacer.sp20, spacer.sp40),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hi there!', style: textStyles.graphik24bold),
                    const SizedBox(height: 32),
                    Text('To use our app, you need to\nregister first',
                        style: textStyles.graphik16semibold.copyWith(
                            height: 1,
                            color: colorScheme.textColor.disableSecondary)),
                    const SizedBox(height: 56),
                    RegistrationTextFieldsView(
                        registerModel: registerModel,
                        onChanged: (registerModel) {
                          setState(() {
                            this.registerModel.username =
                                registerModel.username;
                            this.registerModel.password =
                                registerModel.password;
                            this.registerModel.phoneNumber =
                                registerModel.phoneNumber;
                            this.registerModel.firstName =
                                registerModel.firstName;
                            this.registerModel.lastName =
                                registerModel.lastName;
                            isLoginLoading.value = false;
                          });
                        }),
                    const SizedBox(height: 44),
                    RegistrationView(
                      isLoginLoading: isLoginLoading,
                      requestService: widget.requestService,
                      endpointConfig: widget.endpointConfig,
                    ),
                    ValueListenableBuilder(
                        valueListenable: isLoginLoading,
                        builder: (context, value, child) {
                          return PrimaryButton(
                            buttonText: 'Register',
                            isLoading: isLoginLoading.value,
                            color: (registerModel.username.isEmpty ||
                                    registerModel.password.isEmpty ||
                                    registerModel.phoneNumber.isEmpty)
                                ? colorScheme.background.disableGray
                                : colorScheme.background.blue,
                            titleColor: (registerModel.username.isEmpty ||
                                    registerModel.password.isEmpty ||
                                    registerModel.phoneNumber.isEmpty)
                                ? colorScheme.textColor.disableSecondary
                                : colorScheme.textColor.white,
                            onPressed: () {
                              isLoginLoading.value = !isLoginLoading.value;
                              context.read<AuthBloc>().add(AuthRegisterEvent(
                                  registerModel: registerModel));
                            },
                          );
                        }),
                    const SizedBox(height: 24),
                    PrimaryButton(
                        buttonText: 'Sign Up with Google',
                        color: colorScheme.background.lightGray,
                        onPressed: () {/* обработка регистрации через гугл */})
                  ]),
            ))));
  }
}
