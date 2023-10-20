import 'package:call_app/features/main/models/favorite_card_model.dart';
import 'package:call_app/features/main/presentation/favorite_card.dart';
import 'package:flutter/material.dart';

class CardsScrollView extends StatelessWidget {
  const CardsScrollView({required this.favoriteCardModels, required this.onCardTap, super.key});

  final List<FavoriteCardModel> favoriteCardModels;
  final Function(FavoriteCardModel) onCardTap;

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
        quarterTurns: 3,
        child: ListWheelScrollView.useDelegate(
          itemExtent: MediaQuery.of(context).size.width / 1.5,
          diameterRatio: 3,
          offAxisFraction: 1,
          perspective: 0.002,
          physics: const FixedExtentScrollPhysics(),
          childDelegate: ListWheelChildBuilderDelegate(
            childCount: favoriteCardModels.length,
            builder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20), 
              child:  RotatedBox(
                      quarterTurns: 1,
                      child: FavoriteCard(
                        favoriteCardModel: favoriteCardModels[index],                       
                        onCardTap: onCardTap,
                      )
               )
            ),
          ),
          onSelectedItemChanged: (index) {},
        )
      );
  }
}
