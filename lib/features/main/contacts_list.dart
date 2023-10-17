import 'package:call_app/assets/assets.gen.dart';
import 'package:call_app/features/main/contact_view.dart';
import 'package:call_app/features/main/favorite_card.dart';
import 'package:flutter/material.dart';
import 'package:open_ui/open_ui.dart';

class ContactsList extends StatefulWidget {
  const ContactsList({super.key});

  @override
  State<ContactsList> createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    final colorScheme = appTheme.colorScheme;
    
    return Padding(padding: EdgeInsets.all(20), child:
    ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 5,
      itemBuilder: (context, index) {
        return Padding(padding: EdgeInsets.symmetric(vertical: 10), child: ContactView());
    }
    ));
    
    //  ListWheelScrollView.useDelegate(
    //       itemExtent: 120,
    //       //diameterRatio: 3,
    //       //offAxisFraction: 1,
    //       // 0 - 0.1
    //       //perspective: 0.002,
    //       physics: NeverScrollableScrollPhysics(),
    //       childDelegate: ListWheelChildBuilderDelegate(
    //         childCount: 2,
    //         builder: (context, index) =>  ContactView()),
    //       squeeze: 1,
    //       onSelectedItemChanged: (index) {},
    //     ));
  }
}
