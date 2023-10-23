import 'package:call_app/assets/assets.gen.dart';
import 'package:call_app/features/main/models/recent_contact.dart';
import 'package:flutter/material.dart';
import 'package:open_ui/open_ui.dart';

class ContactView extends StatelessWidget {
  const ContactView({required this.recentContact, super.key});

  final RecentContact recentContact;

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
                  child: (recentContact.contact.profileImage != null)
                      ? recentContact.contact.profileImage
                      : Assets.images.addFriend.image()),
              const SizedBox(width: 20),
              Flexible(
                  child: Text(recentContact.contact.username ?? 'no name',
                      style: textStyles.graphik16semibold)),
              const Spacer()
            ])));
  }
}
