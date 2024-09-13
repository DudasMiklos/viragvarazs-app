import 'package:flutter/material.dart';

class ApplicationStyle {
  static const Color white = Color(0xffFFFFFF);
  static const Color greyColor = Color(0xffDFE5EF);

  static const Color primaryColor = Color(0xffB59A7C);
  static const Color labelColor = Color(0xffB59A7C);
  static const Color darkColor = Color(0xff161618);
  static const Color blueColor = Color(0xff7C97B5);

  static const Color redColor = Color(0xffC32626);
  static const Color greenColor = Color(0xff7CB59A);
  //TODO

  static const Color blueSecondColor = Color(0xff72C6EF);
  static const Color blueTertiaryColor = Color(0xffCED2FF);

  static const Color primarySecondColor = Color(0xff989FED);
  static const Color primaryTertiaryColor = Color(0xff653DEB);
  static const Color primaryQuaternaryColor = Color(0xff472EA0);

  static const Color grayColor = Color(0xffEAECED);
  static const Color graySecondaryColor = Color(0xffD6D9DE);
  static const Color grayTertiaryColor = Color(0xffA3BAD6);
  static const Color grayQuaternaryColor = Color(0xffD9D9D9);

  static const Color magentaColor = Color(0xffBD0095);
  static const Color secondaryMagentaColor = Color(0xff8D0589);

  static const Color orangeColor = Color(0xffFFA487);
  static const Color orangeSecondaryColor = Color(0xffFF8064);

  static const Color purpleColor = Color(0xff472EA0);

  //JUNK

  static const Color inputLightColor = Color(0xffFFFFFF);
  static const Color inputDarkColor = Color(0xff161618);
  static const Color inputBorderColor = Color(0xffFFFFFF);
  static const Color inputErrorColor = Colors.red;
  static const Color inputHintTextColor = Color(0xffc6c6c9);
  static const Color inputLightTextColor = Color(0xff161618);
  static const Color inputDarkTextColor = Color(0xffFFFFFF);

  static const Color processIndicatorColor = Color(0xffFFFFFF);

  static const Color dividerColor = Color(0xffFFFFFF);

  static const double buttonHeight = 44.0; //used
  static const double borderRadius = 8.0; //used
  static const double cardBorderRadius = 12.0; //used
  static const double sheetBorderRadius = 24.0; //used
  static const double iconSize = 32.0;

  static BorderRadius borderRadiusCircular =
      BorderRadius.circular(borderRadius);

  static BoxShadow boxShadow = const BoxShadow(
    color: Color.fromRGBO(145, 158, 171, 0.2),
    offset: Offset(0, 4),
    blurRadius: 24,
  );
}
