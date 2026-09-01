import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trading/features/common/presentation/widgets/status_outline_container.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';
import 'package:trading/share/widgets/custom_container/custom_container.dart';
import 'package:trading/utils/app_colors/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationBoxWidget extends StatelessWidget {
  const NotificationBoxWidget({
    super.key,
    required this.gap,
  });

  final Widget gap;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      borderColor: AppColors.notificationBorder,
      backgroundColor: AppColors.notificationBg,
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Reuters - 12 minutes ago",
                style: GoogleFonts.inter(
                  fontSize: ResponsiveHelper.fontSize(12),
                  fontWeight: FontWeight.w400,
                  color: AppColors.textBlack,
                ),
              ),
              gap,
              Text(
                "Dollar eases as traders eye FOMC minutes; focus on inflation path",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.inter(
                  fontSize: ResponsiveHelper.fontSize(18),
                  fontWeight: FontWeight.w600,
                  color: AppColors.textBlack,
                ),
              ),

              gap,

              Row(
                children: [
                  StatusOutlineContainer(
                    statusBgColor: AppColors.primaryShade100,
                    statusBorderColor: AppColors.black,
                    status: "RISK",
                    statusTextColor: AppColors.primary,

                    fontSize: ResponsiveHelper.fontSize(10),
                  ),
                  SizedBox(width: ResponsiveHelper.width(8),),
                  StatusOutlineContainer(
                    statusBgColor: AppColors.redAccent,
                    statusBorderColor: AppColors.red,
                    status: "HIGH",
                    statusTextColor: AppColors.red,

                    fontSize: ResponsiveHelper.fontSize(10),
                  ),
                ],
              ),

              gap,

              Text(
                "USD slips ahead of minutes; market expects softer tone on inflation risks.",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.inter(
                  fontSize:ResponsiveHelper.fontSize(15),
                  fontWeight: FontWeight.w400,
                  color: AppColors.textBlack,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}