import 'package:call_app/assets/assets.gen.dart';
import 'package:call_app/features/main/favorite_card.dart';
import 'package:flutter/material.dart';
import 'package:open_ui/open_ui.dart';

class CardsScrollView extends StatefulWidget {
  const CardsScrollView({super.key});

  @override
  State<CardsScrollView> createState() => _CardsScrollViewState();
}

class _CardsScrollViewState extends State<CardsScrollView> {

  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme.of(context);
    final colorScheme = appTheme.colorScheme;
    
    return RotatedBox(
        quarterTurns: 3,
        child: ListWheelScrollView.useDelegate(
          itemExtent: MediaQuery.of(context).size.width / 1.5,
          diameterRatio: 3,
          offAxisFraction: 1,
          // 0 - 0.1
          perspective: 0.002,
          physics: FixedExtentScrollPhysics(),
          childDelegate: ListWheelChildBuilderDelegate(
            childCount: 5,
            builder: (context, index) => Padding(padding: EdgeInsets.symmetric(horizontal: 20), child:  RotatedBox(
                      quarterTurns: 1,
                      child: FavoriteCard())),
          ),
          //squeeze: 1.1,
          onSelectedItemChanged: (index) {},
        )
      );
  }
}
