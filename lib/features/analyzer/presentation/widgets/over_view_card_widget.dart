import 'package:flutter/material.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';
import 'package:trading/share/widgets/custom_container/custom_container.dart';
import 'package:trading/share/widgets/custom_image/custom_image.dart';
import 'package:trading/utils/app_assets/app_assets.dart';
import 'package:trading/utils/app_colors/app_colors.dart';
import 'package:trading/utils/extension/base_extension.dart';

class OverviewCardWidget extends StatelessWidget {
  const OverviewCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      horizontal: ResponsiveHelper.width(16),
      vertical:ResponsiveHelper.height(16),
      borderColor: AppColors.boarderColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [


          Text("ROI", style: context.bodySmall.copyWith(fontWeight: FontWeight.w500)),

          SizedBox(height: ResponsiveHelper.height(24),),



          Text("\$20450", style: context.bodyMedium),

          Row(
            children: [
              Text(
                "+\$21%", // ← fixed + %
                style: context.bodySmall.copyWith(color: AppColors.primary),
              ),
              CustomImage(imageSrc: AppAssets.topArrow),
            ],
          ),
        ],
      ),
    );
  }
}