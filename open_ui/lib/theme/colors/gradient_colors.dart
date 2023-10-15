import 'package:flutter/material.dart';
import 'package:open_ui/theme/models/mixed_gradient_color.dart';

class GradientColors {
  const GradientColors({required this.gold});

  factory GradientColors.light() => GradientColors(gold: _gold.light);

  factory GradientColors.dark() => GradientColors(gold: _gold.dark);

  final List<Color> gold;

  static const MixedGradientColor _gold = MixedGradientColor(
    light: [
      Color.fromARGB(255, 172, 157, 103),
      Color.fromARGB(255, 132, 112, 34),
      Color.fromARGB(255, 63, 48, 0)
   ],
   dark: [
      Color.fromARGB(255, 255, 232, 148),
      Color.fromARGB(255, 238, 211, 102),
      Color.fromARGB(255, 128, 96, 0)
   ]
  );
}