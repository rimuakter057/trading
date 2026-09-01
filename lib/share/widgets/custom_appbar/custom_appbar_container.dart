import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trading/utils/app_colors/app_colors.dart';

class CustomAppBarContainer extends StatelessWidget {
  const CustomAppBarContainer({
    super.key, this.padding, required this.child,
  });
  final  EdgeInsetsGeometry? padding;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25.r),
          bottomRight: Radius.circular(25.r),

        ),
        border: Border(
            bottom: BorderSide(
                color: AppColors.boarderColor,
                width: 1
            )
        ),
      ),
      padding:padding?? EdgeInsets.only(left:16.w,right: 16.w,top: 38.h,),
      alignment: Alignment.bottomCenter,
      child: child,
    );
  }
}