import 'package:call_app/features/main/models/favorite_card_model.dart';
import 'package:call_app/features/main/presentation/favorite_card.dart';
import 'package:flutter/material.dart';
import 'package:open_ui/open_ui.dart';

class CardsScrollView extends StatelessWidget {
  const CardsScrollView(
      {required this.favoriteCardModels, required this.onCardTap, super.key});

  final List<FavoriteCardModel> favoriteCardModels;
  final Function(FavoriteCardModel) onCardTap;

  @override
  Widget build(BuildContext context) {
    final spacer = AppTheme.of(context).spacer;

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
                padding: EdgeInsets.symmetric(horizontal: spacer.sp20),
                child: RotatedBox(
                    quarterTurns: 1,
                    child: FavoriteCard(
                      favoriteCardModel: favoriteCardModels[index],
                      onCardTap: onCardTap,
                    ))),
          ),
          onSelectedItemChanged: (index) {},
        ));
  }
}
