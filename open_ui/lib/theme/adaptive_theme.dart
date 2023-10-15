import 'dart:async';

import 'package:open_ui/theme/app_theme.dart';
import 'package:open_ui/theme/app_theme_data.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

typedef AdaptiveThemeBuilder = Widget Function(
  BuildContext context,
  AppThemeData theme
);

class AdaptiveTheme extends StatefulWidget {
  const AdaptiveTheme({
    required this.builder,
    Key? key,
  }) : super(key: key);
  final AdaptiveThemeBuilder builder;

  @override
  State<AdaptiveTheme> createState() => _AdaptiveThemeState();

  static AppThemeColorMode colorModeOf(BuildContext context) {
    final platformBrightness = View.of(context).platformDispatcher.platformBrightness;
    return (platformBrightness == Brightness.dark) ? AppThemeColorMode.dark : AppThemeColorMode.light;
  }
}

class _AdaptiveThemeState extends State<AdaptiveTheme> {
  var theme = AppThemeData.light();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    View.of(context).platformDispatcher.onPlatformBrightnessChanged = () {
      final colorMode = AdaptiveTheme.colorModeOf(context);
      switch (colorMode) {
        case AppThemeColorMode.dark:
          setState(() => theme = AppThemeData.dark());
          break;
        case AppThemeColorMode.light:
          setState(() => theme = AppThemeData.light());
          break;
      }
    };
  }

  @override
  void initState() {
    super.initState();

    unawaited(
      SystemChrome.setPreferredOrientations(
        <DeviceOrientation>[
          DeviceOrientation.portraitUp,
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppTheme(
      theme: theme,
      child: widget.builder(context, theme)
    );
  }
}

enum AppThemeColorMode {
  light,
  dark,
}
