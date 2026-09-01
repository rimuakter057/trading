import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';
import 'package:trading/share/widgets/custom_container/custom_container.dart';
import 'package:google_fonts/google_fonts.dart';


class StatusOutlineContainer extends StatelessWidget {
  const StatusOutlineContainer({
    super.key,
    required this.statusBgColor,
    required this.statusBorderColor,
    required this.status,
    required this.statusTextColor,
    this.horizontalPadding,
    this.verticalPadding, this.fontSize,
  });

  final Color statusBgColor;
  final Color statusBorderColor;
  final String status;
  final Color statusTextColor;
  final double ? horizontalPadding;
  final double ? verticalPadding;
  final double ? fontSize;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
        backgroundColor:statusBgColor,
        borderColor: statusBorderColor,
        radius:ResponsiveHelper.borderRadius(6),
    horizontal:horizontalPadding?? ResponsiveHelper.width(3),
        vertical:verticalPadding?? ResponsiveHelper.height(1),
        child: Center(
          child: Text(status,style: GoogleFonts.instrumentSans(
              fontWeight: FontWeight.w600,
              fontSize:fontSize?? ResponsiveHelper.fontSize(12),
              color: statusTextColor
          ),
          ),
        ));
  }
}