import 'dart:io';

import 'package:call_app/assets/fonts.gen.dart';
import 'package:call_app/features/profile/models/setting_model.dart';
import 'package:call_app/features/profile/settings_list.dart';
import 'package:call_app/features/users/models/user_model.dart';
import 'package:call_app/services/users/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_ui/open_ui.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({required this.userData, super.key});

  final User userData;
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  String? imagePath;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 5))
          ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    final colorScheme = appTheme.colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.background.main,
      appBar: AppBar(
        title: Text('Profile'),
        titleTextStyle: TextStyle(
            fontFamily: FontFamily.graphik,
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: colorScheme.textColor.black),
        foregroundColor: colorScheme.textColor.black,
        centerTitle: true,
        //surfaceTintColor: colorScheme.textColor.black,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 28),
                  Stack(alignment: Alignment.center, children: [
                    AnimatedBuilder(
                        animation: _controller,
                        builder: (_, child) {
                          return Transform.rotate(
                              angle: _controller.value * 2 * 3.14,
                              child: Container(
                                  alignment: Alignment.center,
                                  height: 128,
                                  width: 128,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(64),
                                      gradient: LinearGradient(
                                          colors:
                                              colorScheme.gradients.rainbow))));
                        }),
                    GestureDetector(
                        onTap: () {
                          pickImage();
                        },
                        child: Container(
                          clipBehavior: Clip.hardEdge,
                            alignment: Alignment.center,
                            height: 120,
                            width: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(60),
                                color: colorScheme.background.lightGray),
                            child:
                             (imagePath != null)
                             ? Image.file(File(imagePath!), fit: BoxFit.cover,)
                             : Text('V',
                                style: TextStyle(
                                    fontFamily: FontFamily.graphik,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: colorScheme.textColor.black))))
                  ]),
                  SizedBox(height: 24),
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
                  SizedBox(height: 24),
                  //Spacer(),
                  SettingsList(settingsTypes: SettingsTypes.values)
                ],
              ))),
    );
  }

  void pickImage() async {
    XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file != null) {
      setState(() {
         imagePath = file.path; 
      });
    }
  }
}
