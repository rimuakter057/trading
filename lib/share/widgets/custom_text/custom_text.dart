import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trading/utils/app_colors/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    this.maxLines,
    this.textAlign = TextAlign.start,
    this.left = 0,
    this.right = 0,
    this.top = 0,
    this.bottom = 0,
    this.fontSize = 16,
    this.fontWeight,
    this.color = Colors.black,
    required this.text,
    this.overflow = TextOverflow.ellipsis,
    this.decoration,
    this.textDecorationColor,
  });

  final double left;
  final double right;
  final double top;
  final double bottom;
  final double fontSize;
  final FontWeight ?fontWeight;
  final Color color;
  final String text;
  final TextAlign textAlign;
  final int? maxLines;
  final TextOverflow overflow;
  final TextDecoration? decoration;

  final Color? textDecorationColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,

      maxLines: maxLines,
      overflow: overflow,
      style: GoogleFonts.instrumentSans(
        fontSize: fontSize,
        fontWeight:fontWeight??FontWeight.w600,
        color: color,
        decoration: decoration,
        decorationColor: textDecorationColor ?? AppColors.black,
        decorationThickness: 2,
      ),
    );
  }
}
