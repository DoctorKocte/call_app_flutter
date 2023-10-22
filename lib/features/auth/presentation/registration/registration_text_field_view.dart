import 'package:call_app/components/input_text_field.dart';
import 'package:call_app/features/auth/models/login_model.dart';
import 'package:flutter/material.dart';

class RegistrationTextFieldsView extends StatefulWidget {
  const RegistrationTextFieldsView(
      {required this.registerModel, required this.onChanged, super.key});

  final RegisterModel registerModel;

  final Function(RegisterModel) onChanged;

  @override
  State<RegistrationTextFieldsView> createState() =>
      _RegistrationTextFieldsViewState();
}

class _RegistrationTextFieldsViewState
    extends State<RegistrationTextFieldsView> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      InputTextField(
        text: widget.registerModel.username,
        textFieldTitle: 'Login',
        onChanged: (value) {
          setState(() {
            widget.registerModel.username = value;
            widget.onChanged(widget.registerModel);
          });
        },
        onClearButtonPressed: (text) {
          widget.registerModel.username = text;
          widget.onChanged(widget.registerModel);
        },
      ),
      const SizedBox(height: 20),
      InputTextField(
        text: widget.registerModel.password,
        textFieldTitle: 'Password',
        isObscureTextNeeded: true,
        onChanged: (value) {
          setState(() {
            widget.registerModel.password = value;
            widget.onChanged(widget.registerModel);
          });
        },
        onClearButtonPressed: (text) {
          widget.registerModel.password = text;
          widget.onChanged(widget.registerModel);
        },
      ),
      const SizedBox(height: 20),
      InputTextField(
        text: widget.registerModel.firstName,
        textFieldTitle: 'First name (optional)',
        onChanged: (value) {
          setState(() {
            widget.registerModel.firstName = value;
            widget.onChanged(widget.registerModel);
          });
        },
        onClearButtonPressed: (text) {
          widget.registerModel.firstName = text;
          widget.onChanged(widget.registerModel);
        },
      ),
      const SizedBox(height: 20),
      InputTextField(
        text: widget.registerModel.lastName,
        textFieldTitle: 'Last name (optional)',
        onChanged: (value) {
          setState(() {
            widget.registerModel.lastName = value;
            widget.onChanged(widget.registerModel);
          });
        },
        onClearButtonPressed: (text) {
          widget.registerModel.lastName = text;
          widget.onChanged(widget.registerModel);
        },
      ),
      const SizedBox(height: 20),
      InputTextField(
        text: widget.registerModel.phoneNumber,
        textFieldTitle: 'Phone number',
        onChanged: (value) {
          setState(() {
            widget.registerModel.phoneNumber = value;
            widget.onChanged(widget.registerModel);
          });
        },
        onClearButtonPressed: (text) {
          widget.registerModel.phoneNumber = text;
          widget.onChanged(widget.registerModel);
        },
      )
    ]);
  }
}
