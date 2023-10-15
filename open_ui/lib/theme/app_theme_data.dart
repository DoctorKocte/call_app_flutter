import 'package:flutter/material.dart';
import 'package:open_ui/theme/border_radius/app_border_radius.dart';
import 'package:open_ui/theme/colors/app_color_scheme.dart';
import 'package:open_ui/theme/text/app_text_colors.dart';
import 'package:open_ui/theme/grid/grid_spacer.dart';
import 'package:open_ui/theme/material_theme.dart';

class AppThemeData {
  const AppThemeData({
    required this.colorScheme,
    required this.materialTheme,
    required this.spacer,
    required this.radius,
    required this.textStyles
  });

  factory AppThemeData.light() => AppThemeData(
        colorScheme: AppColorScheme.light(),
        materialTheme: MaterialTheme.lightTheme,
        spacer: GridSpacer.regular(),
        radius: AppBorderRadius.regular(),
        textStyles: AppTextColors.regular()
      );

  factory AppThemeData.dark() => AppThemeData(
        colorScheme: AppColorScheme.dark(),
        materialTheme: MaterialTheme.darkTheme,
        spacer: GridSpacer.regular(),
        radius: AppBorderRadius.regular(),
        textStyles: AppTextColors.regular()
      );

  final ThemeData materialTheme;
  final AppColorScheme colorScheme;
  final GridSpacer spacer;
  final AppBorderRadius radius;
  final AppTextColors textStyles;
}
