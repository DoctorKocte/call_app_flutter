import 'package:flutter/material.dart';
import 'package:open_ui/open_ui.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
      required this.buttonText, 
      required this.onPressed, 
      required this.color,
      this.titleColor = Colors.black,
      this.radius = 8,
      super.key,
      this.isLoading = false
    });

  final String buttonText;
  final Color titleColor;
  final bool isLoading;
  final Color color;
  final double radius;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    final colorScheme = appTheme.colorScheme;
    final textStyles = appTheme.textStyles.withColor(titleColor);
    
    return 
     GestureDetector(
      onTap: isLoading ? null : onPressed,
      child: 
       Container(
          height: 56,
          width: double.infinity,
          decoration: BoxDecoration(
            color: isLoading ? colorScheme.background.darkBlue : color,
            borderRadius: BorderRadius.circular(radius),
          ),
          child: isLoading 
            ? Center(child: CircularProgressIndicator(color: colorScheme.background.white))
            : Center(child: Text(
              buttonText, 
              style: textStyles.graphik15normal
            )),
          ),
      );
  }
}
