import 'package:call_app/features/main/domain/service/user_service.dart';
import 'package:call_app/features/profile/models/setting_model.dart';
import 'package:call_app/features/profile/presentation/animated_image_container.dart';
import 'package:call_app/features/profile/presentation/settings_list.dart';
import 'package:call_app/features/main/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_ui/open_ui.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({required this.userData, required this.userService, super.key});

  final User userData;
  final UserService userService;

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    final colorScheme = appTheme.colorScheme;
    final textStyles = appTheme.textStyles;

    return Scaffold(
      backgroundColor: colorScheme.background.main,
      appBar: AppBar(
        title: const Text('Profile'),
        titleTextStyle: textStyles.withColor(colorScheme.textColor.black).graphik18semibold,
        foregroundColor: colorScheme.textColor.black,
        centerTitle: true,
        surfaceTintColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: AnimatedImageContainer(userData: userData, userService: userService)),
          Text('firstname lastname',
              style: textStyles.withColor(colorScheme.textColor.black).graphik18semibold),
          Text('username',
              style: textStyles.withColor(colorScheme.textColor.secondary).graphik15normal),
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: SettingsList(
                  settingsTypes: SettingsTypes.values)),
        ],
      )),
    );
  }
}
