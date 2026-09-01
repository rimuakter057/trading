import 'package:flutter/material.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';
import 'package:trading/utils/app_colors/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';


final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: AppColors.backgroundColor,

  /// AppBar ===============================================
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.white,
    elevation: 0,
    centerTitle: true,
    iconTheme: IconThemeData(color: AppColors.black),
  ),

  /// Elevated Button ======================================
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      minimumSize: Size(double.infinity, ResponsiveHelper.height(50)),
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(ResponsiveHelper.borderRadius(6)),
      ),
      foregroundColor: AppColors.white,
      textStyle: GoogleFonts.instrumentSans(
        fontSize: ResponsiveHelper.fontSize(18),
        fontWeight: FontWeight.w600,
      ),
    ),
  ),

  /// Outlined Button =====================================
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      side: BorderSide(
        color: AppColors.outlineBorder,
        width: ResponsiveHelper.width(1),
      ),
      foregroundColor: AppColors.black,
      minimumSize: Size(double.infinity, ResponsiveHelper.height(61)),
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveHelper.width(32),
        vertical: ResponsiveHelper.height(16),
      ),
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(ResponsiveHelper.borderRadius(6)),
      ),
      textStyle: GoogleFonts.inter(
        color: AppColors.black,
        fontSize: ResponsiveHelper.fontSize(18),
        fontWeight: FontWeight.w600,
      ),
    ),
  ),

  /// Text Button =========================================
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      foregroundColor: AppColors.black,
      textStyle: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: ResponsiveHelper.fontSize(14),
        decoration: TextDecoration.underline,
      ),
    ),
  ),

  /// Icon Theme ==========================================
  iconTheme: const IconThemeData(color: AppColors.black),

  /// InputDecoration Theme ==============================
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: AppColors.textFieldBg,
    iconColor: AppColors.subPrimary,
    prefixIconColor: AppColors.subPrimary,
    prefixIconConstraints: BoxConstraints(
      minWidth: ResponsiveHelper.width(24),
      minHeight: ResponsiveHelper.height(24),
    ),
    suffixIconColor: AppColors.subPrimary,
    contentPadding: EdgeInsets.zero,
    isDense: true,
    labelStyle: GoogleFonts.instrumentSans(
      fontWeight: FontWeight.w500,
      fontSize: ResponsiveHelper.fontSize(16),
      color: AppColors.subPrimary,
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(ResponsiveHelper.borderRadius(12)),
      borderSide: BorderSide(color: AppColors.errorColor),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(ResponsiveHelper.borderRadius(12)),
      borderSide: BorderSide(width: ResponsiveHelper.width(2), color: AppColors.errorColor),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(ResponsiveHelper.borderRadius(12)),
      borderSide: BorderSide(color: AppColors.black),
    ),
    border: InputBorder.none,
    enabledBorder: InputBorder.none,
    focusedBorder: InputBorder.none,
    hintStyle: GoogleFonts.instrumentSans(
      fontWeight: FontWeight.w500,
      fontSize: ResponsiveHelper.fontSize(16),
      color: AppColors.subPrimary,
    ),
    errorStyle: GoogleFonts.instrumentSans(
      fontSize: ResponsiveHelper.fontSize(12),
      fontWeight: FontWeight.w400,
      color: AppColors.errorColor,
    ),
  ),

  /// Text Theme ==========================================
  textTheme: TextTheme(
    bodyLarge: GoogleFonts.instrumentSans(
      fontSize: ResponsiveHelper.fontSize(20),
      fontWeight: FontWeight.w700,
      color: AppColors.textBlack,
    ),
    bodyMedium: GoogleFonts.instrumentSans(
      fontSize: ResponsiveHelper.fontSize(18),
      fontWeight: FontWeight.w600,
      color: AppColors.textBlack,
    ),
    bodySmall: GoogleFonts.instrumentSans(
      fontSize: ResponsiveHelper.fontSize(14),
      fontWeight: FontWeight.w400,
      color: AppColors.subPrimary,
    ),
    titleLarge: GoogleFonts.instrumentSans(
      fontSize: ResponsiveHelper.fontSize(28),
      fontWeight: FontWeight.w700,
      color: AppColors.textBlack,
    ),
    titleMedium: GoogleFonts.instrumentSans(
      fontSize: ResponsiveHelper.fontSize(17),
      fontWeight: FontWeight.w400,
      color: AppColors.subTitle,
    ),
    titleSmall: GoogleFonts.instrumentSans(
      fontSize: ResponsiveHelper.fontSize(16),
      fontWeight: FontWeight.w600,
      color: AppColors.subTitle,
    ),
    labelMedium: GoogleFonts.instrumentSans(
      fontWeight: FontWeight.w500,
      fontSize: ResponsiveHelper.fontSize(18),
      color: AppColors.textBlack,
    ),
  ),
);
