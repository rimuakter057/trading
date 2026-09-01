import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trading/features/common/presentation/widgets/status_outline_container.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';
import 'package:trading/share/widgets/custom_container/custom_container.dart';
import 'package:trading/share/widgets/custom_image/custom_image.dart';
import 'package:trading/utils/app_assets/app_assets.dart';
import 'package:trading/utils/app_colors/app_colors.dart';
import 'package:trading/utils/extension/base_extension.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountTile extends StatelessWidget {
  final String id, broker, amount, status;
  final Color statusTextColor;
  final Color statusBgColor;
  final Color statusBorderColor;

  const AccountTile({
    super.key,
    required this.id,
    required this.broker,
    required this.amount,
    required this.status,
    required this.statusTextColor,
    required this.statusBgColor,
    required this.statusBorderColor,
    //required this.statusColor
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    id,
                    style: context.titleSmall.copyWith(
                      color: AppColors.textBlack,
                    ),
                  ),
                  SizedBox(width: ResponsiveHelper.width(8)),

                  StatusOutlineContainer(
                    statusBgColor: statusBgColor,
                    statusBorderColor: statusBorderColor,
                    status: status,
                    statusTextColor: statusTextColor,
                  ),
                ],
              ),
              Text(
                broker,
                style: context.titleSmall.copyWith(
                  color: AppColors.blackShade,
                  fontSize: ResponsiveHelper.fontSize(14),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(amount, style: context.bodyMedium),
            Row(
              children: [
                Text(
                  "+0.1%",
                  style: context.bodySmall.copyWith(
                    color: AppColors.primary,
                    fontSize: ResponsiveHelper.fontSize(12),
                  ),
                ),

                CustomImage(imageSrc: AppAssets.topArrow),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
