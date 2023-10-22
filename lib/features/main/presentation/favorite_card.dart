import 'dart:convert';

import 'package:call_app/assets/assets.gen.dart';
import 'package:call_app/features/main/models/favorite_card_model.dart';
import 'package:flutter/material.dart';
import 'package:open_ui/open_ui.dart';

class FavoriteCard extends StatelessWidget {
  const FavoriteCard(
      {required this.favoriteCardModel, required this.onCardTap, super.key});

  final FavoriteCardModel favoriteCardModel;
  final Function(FavoriteCardModel) onCardTap;

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    final colorScheme = appTheme.colorScheme;
    final textStyles =
        appTheme.textStyles.withColor(colorScheme.textColor.white);
    final spacer = appTheme.spacer;
    final radius = appTheme.radius;

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
                  borderRadius: radius.radius16,
                  boxShadow: [
                BoxShadow(
                    color: colorScheme.background.black.withOpacity(0.3),
                    blurRadius: 8)
              ])),
          Padding(
              padding: EdgeInsets.all(spacer.sp16),
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
                              borderRadius: radius.radius45,
                            ),
                            child: (favoriteCardModel.contact.imageString !=
                                    null)
                                ? Image.memory(
                                    base64Decode(
                                        favoriteCardModel.contact.imageString!),
                                    fit: BoxFit.fill)
                                : Assets.images.addFriend.image())),
                    const SizedBox(height: 48),
                    Text(
                        favoriteCardModel.contact.firstName ??
                            favoriteCardModel.contact.username ??
                            'no name',
                        style: textStyles.graphik20bold),
                    Text(favoriteCardModel.contact.lastName ?? '',
                        style: textStyles.graphik24normal),
                    const SizedBox(height: 20),
                    Text(favoriteCardModel.contact.notice ?? '',
                        style: textStyles.graphik14normal),
                    const Spacer(),
                    Center(
                        child: Container(
                            height: 42,
                            width: 42,
                            decoration: BoxDecoration(
                                color: colorScheme.background.white20,
                                borderRadius: radius.radius21),
                            child: Padding(
                                padding: EdgeInsets.all(spacer.sp8),
                                child: Assets.images.call.image())))
                  ]))
        ]));
  }
}
