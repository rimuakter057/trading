import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';
import 'package:trading/share/widgets/custom_container/custom_container.dart';
import 'package:trading/share/widgets/custom_image/custom_image.dart';
import 'package:trading/utils/app_assets/app_assets.dart';
import 'package:trading/utils/app_colors/app_colors.dart';
import 'package:trading/utils/extension/base_extension.dart';





class LinkTradingWidget extends StatelessWidget {
  const LinkTradingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      backgroundColor: AppColors.greyShade,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Primary - Exness",
                style: context.titleSmall.copyWith(color: AppColors.textBlack),
              ),
              Text("MT5-104392", style: context.bodySmall),
            ],
          ),

          Row(
            children: [
              CustomImage(imageSrc: AppAssets.editExnessProfile,
                height: ResponsiveHelper.height(24),
                width: ResponsiveHelper.width(24),
              ),
              SizedBox(width:ResponsiveHelper.width(12),),
              CustomImage(imageSrc: AppAssets.refreshExnessProfile),
              SizedBox(width: ResponsiveHelper.width(12),),
              CustomImage(imageSrc: AppAssets.linkExnessProfile),


            ],
          ),
        ],
      ),
    );
  }
}