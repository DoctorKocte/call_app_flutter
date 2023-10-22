import 'dart:convert';

import 'package:call_app/assets/assets.gen.dart';
import 'package:call_app/components/primary_button.dart';
import 'package:call_app/features/friend_profile/models/button_model.dart';
import 'package:call_app/features/friend_profile/presentation/blur_buttons_view.dart';
import 'package:call_app/features/main/models/favorite_card_model.dart';
import 'package:flutter/material.dart';
import 'package:open_ui/open_ui.dart';

class FriendProfileScreen extends StatelessWidget {
  const FriendProfileScreen({required this.favoriteCardModel, super.key});

  final FavoriteCardModel favoriteCardModel;

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    final colorScheme = appTheme.colorScheme;
    final textStyles =
        appTheme.textStyles.withColor(colorScheme.textColor.white);
    final radius = appTheme.radius;
    final spacer = appTheme.spacer;
    final imageHeight = MediaQuery.of(context).size.height * 0.64;

    return Scaffold(
      extendBody: true,
      body: Stack(children: [
        SizedBox(
            height: imageHeight,
            width: MediaQuery.of(context).size.width,
            child: Stack(children: [
              SizedBox(
                  height: imageHeight,
                  width: MediaQuery.of(context).size.width,
                  child: Hero(
                      tag: 'imageHero ${favoriteCardModel.contact.id}',
                      child: (favoriteCardModel.contact.imageString != null)
                          ? Image.memory(
                              base64Decode(
                                  favoriteCardModel.contact.imageString!),
                              fit: BoxFit.cover)
                          : Assets.images.addFriend.image(fit: BoxFit.cover))),
              Align(
                alignment: AlignmentDirectional.bottomStart,
                child: Padding(
                    padding: EdgeInsets.fromLTRB(
                        spacer.sp10, 0, spacer.sp100, spacer.sp60),
                    child: BlurButtonsView(
                      buttonModels: const [
                        ButtonModel.call,
                        ButtonModel.video,
                        ButtonModel.favorite
                      ],
                      buttonsColor: favoriteCardModel.buttonBackground,
                    )),
              )
            ])),
        Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                  borderRadius: radius.radius18Top,
                  color: favoriteCardModel.backgroundColor),
              child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      spacer.sp16, spacer.sp28, spacer.sp16, spacer.sp44),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          favoriteCardModel.contact.firstName ??
                              favoriteCardModel.contact.username ??
                              'no name',
                          style: textStyles.graphik36semibold),
                      Text(favoriteCardModel.contact.lastName ?? '',
                          style: textStyles.graphik28light),
                      Flexible(
                          child: Text(favoriteCardModel.contact.notice ?? '',
                              style: textStyles.graphik20normal)),
                      const Spacer(),
                      PrimaryButton(
                          buttonText: 'Close',
                          titleColor: colorScheme.textColor.white,
                          radius: 28,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          color: favoriteCardModel.buttonBackground)
                    ],
                  )),
            ))
      ]),
    );
  }
}
