
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class CustomSvgIcon extends StatelessWidget {
  const CustomSvgIcon({
    super.key, required this.icon, this.height, this.width,
  });

  final String icon;
  final double? height;
  final double? width;


  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon, // svg icon path
      width:width?? 24.w,
      height:height?? 24.h,
      fit: BoxFit.contain,
    );
  }
}