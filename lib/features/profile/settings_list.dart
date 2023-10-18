import 'package:call_app/features/profile/models/setting_model.dart';
import 'package:call_app/features/profile/setting_view.dart';
import 'package:flutter/material.dart';

class SettingsList extends StatefulWidget {
  const SettingsList({required this.settingsTypes, super.key});

  final List<SettingsTypes> settingsTypes;

  @override
  State<SettingsList> createState() => _SettingsListState();
}

class _SettingsListState extends State<SettingsList> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
  builder: (context, constraints) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(borderRadius:  BorderRadius.circular(24),),
      //borderRadius: BorderRadius.circular(24),
      child: SizedBox(
        //height: constraints.maxHeight,//based on your need
        width: constraints.maxWidth,
        child:
     ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: widget.settingsTypes.length,
        itemBuilder: (context, index) {
          return SettingView(
            settingsType: widget.settingsTypes[index],
          );
        })
      )
      );
      }
      );
  }
}
