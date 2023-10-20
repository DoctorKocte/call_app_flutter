import 'package:call_app/assets/fonts.gen.dart';
import 'package:call_app/features/profile/models/setting_model.dart';
import 'package:flutter/material.dart';
import 'package:open_ui/open_ui.dart';

class SettingView extends StatelessWidget {
  const SettingView({required this.settingsType, super.key});

  final SettingsTypes settingsType;

//   @override
//   State<SettingView> createState() => _SettingViewState();
// }

// class _SettingViewState extends State<SettingView> {
  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    final colorScheme = appTheme.colorScheme;

    return DecoratedBox(
        decoration: BoxDecoration(
            color: colorScheme.background.white,
            borderRadius: BorderRadius.circular(0)),
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(children: [
              Container(
                height: 36,
                width: 36,
                decoration: BoxDecoration(
                  color: colorScheme.background.lightGray,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: settingsType.image
                        .image(color: colorScheme.background.white)),
              ),
              const SizedBox(width: 8),
              Text(settingsType.title,
                  style: TextStyle(
                      fontFamily: FontFamily.graphik,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: colorScheme.textColor.black)),
              const Spacer()
            ])));
  }
}
