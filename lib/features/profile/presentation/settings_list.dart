import 'package:call_app/features/profile/models/setting_model.dart';
import 'package:call_app/features/profile/presentation/setting_view.dart';
import 'package:flutter/material.dart';
import 'package:open_ui/open_ui.dart';

class SettingsList extends StatelessWidget {
  const SettingsList({required this.settingsTypes, required this.onSettingTap, super.key});

  final List<SettingsTypes> settingsTypes;
  final Function(SettingsTypes) onSettingTap;

  @override
  Widget build(BuildContext context) {
    final radius = AppTheme.of(context).radius;

    return Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: radius.radius24,
        ),
        child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: settingsTypes.length,
            itemBuilder: (context, index) {
              return SettingView(
                settingsType: settingsTypes[index],
                onSettingTap: onSettingTap,
              );
            }));
  }
}
