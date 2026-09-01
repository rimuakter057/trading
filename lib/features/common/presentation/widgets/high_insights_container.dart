
import 'package:flutter/material.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';
import 'package:trading/share/widgets/custom_container/custom_container.dart';
import 'package:trading/share/widgets/custom_image/custom_image.dart';
import 'package:trading/utils/app_assets/app_assets.dart';
import 'package:trading/utils/app_colors/app_colors.dart';
import 'package:trading/utils/app_text/app_strings.dart';
import 'package:trading/utils/extension/base_extension.dart';
class HighInsightsContainerWidget extends StatelessWidget {
  const HighInsightsContainerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      width: double.infinity,
      backgroundColor: AppColors.primary,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppText.bestRoiWindow,
                style: context.titleSmall.copyWith(color: AppColors.white),
              ),
              CustomContainer(
               horizontal:ResponsiveHelper.width(8),
                vertical:ResponsiveHelper.height(4),
                backgroundColor: AppColors.black,
                child: Row(
                  children: [
                    CustomImage(imageSrc: AppAssets.highDashBoardDashboard),
                    Text(
                      AppText.high,
                      style: context.bodySmall.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: ResponsiveHelper.height(12)),
          Text(
            "Trade Between 03:00 - 11:00 UTC",
            style: context.bodySmall.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: ResponsiveHelper.height(6)),
          Text(
            "Historical data shows +1.3% average ROI during this window. Favor high-liquidity instruments.",
            style: context.bodySmall.copyWith(color: AppColors.white),
          ),
          SizedBox(height:ResponsiveHelper.height(16)),
          Row(
            children: List.generate(
              3,
                  (index) => Padding(
                padding:  EdgeInsets.only(right:ResponsiveHelper.width(4)),
                child: Container(
                  height: ResponsiveHelper.height(5),
                  width: ResponsiveHelper.width(5),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}