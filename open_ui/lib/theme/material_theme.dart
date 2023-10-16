import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_ui/theme/colors/app_color_scheme.dart';

class MaterialTheme {
  const MaterialTheme();

  static ThemeData get darkTheme => _materialTheme(
    colorScheme: AppColorScheme.dark(),
    brightness: Brightness.dark
  );

  static ThemeData get lightTheme => _materialTheme(
    colorScheme: AppColorScheme.light(),
    brightness: Brightness.light
  );

  static ThemeData _materialTheme({
    required AppColorScheme colorScheme,
    required Brightness brightness,
  }) {
    final backgroundColor = colorScheme.background.main;
    final isBrightnessLight = brightness == Brightness.light;
    final brightnessTheme = isBrightnessLight ? Brightness.dark : Brightness.light;

    final buttonTheme = ButtonStyle(
      elevation: MaterialStateProperty.all(0),
      shape: MaterialStateProperty.all<OutlinedBorder>(
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
    );

    return ThemeData(
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: colorScheme.background.darkBlue, 
        selectionColor: colorScheme.background.lightGray
      ),
      useMaterial3: true,
      brightness: brightness,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      appBarTheme: AppBarTheme(
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: backgroundColor,
            systemNavigationBarColor: backgroundColor,
            systemNavigationBarIconBrightness: brightnessTheme,
            statusBarIconBrightness: brightnessTheme,
            statusBarBrightness: brightnessTheme),
        backgroundColor: backgroundColor,
        centerTitle: true,
        foregroundColor: backgroundColor,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(style: buttonTheme),
      textButtonTheme: TextButtonThemeData(style: buttonTheme),
      pageTransitionsTheme: const PageTransitionsTheme(builders: {TargetPlatform.android: CupertinoPageTransitionsBuilder()})
    );
  }
}
