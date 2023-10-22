import 'package:call_app/features/main/domain/service/user_service.dart';
import 'package:call_app/features/main/models/user_model.dart';
import 'package:call_app/features/profile/models/setting_model.dart';
import 'package:call_app/features/profile/presentation/animated_image_container.dart';
import 'package:call_app/features/profile/presentation/settings_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_ui/open_ui.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen(
      {required this.userData, required this.userService, super.key});

  final User userData;
  final UserService userService;

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    final colorScheme = appTheme.colorScheme;
    final textStyles =
        appTheme.textStyles.withColor(colorScheme.textColor.black);
    final spacer = appTheme.spacer;

    return Scaffold(
      backgroundColor: colorScheme.background.main,
      appBar: AppBar(
        title: const Text('Profile'),
        titleTextStyle: textStyles.graphik18semibold,
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
              padding: EdgeInsets.symmetric(vertical: spacer.sp24),
              child: AnimatedImageContainer(
                  userData: userData, userService: userService)),
          Text('firstname lastname', style: textStyles.graphik18semibold),
          Text('username',
              style: textStyles.graphik15normal
                  .copyWith(color: colorScheme.textColor.secondary)),
          Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: spacer.sp16, vertical: spacer.sp24),
              child: const SettingsList(settingsTypes: SettingsTypes.values)),
        ],
      )),
    );
  }
}
