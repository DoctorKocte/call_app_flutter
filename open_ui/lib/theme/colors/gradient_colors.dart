import 'package:flutter/material.dart';

class GradientColors {
  const GradientColors({
    required this.purple,
    required this.blue,
    required this.red,
    required this.pink,
    required this.green
  });

  factory GradientColors.light() => const GradientColors(
    purple: _purple, 
    blue: _blue, 
    red: _red, 
    pink: _pink, 
    green: _green
  );

  final List<Color> purple;
  final List<Color> blue;
  final List<Color> red;
  final List<Color> pink;
  final List<Color> green;

  static const List<Color> _purple = [
      Color.fromRGBO(222, 131, 245, 1),
      Color.fromRGBO(69, 60, 171, 1)
   ];

     static const List<Color> _blue = [
      Color.fromRGBO(131, 245, 231, 1),
      Color.fromRGBO(69, 60, 171, 1)
   ];

     static const List<Color> _red = [
      Color.fromRGBO(243, 206, 109, 1),
      Color.fromRGBO(155, 37, 94, 1)
   ];

     static const List<Color> _pink = [
      Color.fromRGBO(255, 95, 229, 1),
      Color.fromRGBO(46, 198, 219, 1)
   ];

     static const List<Color> _green = [
      Color.fromRGBO(131, 245, 142, 1),
      Color.fromRGBO(60, 138, 171, 1)
   ];
}