import 'package:flutter/material.dart';
import 'package:trading/utils/app_colors/app_colors.dart';

class CustomContainer extends StatelessWidget {
  final Widget child; // Required
  final Color? backgroundColor;
  final Color? borderColor;
  final bool allSides;
  final double? radius;
  final double? width;
  final double? height;
  final BorderRadiusGeometry? borderRadius;
  final EdgeInsetsGeometry? margin;
  final double? vertical;
  final double? horizontal;
final double?boarderWidth;
  const CustomContainer({
    super.key,
    required this.child,
    this.backgroundColor,
    this.borderColor,
    this.allSides = true,
    this.radius,
    this.width,
    this.height,

    this.margin, this.vertical, this.horizontal, this.borderRadius, this.boarderWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.symmetric(horizontal: horizontal??16,vertical: vertical??16),
      width: width,
      height:height,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.white,
        borderRadius:borderRadius?? BorderRadius.circular(radius ?? 8),
        border: allSides
            ? Border.all(
          color: borderColor ?? Colors.transparent,
          width:boarderWidth?? 1,
        )
            : Border(
          bottom: BorderSide(
            color: borderColor ?? Colors.transparent,
            width:boarderWidth?? 1,
          ),
        ),
      ),
      child: child,
    );
  }
}
