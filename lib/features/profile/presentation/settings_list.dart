import 'package:call_app/features/profile/models/setting_model.dart';
import 'package:call_app/features/profile/presentation/setting_view.dart';
import 'package:flutter/material.dart';

class SettingsList extends StatelessWidget {
  const SettingsList({required this.settingsTypes, super.key});

  final List<SettingsTypes> settingsTypes;

  @override
  Widget build(BuildContext context) {
    return Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
        ),
        child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: settingsTypes.length,
            itemBuilder: (context, index) {
              return SettingView(
                settingsType: settingsTypes[index],
              );
            }));
  }
}
