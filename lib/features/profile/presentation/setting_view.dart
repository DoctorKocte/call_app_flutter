import 'package:call_app/features/profile/models/setting_model.dart';
import 'package:flutter/material.dart';
import 'package:open_ui/open_ui.dart';

class SettingView extends StatelessWidget {
  const SettingView({required this.settingsType, super.key});

  final SettingsTypes settingsType;

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    final colorScheme = appTheme.colorScheme;
    final textStyles = appTheme.textStyles;
    final radius = appTheme.radius;
    final spacer = appTheme.spacer;

    return ColoredBox(
        color: colorScheme.background.white,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: spacer.sp20, vertical: spacer.sp10),
            child: Row(children: [
              Container(
                height: 36,
                width: 36,
                decoration: BoxDecoration(
                  color: colorScheme.background.lightGray,
                  borderRadius: radius.radius10,
                ),
                child: Padding(
                    padding: EdgeInsets.all(spacer.sp6),
                    child: settingsType.image
                        .image(color: colorScheme.background.white)),
              ),
              const SizedBox(width: 8),
              Text(settingsType.title,
                  style: textStyles
                      .withColor(colorScheme.textColor.black)
                      .graphik15semibold),
              const Spacer()
            ])));
  }
}
