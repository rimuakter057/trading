
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trading/features/common/presentation/widgets/status_outline_container.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';
import 'package:trading/share/widgets/custom_container/custom_container.dart';
import 'package:trading/utils/app_colors/app_colors.dart';
import 'package:trading/utils/extension/base_extension.dart';

class DeviceSessionWidget extends StatelessWidget {
  const DeviceSessionWidget({
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
          SizedBox(height: 16.h),
          StatusOutlineContainer(
              verticalPadding: ResponsiveHelper.height(8),
              horizontalPadding: ResponsiveHelper.width(8),
              statusBgColor: AppColors.red,
              statusBorderColor: AppColors.red,
              status: "Terminate",
              statusTextColor: AppColors.white
          )
        ],
      ),
    );
  }
}
