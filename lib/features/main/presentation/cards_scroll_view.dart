import 'package:call_app/features/main/models/contact.dart';
import 'package:call_app/features/main/presentation/favorite_card.dart';
import 'package:flutter/material.dart';
import 'package:open_ui/open_ui.dart';

class CardsScrollView extends StatefulWidget {
  const CardsScrollView({required this.contacts, super.key});

  final List<Contact> contacts;

  @override
  State<CardsScrollView> createState() => _CardsScrollViewState();
}

class _CardsScrollViewState extends State<CardsScrollView> {

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    final colorScheme = appTheme.colorScheme;
    final gradients = [
      colorScheme.gradients.purple,
      colorScheme.gradients.blue,
      colorScheme.gradients.red,
      colorScheme.gradients.pink,
      colorScheme.gradients.green
    ];
    
    return RotatedBox(
        quarterTurns: 3,
        child: ListWheelScrollView.useDelegate(
          itemExtent: MediaQuery.of(context).size.width / 1.5,
          diameterRatio: 3,
          offAxisFraction: 1,
          // 0 - 0.1
          perspective: 0.002,
          physics: const FixedExtentScrollPhysics(),
          childDelegate: ListWheelChildBuilderDelegate(
            childCount: widget.contacts.length,
            builder: (context, index) => Padding(padding: const EdgeInsets.symmetric(horizontal: 20), child:  RotatedBox(
                      quarterTurns: 1,
                      child: FavoriteCard(backgroundGradient: gradients[index], contact: widget.contacts[index],))),
          ),
          //squeeze: 1.1,
          onSelectedItemChanged: (index) {},
        )
      );
  }
}
