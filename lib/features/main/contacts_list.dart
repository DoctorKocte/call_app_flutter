import 'package:call_app/features/main/contact_view.dart';
import 'package:call_app/features/main/models/recent_contact.dart';
import 'package:flutter/material.dart';

class ContactsList extends StatefulWidget {
  const ContactsList({required this.recentContacts, super.key});

  final List<RecentContact> recentContacts;

  @override
  State<ContactsList> createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: widget.recentContacts.length,
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ContactView(
                recentContact: widget.recentContacts[index],
              ));
        });
  }
}
