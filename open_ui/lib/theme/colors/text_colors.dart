import 'package:flutter/material.dart';

class TextColors {
  const TextColors({
    required this.black,
    required this.white,
    required this.secondary,
    required this.disableSecondary,
    required this.blue,
    required this.lightBlue,
    required this.lightPurple,
    required this.darkGray,
    required this.notice
  });

  factory TextColors.light() => const TextColors(
    black: _black, 
    white: _white, 
    secondary: _secondary, 
    disableSecondary: _disableSecondary, 
    blue: _blue, 
    lightBlue: _lightBlue,
    lightPurple: _lightPurple,
    darkGray: _darkGray,
    notice: _notice
  );

  final Color black;
  final Color white;
  final Color secondary;
  final Color disableSecondary;
  final Color blue;
  final Color lightBlue;
  final Color lightPurple;
  final Color darkGray;
  final Color notice;

  static const Color _black = Colors.black;
  static const Color _white = Colors.white;
  static const Color _secondary = Color.fromRGBO(136, 153, 168, 1);
  static const Color _disableSecondary = Color.fromRGBO(12, 38, 61, 0.24);
  static const Color _blue = Color.fromRGBO(44, 102, 189, 1);
  static const Color _lightBlue = Color.fromRGBO(0, 143, 219, 1);
  static const Color _lightPurple = Color.fromRGBO(170, 126, 255, 1);
  static const Color _darkGray = Color.fromRGBO(46, 46, 46, 1);
  static const Color _notice = Color.fromRGBO(230, 230, 230, 1);
}