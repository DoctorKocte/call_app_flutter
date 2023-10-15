import 'package:flutter/material.dart';
import 'package:open_ui/theme/app_theme_data.dart';


class AppTheme extends InheritedWidget {
  const AppTheme({
    required this.theme,
    required Widget child,
    Key? key
  }) : super(
      key: key,
      child: child,
  );

  final AppThemeData theme;

  @override
  bool updateShouldNotify(covariant AppTheme oldWidget) => (theme != oldWidget.theme);

  static AppThemeData of(BuildContext context) {
    final widget = context.dependOnInheritedWidgetOfExactType<AppTheme>();

    return widget?.theme ?? AppThemeData.dark();
  }
}
