import 'package:flutter/material.dart';

class AppTextStyles {
  AppTextStyles();

  static const String _familyCourierNew = 'CourierNew';
  static const String _familySidewareTrial = 'SidewareTrial';
 
   static const TextStyle h4 = TextStyle(
    fontFamily: _familyCourierNew,
    fontStyle: FontStyle.normal,
    fontSize: 20
  );

  static const TextStyle h5 = TextStyle(
    fontFamily: _familyCourierNew,
    fontStyle: FontStyle.normal,
    fontSize: 18
  );
 
   static const TextStyle h6 = TextStyle(
    fontFamily: _familyCourierNew,
    fontStyle: FontStyle.normal,
    fontSize: 14
  );

    static const TextStyle title = TextStyle(
    fontFamily: _familySidewareTrial,
    fontStyle: FontStyle.normal,
    fontSize: 40
  );
 
   static const TextStyle subtitle = TextStyle(
    fontFamily: _familySidewareTrial,
    fontStyle: FontStyle.normal,
    fontSize: 14
  );
}
