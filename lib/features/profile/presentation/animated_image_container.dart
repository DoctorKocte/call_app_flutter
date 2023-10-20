import 'dart:convert';
import 'dart:io';

import 'package:call_app/features/main/domain/service/user_service.dart';
import 'package:call_app/features/profile/presentation/bloc/user_update_bloc.dart';
import 'package:call_app/features/profile/presentation/bloc/user_update_event.dart';
import 'package:call_app/features/profile/presentation/bloc/user_update_state.dart';
import 'package:call_app/features/main/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:open_ui/open_ui.dart';

class AnimatedImageContainer extends StatefulWidget {
  const AnimatedImageContainer(
      {required this.userData, required this.userService, super.key});

  final User userData;
  final UserService userService;

  @override
  State<AnimatedImageContainer> createState() => _AnimatedImageContainerState();
}

class _AnimatedImageContainerState extends State<AnimatedImageContainer>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  String img64 = '';

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 5))
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
    final textStyles = appTheme.textStyles;

    return BlocProvider<UserUpdateBloc>(
        create: (context) => UserUpdateBloc(userService: widget.userService),
        child: Stack(alignment: Alignment.center, children: [
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
                                colors: colorScheme.gradients.rainbow))));
              }),
          GestureDetector(
              onTap: pickImage,
              child: Builder(builder: (context) {
                if (img64.isNotEmpty) {
                  context
                      .read<UserUpdateBloc>()
                      .add(UserChangeImageEvent(imageString: img64));
                  // final UserUpdateBloc userUpdateBloc =
                  //     BlocProvider.of(context);
                  // userUpdateBloc.add(UserChangeImageEvent(imageString: img64));
                }
                return Container(
                    clipBehavior: Clip.hardEdge,
                    alignment: Alignment.center,
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        color: colorScheme.background.lightGray),
                    child: BlocBuilder<UserUpdateBloc, UserUpdateState>(
                        builder: (context, state) {
                      return switch (state) {
                        UserUpdateLoadingState() =>
                          const Center(child: CircularProgressIndicator()),
                        UserUpdateErrorState() => Text(
                            widget.userData.firstName.isNotEmpty
                                ? widget.userData.firstName[0]
                                : '#',
                            style: textStyles
                                .withColor(colorScheme.textColor.black)
                                .graphik24bold),
                        UserUpdateSuccessState() =>
                          widget.userData.imageString.isNotEmpty
                              ? Image.memory(
                                  base64Decode(widget.userData.imageString),
                                  fit: BoxFit.fill)
                              : Text(
                                  widget.userData.firstName.isNotEmpty
                                      ? widget.userData.firstName[0]
                                      : '',
                                  style: textStyles
                                      .withColor(colorScheme.textColor.black)
                                      .graphik24bold)
                      };
                    }));
              }))
        ]));
  }

  Future<void> pickImage() async {
    final file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file != null) {
      setState(() {
        final imagePath = file.path;
        final bytes = File(imagePath).readAsBytesSync();
        final img64 = base64Encode(bytes);
        this.img64 = img64;
        widget.userData.imageString = img64;
      });
    }
  }
}
