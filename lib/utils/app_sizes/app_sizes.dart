import 'package:flutter/material.dart';

class SizeConfig {
  static late double screenWidth;
  static late double screenHeight;
  static late double scaleWidth;
  static late double scaleHeight;

  /// Reference design size: 375 x 812 (iPhone X)
  static const double referenceWidth = 375;
  static const double referenceHeight = 812;

  /// Initialize SizeConfig
  static void init(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    screenWidth = mediaQuery.size.width;
    screenHeight = mediaQuery.size.height;

    scaleWidth = screenWidth / referenceWidth;
    scaleHeight = screenHeight / referenceHeight;
  }

  /// Responsive width
  static double getWidth(double width) => width * scaleWidth;

  /// Responsive height
  static double getHeight(double height) => height * scaleHeight;

  /// Responsive font size
  /// Automatically scale according to screen width
  /// Optional min/max to prevent extremely small or big fonts
  static double getFont(double fontSize, {double? min, double? max}) {
    // Use the smaller scale factor to prevent extreme scaling
    double scale = scaleWidth < scaleHeight ? scaleWidth : scaleHeight;
    double scaledFont = fontSize * scale;
    if (min != null || max != null) {
      return scaledFont.clamp(min ?? 0, max ?? double.infinity);
    }
    return scaledFont;
  }
  /// Responsive padding / margin
  static double getPadding(double padding) => padding * scaleWidth;
}
