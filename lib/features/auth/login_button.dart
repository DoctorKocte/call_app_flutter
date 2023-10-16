import 'package:call_app/assets/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:open_ui/open_ui.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
      required this.buttonText, 
      required this.onPressed, 
      required this.color,
      this.textStyle,
      super.key,
      this.isLoading = false
    });

  final String buttonText;
  final bool isLoading;
  final Color color;
  final TextStyle? textStyle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    final colorScheme = appTheme.colorScheme;
    
    return 
     GestureDetector(
      onTap: onPressed,
      child: 
      // Material(
      //   borderRadius: BorderRadius.circular(30),
      //   child: 
       //Flexible(child: 
       Container(
          height: 56,
//           constraints: BoxConstraints(
//     maxWidth: double.infinity,
// ),
          width: double.infinity,
          decoration: BoxDecoration(
            color: isLoading ? colorScheme.background.darkBlue : color,
            borderRadius: BorderRadius.circular(12),
          ),
          child: isLoading 
            ? Center(child: CircularProgressIndicator(color: colorScheme.background.white))
            : Center(child: Text(
              buttonText, 
              style: textStyle
            )),
          ),
       
      );
  }
}
