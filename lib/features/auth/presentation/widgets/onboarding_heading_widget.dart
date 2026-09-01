import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trading/share/widgets/custom_svg_icon/custom_svg_icon.dart';
import 'package:trading/share/widgets/custom_text/custom_text.dart';
import 'package:trading/utils/app_assets/app_assets.dart';
import 'package:trading/utils/app_colors/app_colors.dart';

import 'package:get/get.dart';





class OnboardingHeadingWidget extends StatelessWidget {
  const OnboardingHeadingWidget({
    super.key, required this.title, required this.subTitle, this.maxLine,
  });

  final String title;
  final String subTitle;
  final int? maxLine;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 24.h),
        /// close icon==========================================
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            GestureDetector(
                onTap: (){
                  Get.back();
                },
                child: CustomSvgIcon(icon: AppAssets.close))

          ],),

        CustomText(text: title,fontSize: 24.sp,),
        SizedBox(height:  4.h),
        CustomText(text: subTitle,
          maxLines:maxLine?? 3,
          fontSize: 17.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.subTitle,
        ),


        SizedBox(height: 24.h),
      ],
    );
  }
}