import 'package:flutter/material.dart';
import 'package:open_ui/open_ui.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
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
       Container(
          height: 56,
          width: double.infinity,
          decoration: BoxDecoration(
            color: isLoading ? colorScheme.background.darkBlue : color,
            borderRadius: BorderRadius.circular(8),
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
