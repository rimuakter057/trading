import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';
import 'package:trading/share/widgets/custom_container/custom_container.dart';
import 'package:trading/share/widgets/custom_image/custom_image.dart';
import 'package:trading/utils/app_assets/app_assets.dart';
import 'package:trading/utils/app_colors/app_colors.dart';
import 'package:trading/utils/extension/base_extension.dart';

class MasterAccountCardAnalyzer extends StatelessWidget {
  final String title;
  final int enabled;
  final int disabled;

  const MasterAccountCardAnalyzer({
    super.key,
    required this.title,
    required this.enabled,
    required this.disabled,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      vertical: ResponsiveHelper.height(12),
        borderColor: AppColors.boarderColor,
        
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left Side: Text Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: context.bodyMedium,
                ),
                SizedBox(height:ResponsiveHelper.height(4)),
                Text(
                  "Slaves Enabled: $enabled  Disabled: $disabled",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.bodySmall.copyWith(fontWeight: FontWeight.w600,color: AppColors.textBlack)
                ),
              ],
            ),
          ),


          CustomContainer(
            width:ResponsiveHelper.width(64),
            horizontal:ResponsiveHelper.width(2) ,
            vertical: ResponsiveHelper.height(2),
            radius: ResponsiveHelper.borderRadius(50),
            backgroundColor: AppColors.orange,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomImage(imageSrc: AppAssets.masterAccountShare),
                SizedBox(width: ResponsiveHelper.width(4)),
                Text(
                  "10",
                  style: context.titleSmall.copyWith(color: AppColors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
