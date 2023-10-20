import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  const RoundButton({
    required this.buttonImage,
    required this.onPressed,
    required this.radius, 
    this.color = Colors.white,
    super.key,
  });

  final Image buttonImage;
  final Color color;
  final double radius;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
        onTap: onPressed,
        child: Container(
          height: radius * 2,
          width: radius * 2,
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(radius)),
            child: Padding(
                padding: EdgeInsets.all(radius * 2 / 5), child: buttonImage)));
  }
}
