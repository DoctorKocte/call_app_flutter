import 'package:flutter/material.dart';
import 'package:open_ui/open_ui.dart';

class InputTextField extends StatefulWidget {
  const InputTextField(
      {required this.textFieldTitle,
      required this.onChanged,
      this.onClearButtonPressed,
      this.isObscureTextNeeded = false,
      super.key});

  final String textFieldTitle;
  final bool isObscureTextNeeded;
  final void Function(String)? onChanged;
  final void Function()? onClearButtonPressed;

  @override
  State<InputTextField> createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  late TextEditingController _controller;

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
    final appTheme = AppTheme.of(context);
    final colorScheme = appTheme.colorScheme;
    final radius = appTheme.radius;

    return Center(
      child: Stack(alignment: Alignment.center, children: [
        Container(
            decoration: BoxDecoration(
              borderRadius: radius.radius12,
              color: colorScheme.background.white,
            ),
            height: 64),
        SizedBox(
            height: 34,
            child: TextFormField(
                obscureText: widget.isObscureTextNeeded,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: colorScheme.background.white,
                  border: OutlineInputBorder(
                    borderRadius: radius.radius12,
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: radius.radius12,
                  ),
                  labelText: widget.textFieldTitle,
                  floatingLabelStyle:
                      TextStyle(color: colorScheme.textColor.secondary),
                  suffixIcon: _controller.text.isEmpty
                      ? null
                      : IconButton(
                          highlightColor: Colors.transparent,
                          onPressed: // widget.onClearButtonPressed,
                              () {
                            setState(() {
                              _controller.clear();
                            });
                          },
                          icon: const Icon(Icons.close_rounded),
                        ),
                ),
                controller: _controller,
                onChanged: widget.onChanged))
      ]),
    );
  }
}
