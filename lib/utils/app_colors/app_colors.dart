import 'package:flutter/material.dart';



//
// | Opacity % | Decimal | Hex | Flutter Hex |
// | --------- | ------- | --- | ----------- |
// | 0%        | 0       | 00  | 0x00FFFFFF  |
// | 5%        | 13      | 0D  | 0x0DFFFFFF  |
// | 10%       | 26      | 1A  | 0x1AFFFFFF  |
// | 15%       | 38      | 26  | 0x26FFFFFF  |
// | 20%       | 51      | 33  | 0x33FFFFFF  |
// | 25%       | 64      | 40  | 0x40FFFFFF  |
// | 30%       | 77      | 4D  | 0x4DFFFFFF  |
// | 35%       | 89      | 59  | 0x59FFFFFF  |
// | 40%       | 102     | 66  | 0x66FFFFFF  |
// | 45%       | 115     | 73  | 0x73FFFFFF  |
// | 50%       | 128     | 80  | 0x80FFFFFF  |
// | 55%       | 140     | 8C  | 0x8CFFFFFF  |
// | 60%       | 153     | 99  | 0x99FFFFFF  |
// | 65%       | 166     | A6  | 0xA6FFFFFF  |
// | 70%       | 179     | B3  | 0xB3FFFFFF  |
// | 75%       | 191     | BF  | 0xBFFFFFFF  |
// | 80%       | 204     | CC  | 0xCCFFFFFF  |
// | 85%       | 217     | D9  | 0xD9FFFFFF  |
// | 90%       | 230     | E6  | 0xE6FFFFFF  |
// | 95%       | 242     | F2  | 0xF2FFFFFF  |
// | 100%      | 255     | FF  | 0xFFFFFFFF  |


class AppColors {
  static const Color primary = Color(0xff00897B);
  static const Color primaryShade100 = Color(0xFFE0F2F1);
  static const Color primaryShade = Color(0xFF27A69A);
  static const Color dotedGrey=Color(0x33FFFFFF);
  static const Color yellowOnBoardingText=Color(0xFFFFC009);
  static const Color yellowShade=Color(0xFFFFECB3);
  static const Color yellowShadeCalculate=Color(0xFFFFF4D2);
  static const Color brown=Color(0xFF9B7300);
 static const Color textBlack=Color(0xFF0B0F20);
  static const Color boarderTextField=Color(0xffC8C8C8);
  static const Color textFieldBg=Color(0xffFFFFFF);
  static const Color hintText=Color(0xff7E8A93);
  static const Color subPrimary=Color(0xFF4E5D66);
  //static const Color fieldIconColor=Color(0xFF4E5D66);
 static const Color subTitle=Color(0xFF2C3440);
  static const Color green = Color(0xff44A047);
  static const Gradient onBoardingGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0x000B0E20), // #0B0E2000 (transparent)
      Color(0xFF0B0E20), // #0B0E20





    ],
  );
  static const backgroundColor = Color(0xffF7F8FA);
  static const dividerColor=Color(0xFFE6EAED);
  static const Color grey = Color(0xffE2E2E2);
 static const Color greyShade = Color(0xffEEF0F4);
  static const Color greySwitch = Color(0xFFBDBDBD);
  static const Color white = Color(0xffFFFFFF);
  static const Color black = Color(0xff000000);
  static const Color blackShade=Color(0xff2C3440);
  static const Color errorColor = Color(0xffFF0000);
 static const Color outlineBorder=Color(0xFF7E8A93);
  static const Color background = Color(0xFFF5F7F8);
  static const Color cardDark = Color(0xFF0D1424);
  static const Color greyCancel=Color(0xFF929292);
  static const Color textDark = Color(0xFF1A1A1A);
  static const Color textGrey = Color(0xFF7A7A7A);
  static const Color blueGrey = Color(0xFF97BFE1);
  static const Color blue = Color(0xFF0088FF);
  static const Color blueShade = Color(0xFFE3F2FD);
  static const Color orange = Color(0xFFE67E22);
  static const Color orangeShadeBg = Color(0x1AE67E22);
  static const Color deletePopBgColor=Color(0xCCFFFFFF);
  static const Color accentOrange = Color(0xFFF2994A);
  static const Color greenShade = Color(0xFFE8F5E9);
  static const Color red = Color(0xffD10000);
  static const Color redDelete = Color(0xFFFF9092);
  static const Color redAccent = Color(0x0DF53F3F);
  static const Color labelText = Color(0xFF7E8A93);
  static const Color boarderColor = Color(0xFFE1E1E1);
  static const Color tabBoarderColor = Color(0xFFD4DADF);
  static const Color analyzerTabColor=Color(0xFFE1D6D6);
  static const Color notificationBg = Color(0x0DC7680D);
  static const Color notificationBorder = Color(0xffD8CAB2);






}
