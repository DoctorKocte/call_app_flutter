import 'package:flutter/material.dart';
import 'package:open_ui/theme/models/mixed_color.dart';

class TextColors {
  const TextColors({required this.primary, required this.white});

  factory TextColors.light() =>
      TextColors(primary: _primary.light, white: _white);

  factory TextColors.dark() =>
      TextColors(primary: _primary.dark, white: _white);

  final Color primary;
  final Color white;

  static const MixedColor _primary = MixedColor(light: Color.fromARGB(255, 0, 0, 0), dark: Color.fromARGB(255, 192, 192, 192));
  static const Color _white = Colors.white;
}