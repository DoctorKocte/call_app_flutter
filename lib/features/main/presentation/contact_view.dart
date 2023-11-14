import 'package:call_app/assets/assets.gen.dart';
import 'package:call_app/features/main/models/contact.dart';
import 'package:flutter/material.dart';
import 'package:open_ui/open_ui.dart';

class ContactView extends StatelessWidget {
  const ContactView({required this.contact, this.isLastnameNeeded = false, super.key});

  final Contact contact;
  final bool isLastnameNeeded;

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    final colorScheme = appTheme.colorScheme;
    final textStyles =
        appTheme.textStyles.withColor(colorScheme.textColor.darkGray);
    final spacer = appTheme.spacer;
    final radius = appTheme.radius;

    return DecoratedBox(
        decoration: BoxDecoration(
            color: colorScheme.background.white, borderRadius: radius.radius16),
        child: Padding(
            padding: EdgeInsets.all(spacer.sp20),
            child: Row(children: [
              Container(
                  clipBehavior: Clip.hardEdge,
                  height: 42,
                  width: 42,
                  decoration: BoxDecoration(
                    color: colorScheme.background.white,
                    borderRadius: radius.radius21,
                  ),
                  child: (contact.profileImage != null)
                      ? contact.profileImage
                      : Assets.images.addFriend.image()),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Text(contact.firstName ?? 'no name',
                        style: textStyles.graphik16semibold),
                if (isLastnameNeeded)
                  Text(contact.lastName ?? 'empty lastname',
                          style: textStyles.graphik13semibold.copyWith(color: colorScheme.textColor.disableSecondary))
                else
                  Container()
              ]),
              const Spacer()
            ])));
  }
}
