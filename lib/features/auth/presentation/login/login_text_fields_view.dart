import 'package:call_app/components/input_text_field.dart';
import 'package:call_app/features/auth/models/login_model.dart';
import 'package:call_app/features/auth/presentation/login/login_screen.dart';
import 'package:flutter/material.dart';

class LoginTextFieldsView extends StatefulWidget {
  const LoginTextFieldsView(
      {required this.loginType,
      required this.loginModel,
      required this.tabsTitles,
      required this.onChanged,
      super.key});

  final LoginType loginType;
  final LoginModel loginModel;
  final List<String> tabsTitles;

  final Function(LoginModel) onChanged;

  @override
  State<LoginTextFieldsView> createState() => _LoginTextFieldsViewState();
}

class _LoginTextFieldsViewState extends State<LoginTextFieldsView> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      InputTextField(
        text: widget.loginModel.username,
        textFieldTitle: widget.tabsTitles[widget.loginType.index],
        onChanged: (value) {
          if (widget.loginType == LoginType.email) {
            widget.loginModel.username = value;
          } else {
            widget.loginModel.phoneNumber = value;
          }
          widget.onChanged(widget.loginModel);
        },
        onClearButtonPressed: (text) {
          if (widget.loginType == LoginType.email) {
            widget.loginModel.username = text;
          } else {
            widget.loginModel.phoneNumber = text;
          }
          widget.onChanged(widget.loginModel);
        },
      ),
      const SizedBox(height: 24),
      InputTextField(
        text: widget.loginModel.password,
        textFieldTitle: 'Password',
        isObscureTextNeeded: true,
        onChanged: (value) {
          widget.loginModel.password = value;
          widget.onChanged(widget.loginModel);
        },
        onClearButtonPressed: (text) {
          widget.loginModel.password = text;
          widget.onChanged(widget.loginModel);
        },
      )
    ]);
  }
}
