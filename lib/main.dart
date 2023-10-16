import 'package:call_app/features/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:open_ui/open_ui.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      builder: (context, theme) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
        theme: theme.materialTheme
      ));
  }
}
