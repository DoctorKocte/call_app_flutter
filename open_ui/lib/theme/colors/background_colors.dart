import 'package:flutter/material.dart';
import 'package:open_ui/theme/models/mixed_color.dart';

class BackgroundColors {
  const BackgroundColors({
    required this.primary,
    required this.secondary,
    required this.contrast,
    required this.shadow,
    required this.primaryGrey,
    required this.white40,
    required this.failure,
    required this.success
  });

  factory BackgroundColors.light() => BackgroundColors(
        primary: _primary.light,
        secondary: _secondary.light,
        contrast: _contrast.light,
        shadow: _shadow.light,
        primaryGrey: _primaryGrey.light,
        white40: _white40,
        success: _success,
        failure: _failure
  );

  factory BackgroundColors.dark() => BackgroundColors(
        primary: _primary.dark,
        secondary: _secondary.dark,
        contrast: _contrast.dark,
        shadow: _shadow.dark,
        primaryGrey: _primaryGrey.dark,
        white40: _white40,
        success: _success,
        failure: _failure
  );

  final Color primary;
  final Color secondary;
  final Color contrast;
  final Color shadow;
  final Color primaryGrey;
  final Color white40;
  final Color success;
  final Color failure;

  static const MixedColor _primary = MixedColor(light: Colors.white, dark: Color.fromARGB(255, 38, 38, 38));
  static const MixedColor _secondary = MixedColor(light: Color.fromARGB(255, 236, 236, 236), dark: Color.fromARGB(255, 26, 26, 26));
  static const MixedColor _contrast = MixedColor(light: Colors.white, dark: Colors.black);
  static const MixedColor _shadow = MixedColor(light: Colors.black38, dark: Colors.black54);
  static const MixedColor _primaryGrey = MixedColor(light: Color.fromARGB(255, 180, 180, 180), dark: Color.fromARGB(255, 14, 14, 14));
  static final Color _white40 = Colors.white.withAlpha(40);
  static const Color _success = Color.fromARGB(255, 41, 77, 43);
  static const Color _failure = Color.fromARGB(255, 80, 39, 37);
}
