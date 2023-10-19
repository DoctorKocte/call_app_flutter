import 'package:call_app/assets/fonts.gen.dart';
import 'package:call_app/features/main/domain/service/user_service.dart';
import 'package:call_app/features/profile/models/setting_model.dart';
import 'package:call_app/features/profile/presentation/animated_image_container.dart';
import 'package:call_app/features/profile/presentation/settings_list.dart';
import 'package:call_app/features/users/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:open_ui/open_ui.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({required this.userData, required this.userService, super.key});

  final User userData;
  final UserService userService;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    final colorScheme = appTheme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.background.main,
      appBar: AppBar(
        title: const Text('Profile'),
        titleTextStyle: TextStyle(
            fontFamily: FontFamily.graphik,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: colorScheme.textColor.black),
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
              child: AnimatedImageContainer(userData: widget.userData, userService: widget.userService)),
          Text('firstname lastname',
              style: TextStyle(
                  fontFamily: FontFamily.graphik,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: colorScheme.textColor.black)),
          Text('username',
              style: TextStyle(
                  fontFamily: FontFamily.graphik,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: colorScheme.textColor.secondary)),
          const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: SettingsList(
                  settingsTypes: SettingsTypes.values)),
        ],
      )),
    );
  }
}
