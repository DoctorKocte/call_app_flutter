import 'dart:ui';

import 'package:call_app/components/round_button.dart';
import 'package:call_app/features/friend_profile/models/button_model.dart';
import 'package:flutter/material.dart';
import 'package:open_ui/open_ui.dart';


class BlurButtonsView extends StatelessWidget {
  const BlurButtonsView({required this.buttonModels, this.buttonsColor = Colors.white, super.key});

  final List<ButtonModel> buttonModels;
  final Color buttonsColor;

//   @override
//   State<BlurButtonsView> createState() => _BlurButtonsViewState();
// }

// class _BlurButtonsViewState extends State<BlurButtonsView> {
  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    final colorScheme = appTheme.colorScheme;

    return  Container(
        height: 60,
        clipBehavior: Clip.hardEdge,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30))),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
          child: Container(
              decoration: BoxDecoration(
                  color: colorScheme.background.white.withOpacity(0.5)),
              child: Padding(
                padding: EdgeInsets.all(6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: buttonModels.map((buttonModel) => RoundButton(
                        buttonImage: buttonModel.image,
                        onPressed: () {},
                        radius: 22,
                        color: buttonsColor)).toList()
               )),
              ),
        ));
  }
}
