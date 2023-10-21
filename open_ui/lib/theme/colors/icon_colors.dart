import 'package:flutter/material.dart';

class IconColors {
  const IconColors({
    required this.white,
    required this.black,
    required this.red
  });

  factory IconColors.light() => const IconColors(
    white: _white,
    black: _black,
    red: _red
  );

  final Color white;
  final Color black;
  final Color red;

  static const Color _white = Colors.white;
  static const Color _red =Color.fromRGBO(191, 88, 88, 1);
  static const Color _black = Colors.black;
}
