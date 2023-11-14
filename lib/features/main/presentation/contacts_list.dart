import 'package:call_app/features/main/models/contact.dart';
import 'package:call_app/features/main/presentation/contact_view.dart';
import 'package:flutter/material.dart';
import 'package:open_ui/open_ui.dart';

class ContactsList extends StatelessWidget {
  const ContactsList({required this.contacts, this.isLastnameNeeded = false, super.key});

  final List<Contact> contacts;
  final bool isLastnameNeeded;

  @override
  Widget build(BuildContext context) {
    final spacer = AppTheme.of(context).spacer;

    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          return Padding(
              padding: EdgeInsets.symmetric(vertical: spacer.sp10),
              child: ContactView(
                contact: contacts[index],
                isLastnameNeeded: isLastnameNeeded,
          ));
        });
  }
}
