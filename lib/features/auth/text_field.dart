import 'package:flutter/material.dart';

//enum TextFieldType { username, password }

class InputTextField extends StatefulWidget {
  const InputTextField({
      required this.textFieldTitle,
      required this.onChanged,
       //required this.type,
      this.isObscureTextNeeded = false,
      super.key
    });

  final String textFieldTitle;
  //final TextFieldType type;
  final bool isObscureTextNeeded;
  final void Function(String)? onChanged;

  @override
  State<InputTextField> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  late TextEditingController _controller;
  //final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
    //  Form(
    //     key: _formKey,
    //     child:
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Center(
              child: TextFormField(
            obscureText: widget.isObscureTextNeeded,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: widget.textFieldTitle,
            ),
            controller: _controller,
            onChanged: widget.onChanged,
            //inputFormatters: [],
            // Не смогла разобраться с валидацией до конца
            // _formKey.currentState!.validate(); },
            // _formKey.currentState!.validate() ? widget.onChanged : ((_) {}),
            //  (_) {
            //   //if (_formKey.currentState!.validate()) {
            //      widget.onChanged;
            //  // }
            // },
            // validator: (String? value) {
            //     if (widget.type == TextFieldType.username) {
            //        if (value == null || value.isEmpty) {
            //           return "Please enter username.";
            //         }
            //     }
            //     if (widget.type == TextFieldType.password) {
            //         if (value == null || value.isEmpty) {
            //           return "Please enter password.";
            //      }
            //     }
            //     widget.onChanged;
            // }
          )),
        //)
        );
  }
}
