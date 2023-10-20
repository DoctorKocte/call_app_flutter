import 'package:call_app/features/main/models/recent_contact.dart';
import 'package:call_app/features/main/presentation/contact_view.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatelessWidget {
  const ContactsList({required this.recentContacts, super.key});

  final List<RecentContact> recentContacts;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: recentContacts.length,
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ContactView(
                recentContact: recentContacts[index],
              ));
        });
  }
}
