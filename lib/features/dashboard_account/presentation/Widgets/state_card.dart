import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';
import 'package:trading/share/widgets/custom_container/custom_container.dart';
import 'package:trading/share/widgets/custom_image/custom_image.dart';
import 'package:trading/utils/app_assets/app_assets.dart';
import 'package:trading/utils/app_colors/app_colors.dart';
import 'package:trading/utils/extension/base_extension.dart';




class StatCard extends StatelessWidget {
  final String title;
  final String amount;
  final String percent;

  const StatCard({
    super.key,
    required this.title,
    required this.amount,
    required this.percent, // only number: "2.1"
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      horizontal: ResponsiveHelper.height(8),
      vertical:ResponsiveHelper.width(8),
      width: ResponsiveHelper.width(100),
      margin: EdgeInsets.only(right: ResponsiveHelper.width(12),),
      borderColor: AppColors.boarderColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomImage(imageSrc: AppAssets.insightsDashboard),
          SizedBox(height: ResponsiveHelper.height(24),),

          Text(title, style: context.bodySmall),

          Text("\$$amount", style: context.bodyMedium),

          Row(
            children: [
              Text(
                "+$percent%", // ← fixed + %
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