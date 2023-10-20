import 'dart:convert';

import 'package:call_app/assets/assets.gen.dart';
import 'package:call_app/assets/fonts.gen.dart';
import 'package:call_app/features/main/models/contact.dart';
import 'package:call_app/features/main/models/favorite_card_model.dart';
import 'package:flutter/material.dart';
import 'package:open_ui/open_ui.dart';

class FavoriteCard extends StatelessWidget {
  const FavoriteCard(
      {required this.favoriteCardModel,
      required this.onCardTap,
      super.key});

  final FavoriteCardModel favoriteCardModel;
  final Function(FavoriteCardModel) onCardTap;

//   @override
//   State<FavoriteCard> createState() => _FavoriteCardState();
// }

// class _FavoriteCardState extends State<FavoriteCard> {
  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    final colorScheme = appTheme.colorScheme;

    return GestureDetector(
        onTap: () {
          onCardTap(favoriteCardModel);
        },
        child: Stack(children: [
          Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: favoriteCardModel.backgroundGradient),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 8)
              ])),
          Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Hero(
                        tag: 'imageHero ${favoriteCardModel.contact.id}',
                        child: Container(
                          clipBehavior: Clip.hardEdge,
                            height: 90,
                            width: 90,
                            decoration: BoxDecoration(
                                color: colorScheme.background.white,
                                borderRadius: BorderRadius.circular(45),
                                // image: DecorationImage(
                                //     image:
                                //         Assets.images.addFriend.provider())
                                ), child:  (favoriteCardModel.contact.imageString != null) 
              ? Image.memory(base64Decode(favoriteCardModel.contact.imageString!), fit: BoxFit.fill)
              : Assets.images.addFriend.image())),
                    SizedBox(height: 48),
                    Text(
                        favoriteCardModel.contact.firstName ??
                            favoriteCardModel.contact.username ??
                            '',
                        style: TextStyle(
                            fontFamily: FontFamily.graphik,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: colorScheme.textColor.white)),
                    Text(
                      favoriteCardModel.contact.lastName ?? '',
                      style: TextStyle(
                          fontFamily: FontFamily.graphik,
                          fontSize: 24,
                          color: colorScheme.textColor.white),
                    ),
                    SizedBox(height: 20),
                    Text(favoriteCardModel.contact.notice ?? '',
                        style: TextStyle(
                            fontFamily: FontFamily.graphik,
                            fontSize: 14,
                            color: colorScheme.textColor.white)),
                    Spacer(),
                    Center(
                        child: Container(
                            height: 42,
                            width: 42,
                            decoration: BoxDecoration(
                                color: colorScheme.background.white20,
                                borderRadius: BorderRadius.circular(21)),
                            child: Padding(
                                padding: EdgeInsets.all(8),
                                child: Assets.images.call.image())))
                  ]))
        ]));
  }
}
