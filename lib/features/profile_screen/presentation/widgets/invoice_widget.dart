import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trading/features/common/presentation/widgets/status_outline_container.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';
import 'package:trading/share/widgets/custom_container/custom_container.dart';
import 'package:trading/share/widgets/custom_image/custom_image.dart';
import 'package:trading/share/widgets/custom_text_field_parent/custom_text_field_parent.dart';
import 'package:trading/utils/app_assets/app_assets.dart';
import 'package:trading/utils/app_colors/app_colors.dart';
import 'package:trading/utils/app_text/app_strings.dart';
import 'package:trading/utils/extension/base_extension.dart';

class InvoiceWidget extends StatelessWidget {
  const InvoiceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainerBorderParent(
      vertical: ResponsiveHelper.height(15),
      horizontal: ResponsiveHelper.width(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "2025-09-14",
                style: context.bodySmall.copyWith(
                  fontSize: ResponsiveHelper.fontSize(12),
                ),
              ),
              Text("AED 79.00", style: context.bodyMedium),
            ],
          ),

          Row(
            children: [
              StatusOutlineContainer(
                statusBgColor: AppColors.primaryShade100,
                statusBorderColor: AppColors.primaryShade100,
                status: AppText.paid,
                statusTextColor: AppColors.primary,
              ),
              SizedBox(width: ResponsiveHelper.width(12)),
              CustomContainer(
                vertical: ResponsiveHelper.height(5),
                horizontal: ResponsiveHelper.width(5),
                borderColor: AppColors.black,

                child: Row(
                  children: [
                    CustomImage(imageSrc: AppAssets.downloadProfile),
                    Text(
                      AppText.download,
                      style: context.bodyMedium.copyWith(
                        fontSize: ResponsiveHelper.fontSize(12),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
