import 'package:flutter/material.dart';
import 'package:open_ui/theme/text/app_text_styles.dart';

class AppTextColors {
  const AppTextColors({
    required this.h4,
    required this.h5,
    required this.h6,
    required this.title,
    required this.subtitle
  });

  factory AppTextColors.regular() => const AppTextColors(
    h4: AppTextStyles.h4,
    h5: AppTextStyles.h5,
    h6: AppTextStyles.h6,
    title: AppTextStyles.title,
    subtitle: AppTextStyles.subtitle
  );

  final TextStyle h4;
  final TextStyle h5;
  final TextStyle h6;
  final TextStyle title;
  final TextStyle subtitle;

  AppTextColors withColor(Color? color) => AppTextColors(
    h4: AppTextStyles.h4.apply(color: color),
    h5: AppTextStyles.h5.apply(color: color),
    h6: AppTextStyles.h6.apply(color: color),
    title: AppTextStyles.title.apply(color: color),
    subtitle: AppTextStyles.subtitle.apply(color: color)
  );
}
