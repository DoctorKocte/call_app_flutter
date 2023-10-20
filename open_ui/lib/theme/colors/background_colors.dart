import 'package:flutter/material.dart';

class BackgroundColors {
  const BackgroundColors({
    required this.main,
    required this.white,
    required this.black,
    required this.lightGray,
    required this.darkGray,
    required this.disableGray,
    required this.blue,
    required this.darkBlue,
    required this.success,
    required this.danger,
    required this.error,
    required this.purpleBackground,
    required this.blueBackground,
    required this.redBackground,
    required this.lightBlueBackground,
    required this.greenBackground,
    required this.purpleButton,
    required this.blueButton,
    required this.redButton,
    required this.lightBlueButton,
    required this.greenButton,
    required this.white16,
    required this.white20,
    required this.white25,
    required this.white28,
    required this.white30,
    required this.white60
  });

  factory BackgroundColors.light() => const BackgroundColors(
        main: _main,
        white: _white,
        black: _black,
        lightGray: _lightGray,
        darkGray: _darkGray,
        disableGray: _disableGray,
        blue: _blue,
        darkBlue: _darkBlue,
        success: _success,
        danger: _danger,
        error: _error,
        purpleBackground: _purpleBackground,
        blueBackground: _blueBackground,
        redBackground: _redBackground,
        lightBlueBackground: _lightBlueBackground,
        greenBackground: _greenBackground,
        purpleButton: _purpleButton,
        blueButton: _blueButton,
        redButton: _redButton,
        lightBlueButton: _lightBlueButton,
        greenButton: _greenButton,
        white16: _white16,
        white20: _white20,
        white25: _white25,
        white28: _white28,
        white30: _white30,
        white60: _white60
  );

  final Color main;
  final Color white;
  final Color black;
  final Color lightGray;
  final Color darkGray;
  final Color disableGray;
  final Color blue;
  final Color darkBlue;
  final Color success;
  final Color danger;
  final Color error;
  final Color white16;
  final Color white20;
  final Color white25;
  final Color white28;
  final Color white30;
  final Color white60;

  final Color purpleBackground;
  final Color blueBackground;
  final Color redBackground;
  final Color lightBlueBackground;
  final Color greenBackground;

  final Color purpleButton;
  final Color blueButton;
  final Color redButton;
  final Color lightBlueButton;
  final Color greenButton;

  static const Color _main = Color.fromRGBO(235, 241, 245, 1);
  static const Color _white =Colors.white;
  static const Color _black = Colors.black;
  static const Color _lightGray = Color.fromRGBO(216, 226, 235, 1);
  static const Color _darkGray = Color.fromRGBO(204, 213, 221, 1);
  static const Color _disableGray = Color.fromRGBO(208, 220, 228, 1);
  static const Color _blue = Color.fromRGBO(44, 102, 189, 1);
  static const Color _darkBlue = Color.fromRGBO(26, 66, 124, 1);

  static const Color _purpleBackground = Color.fromRGBO(97, 49, 175, 1);
  static const Color _blueBackground = Color.fromRGBO(51, 94, 163, 1);
  static const Color _redBackground = Color.fromRGBO(167, 70, 75, 1);
  static const Color _lightBlueBackground = Color.fromRGBO(46, 113, 176, 1);
  static const Color _greenBackground = Color.fromRGBO(52, 155, 136, 1);

  static const Color _purpleButton = Color.fromRGBO(68, 35, 121, 1);
  static const Color _blueButton = Color.fromRGBO(35, 76, 141, 1);
  static const Color _redButton = Color.fromRGBO(150, 49, 55, 1);
  static const Color _lightBlueButton = Color.fromRGBO(36, 83, 126, 1);
  static const Color _greenButton = Color.fromRGBO(27, 121, 104, 1);

  static const Color _success = Color.fromRGBO(120, 181, 119, 1);
  static const Color _danger = Color.fromRGBO(191, 88, 88, 1);
  static const Color _error = Color.fromRGBO(224, 37, 68, 1);
  static const Color _white16 = Color.fromRGBO(255, 255, 255, 0.16);
  static const Color _white20 = Color.fromRGBO(255, 255, 255, 0.2);
  static const Color _white25 = Color.fromRGBO(255, 255, 255, 0.25);
  static const Color _white28 = Color.fromRGBO(255, 255, 255, 0.28);
  static const Color _white30 = Color.fromRGBO(255, 255, 255, 0.3);
  static const Color _white60 = Color.fromRGBO(255, 255, 255, 0.6);
}
