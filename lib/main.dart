import 'package:call_app/features/auth/presentation/login/login_screen.dart';
import 'package:call_app/network/endpoint_config.dart';
import 'package:call_app/network/request_service.dart';
import 'package:call_app/services/token_service/token_service.dart';
import 'package:flutter/material.dart';
import 'package:open_ui/open_ui.dart';

void main() {
  runApp(const CallApp());
}

class CallApp extends StatelessWidget {
  const CallApp({super.key});

  @override
  Widget build(BuildContext context) {
    final requestService = RequestService(tokenService: TokenService());
    return AdaptiveTheme(
      builder: (context, theme) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen(requestService: requestService, endpointConfig: EndpointConfig()),
        theme: theme.materialTheme
      ));
  }
}
