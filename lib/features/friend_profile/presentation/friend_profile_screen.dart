import 'dart:convert';

import 'package:call_app/assets/assets.gen.dart';
import 'package:call_app/assets/fonts.gen.dart';
import 'package:call_app/components/primary_button.dart';
import 'package:call_app/features/friend_profile/models/button_model.dart';
import 'package:call_app/features/friend_profile/presentation/blur_buttons_view.dart';
import 'package:call_app/features/main/models/favorite_card_model.dart';
import 'package:flutter/material.dart';
import 'package:open_ui/open_ui.dart';

class FriendProfileScreen extends StatelessWidget {
  const FriendProfileScreen({required this.favoriteCardModel, super.key});

  final FavoriteCardModel favoriteCardModel;

//   @override
//   State<FriendProfileScreen> createState() => _FriendProfileScreenState();
// }

// class _FriendProfileScreenState extends State<FriendProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    final colorScheme = appTheme.colorScheme;

    return Scaffold(
      extendBody: true,
      body: Stack(children: [
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.64,
            width: MediaQuery.of(context).size.width,
            child: Stack(children: [
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.64,
                  width: MediaQuery.of(context).size.width,
                  child: Hero(
                      tag: 'imageHero ${favoriteCardModel.contact.id}',
                      child: (favoriteCardModel.contact.imageString !=
                              null)
                          ? Image.memory(
                              base64Decode(
                                  favoriteCardModel.contact.imageString!),
                              fit: BoxFit.cover)
                          : Assets.images.addFriend.image(fit: BoxFit.cover))),
              Align(
                alignment: AlignmentDirectional.bottomStart,
                child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 100, 60),
                    child: BlurButtonsView(
                      buttonModels: [
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
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(18),
                      topRight: Radius.circular(18)),
                  color: favoriteCardModel.backgroundColor),
              child: Padding(
                  padding: EdgeInsets.fromLTRB(16, 30, 16, 44),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          favoriteCardModel.contact.firstName ??
                              favoriteCardModel.contact.username ??
                              '',
                          style: TextStyle(
                              fontFamily: FontFamily.graphik,
                              fontSize: 36,
                              fontWeight: FontWeight.w600,
                              color: colorScheme.textColor.white)),
                      Text(favoriteCardModel.contact.lastName ?? '',
                          style: TextStyle(
                              fontFamily: FontFamily.graphik,
                              fontSize: 28,
                              fontWeight: FontWeight.w400,
                              color: colorScheme.textColor.white)),
                      SizedBox(height: 36),
                      Text(favoriteCardModel.contact.notice ?? '',
                          style: TextStyle(
                              fontFamily: FontFamily.graphik,
                              fontSize: 20,
                              color: colorScheme.textColor.white)),
                      Spacer(),
                      PrimaryButton(
                          buttonText: 'Close',
                          textStyle: TextStyle(
                              fontFamily: FontFamily.graphik,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: colorScheme.textColor.white),
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
