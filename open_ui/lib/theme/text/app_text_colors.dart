import 'package:flutter/material.dart';
import 'package:open_ui/theme/text/app_text_styles.dart';

class AppTextColors {
  const AppTextColors({
    required this.graphik15normal,
    required this.graphik15semibold,
    required this.graphik24bold,
    required this.graphik16normal,
    required this.graphik16semibold,
    required this.graphik18semibold,
    required this.graphik24semibold,
    required this.graphik20normal,
    required this.graphik20bold,
    required this.graphik14normal,
    required this.graphik24normal,
    required this.graphik36semibold,
    required this.graphik28light,
    required this.graphik13semibold
  });

  factory AppTextColors.regular() => const AppTextColors(
    graphik15normal: AppTextStyles.graphik15normal,
    graphik15semibold: AppTextStyles.graphik15semibold,
    graphik24bold: AppTextStyles.graphik24bold,
    graphik16normal: AppTextStyles.graphik16normal,
    graphik16semibold: AppTextStyles.graphik16semibold,
    graphik18semibold: AppTextStyles.graphik18semibold,
    graphik24semibold: AppTextStyles.graphik24semibold,
    graphik20normal: AppTextStyles.graphik20normal,
    graphik20bold: AppTextStyles.graphik20bold,
    graphik14normal: AppTextStyles.graphik14normal,
    graphik24normal: AppTextStyles.graphik24normal,
    graphik36semibold: AppTextStyles.graphik36semibold,
    graphik28light: AppTextStyles.graphik28light,
    graphik13semibold: AppTextStyles.graphik13semibold
  );

  final TextStyle graphik15normal;
  final TextStyle graphik15semibold;
  final TextStyle graphik24bold;
  final TextStyle graphik16normal;
  final TextStyle graphik16semibold;
  final TextStyle graphik18semibold;
  final TextStyle graphik24semibold;
  final TextStyle graphik20normal;
  final TextStyle graphik20bold;
  final TextStyle graphik14normal;
  final TextStyle graphik24normal;
  final TextStyle graphik36semibold;
  final TextStyle graphik28light;
  final TextStyle graphik13semibold;

  AppTextColors withColor(Color? color) => AppTextColors(
    graphik15normal: AppTextStyles.graphik15normal.apply(color: color),
    graphik15semibold: AppTextStyles.graphik15semibold.apply(color: color),
    graphik24bold: AppTextStyles.graphik24bold.apply(color: color),
    graphik16normal: AppTextStyles.graphik16normal.apply(color: color),
    graphik16semibold: AppTextStyles.graphik16semibold.apply(color: color),
    graphik18semibold: AppTextStyles.graphik18semibold.apply(color: color),
    graphik24semibold: AppTextStyles.graphik24semibold.apply(color: color),
    graphik20normal: AppTextStyles.graphik20normal.apply(color: color),
    graphik20bold: AppTextStyles.graphik20bold.apply(color: color),
    graphik14normal: AppTextStyles.graphik14normal.apply(color: color),
    graphik24normal: AppTextStyles.graphik24normal.apply(color: color),
    graphik36semibold: AppTextStyles.graphik36semibold.apply(color: color),
    graphik28light: AppTextStyles.graphik28light.apply(color: color),
    graphik13semibold: AppTextStyles.graphik13semibold.apply(color: color)
  );

  // AppTextColors withHeight(double height) => AppTextColors(
  //   graphik15normal: AppTextStyles.graphik15normal.height apply(heightFactor: height),
  //   graphik15semibold: AppTextStyles.graphik15semibold.apply(heightFactor: height),
  //   graphik24bold: AppTextStyles.graphik24bold.apply(heightFactor: height),
  //   graphik16normal: AppTextStyles.graphik16normal.apply(heightFactor: height),
  //   graphik16semibold: AppTextStyles.graphik16semibold.apply(heightFactor: height),
  //   graphik18semibold: AppTextStyles.graphik18semibold.apply(heightFactor: height),
  //   graphik24semibold: AppTextStyles.graphik24semibold.apply(heightFactor: height),
  //   graphik20normal: AppTextStyles.graphik20normal.apply(heightFactor: height),
  //   graphik20bold: AppTextStyles.graphik20bold.apply(heightFactor: height),
  //   graphik14normal: AppTextStyles.graphik14normal.apply(heightFactor: height),
  //   graphik24normal: AppTextStyles.graphik24normal.apply(heightFactor: height),
  //   graphik36semibold: AppTextStyles.graphik36semibold.apply(heightFactor: height),
  //   graphik28light: AppTextStyles.graphik28light.apply(heightFactor: height),
  //   graphik13semibold: AppTextStyles.graphik13semibold.apply(heightFactor: height)
  // );
}
