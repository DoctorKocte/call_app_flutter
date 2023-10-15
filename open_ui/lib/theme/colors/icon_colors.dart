import 'package:flutter/material.dart';
import 'package:open_ui/theme/models/mixed_color.dart';

class IconColors {
  const IconColors({
    required this.gold
  });

  factory IconColors.light() => IconColors(
    gold: _gold.light
  );

  factory IconColors.dark() => IconColors(
    gold: _gold.dark
  );

  final Color gold;

  static const MixedColor _gold = MixedColor(light: Color.fromARGB(255, 63, 48, 0), dark: Color.fromARGB(255, 128, 96, 0));
}
