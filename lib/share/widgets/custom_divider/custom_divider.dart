import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trading/utils/app_colors/app_colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key, this.color, this.thickness,
  });
final Color? color;
final double?thickness;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,  // full screen width
      child: Divider(
        color:color??AppColors.boarderColor,
        thickness:thickness?? 1.h,
      ),
    );
  }
}