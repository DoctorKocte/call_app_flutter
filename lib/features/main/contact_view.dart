import 'package:call_app/assets/assets.gen.dart';
import 'package:call_app/assets/fonts.gen.dart';
import 'package:flutter/material.dart';
import 'package:open_ui/open_ui.dart';

class ContactView extends StatefulWidget {
  const ContactView({super.key});

  @override
  State<ContactView> createState() => _ContactViewState();
}

class _ContactViewState extends State<ContactView> {
  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    final colorScheme = appTheme.colorScheme;

    return  Container(
      decoration: BoxDecoration(
              color: colorScheme.background.white,
              borderRadius: BorderRadius.circular(16)),
      child:  Padding(padding: EdgeInsets.all(22), child:
  
    Row(
      children: [
      Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
              color: colorScheme.background.white,
              borderRadius: BorderRadius.circular(20),
              image:
                  DecorationImage(image: Assets.images.addFriend.provider()))),
                  SizedBox(width: 20),
      Text('Emmochka',
          style: TextStyle(
              fontFamily: FontFamily.graphik,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: colorScheme.textColor.darkGray)),
    Spacer()
    ])));
  }
}
