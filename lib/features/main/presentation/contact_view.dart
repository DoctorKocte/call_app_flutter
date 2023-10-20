import 'dart:convert';

import 'package:call_app/assets/assets.gen.dart';
import 'package:call_app/assets/fonts.gen.dart';
import 'package:call_app/features/main/models/recent_contact.dart';
import 'package:flutter/material.dart';
import 'package:open_ui/open_ui.dart';

class ContactView extends StatelessWidget {
  const ContactView({required this.recentContact, super.key});

  final RecentContact recentContact;

//   @override
//   State<ContactView> createState() => _ContactViewState();
// }

// class _ContactViewState extends State<ContactView> {
  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    final colorScheme = appTheme.colorScheme;

    return DecoratedBox(
        decoration: BoxDecoration(
            color: colorScheme.background.white,
            borderRadius: BorderRadius.circular(16)),
        child: Padding(
            padding: EdgeInsets.all(22),
            child: Row(children: [
              Container(
                  clipBehavior: Clip.hardEdge,
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: colorScheme.background.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: (recentContact.contact.imageString != null)
                      ? Image.memory(
                          base64Decode(
                              recentContact.contact.imageString!),
                          fit: BoxFit.fill)
                      : Assets.images.addFriend.image()),
              SizedBox(width: 20),
              Text(recentContact.contact.username ?? 'no name',
                  style: TextStyle(
                      fontFamily: FontFamily.graphik,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: colorScheme.textColor.darkGray)),
              Spacer()
            ])));
  }
}
