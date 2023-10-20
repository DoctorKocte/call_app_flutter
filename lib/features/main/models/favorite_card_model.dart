import 'dart:ui';

import 'package:call_app/features/main/models/contact.dart';

class FavoriteCardModel {
  FavoriteCardModel(
      {required this.backgroundColor,
      required this.buttonBackground,
      required this.backgroundGradient,
      required this.contact});

  Color backgroundColor;
  Color buttonBackground;
  List<Color> backgroundGradient;
  Contact contact;
}
