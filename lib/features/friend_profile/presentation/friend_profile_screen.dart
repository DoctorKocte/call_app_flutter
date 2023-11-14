import 'dart:async';

import 'package:call_app/assets/assets.gen.dart';
import 'package:call_app/components/primary_button.dart';
import 'package:call_app/features/friend_profile/models/button_model.dart';
import 'package:call_app/features/friend_profile/presentation/blur_buttons_view.dart';
import 'package:call_app/features/main/models/favorite_card_model.dart';
import 'package:flutter/material.dart';
import 'package:open_ui/open_ui.dart';
import 'package:sensors_plus/sensors_plus.dart';

class FriendProfileScreen extends StatefulWidget {
  const FriendProfileScreen({required this.favoriteCardModel, super.key});
  final FavoriteCardModel favoriteCardModel;

  @override
  _FriendProfileScreenState createState() => _FriendProfileScreenState();
}

class _FriendProfileScreenState extends State<FriendProfileScreen> {
  double x = 0;
  double y = 0;
  double z = 0;
  final _streamSubscriptions = <StreamSubscription<dynamic>>[];

  @override
  void initState() {
    _streamSubscriptions.add(gyroscopeEvents.listen(
      (event) {
        setState(() {
          x = event.x;
          y = event.y;
          z = event.z;
        });
      },
      cancelOnError: true,
    ));
    super.initState();
  }

  @override
  void dispose() {
    for (final subscription in _streamSubscriptions) {
      subscription.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    final colorScheme = appTheme.colorScheme;
    final textStyles =
        appTheme.textStyles.withColor(colorScheme.textColor.white);
    final radius = appTheme.radius;
    final spacer = appTheme.spacer;
    final imageHeight = MediaQuery.of(context).size.height * 0.64;
    final containerHeight = MediaQuery.of(context).size.height * 0.4;

    return Scaffold(
      extendBody: true,
      body: Stack(children: [
        Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.003)
              ..rotateX(x)
              ..rotateY(y),
            alignment: FractionalOffset.center,
            child: SizedBox(
                height: imageHeight,
                width: MediaQuery.of(context).size.width,
                child: Hero(
                    tag: 'imageHero ${widget.favoriteCardModel.contact.id}',
                    child: (widget.favoriteCardModel.contact.profileImage !=
                            null)
                        ? widget.favoriteCardModel.contact.profileImage!
                        : Assets.images.addFriend.image(fit: BoxFit.cover)))),
        Positioned(
            bottom: containerHeight + spacer.sp20,
            left: spacer.sp10,
            right: spacer.sp100,
            child: BlurButtonsView(
              buttonModels: const [
                ButtonModel.call,
                ButtonModel.video,
                ButtonModel.favorite
              ],
              buttonsColor: widget.favoriteCardModel.buttonBackground,
            )),
        Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Container(
              height: containerHeight,
              decoration: BoxDecoration(
                  borderRadius: radius.radius18Top,
                  color: widget.favoriteCardModel.backgroundColor),
              child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      spacer.sp16, spacer.sp28, spacer.sp16, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          widget.favoriteCardModel.contact.firstName ??
                              widget.favoriteCardModel.contact.username ??
                              'no name',
                          style: textStyles.graphik36semibold),
                      Text(widget.favoriteCardModel.contact.lastName ?? '',
                          style: textStyles.graphik28light),
                      Flexible(
                          child: Text(
                              widget.favoriteCardModel.contact.notice ?? '',
                              style: textStyles.graphik20normal)),
                      const Spacer(),
                      PrimaryButton(
                          buttonText: 'Close',
                          titleColor: colorScheme.textColor.white,
                          radius: 28,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          color: widget.favoriteCardModel.buttonBackground)
                    ],
                  )),
            ))
      ]),
    );
  }
}
