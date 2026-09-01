import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';
import 'package:trading/share/widgets/custom_container/custom_container.dart';
import 'package:trading/share/widgets/custom_image/custom_image.dart';
import 'package:trading/utils/app_assets/app_assets.dart';
import 'package:trading/utils/app_colors/app_colors.dart';
import 'package:trading/utils/app_text/app_strings.dart';
import 'package:trading/utils/extension/base_extension.dart';


class CustomUpgradeButton extends StatelessWidget {
  const CustomUpgradeButton({
    super.key, this.onTap,
  });

  final VoidCallback?onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child:  CustomContainer(
    horizontal: ResponsiveHelper.width(6),
        vertical: ResponsiveHelper.height(4),
        backgroundColor: AppColors.primary,
        child: Row(children: [

          CustomImage(imageSrc: AppAssets.upgrade),
          Text(AppText.upgrade,style: context.bodySmall.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.w600
          ),),

        ],),),
    );
  }
}