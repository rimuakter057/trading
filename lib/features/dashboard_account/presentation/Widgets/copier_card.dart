import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';
import 'package:trading/utils/app_colors/app_colors.dart';

class CopierCard extends StatelessWidget {
  final String title, status, count;
  const CopierCard({
    super.key,
    required this.title,
    required this.status,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ResponsiveHelper.width(140),
      margin: EdgeInsets.only(right: ResponsiveHelper.width(12)),
      padding: ResponsiveHelper.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(ResponsiveHelper.borderRadius(16)),
        border: Border.all(color: AppColors.black),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: ResponsiveHelper.fontSize(13),
            ),
          ),
          SizedBox(height: ResponsiveHelper.height(4)),
          Container(
            padding: ResponsiveHelper.symmetric(horizontal: 6.w, vertical: 2.h),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(
                ResponsiveHelper.borderRadius(4),
              ),
            ),
            child: Text(
              status,
              style: TextStyle(
                color: AppColors.primary,
                fontSize: ResponsiveHelper.fontSize(10),
              ),
            ),
          ),
          Spacer(),
          Container(
            padding: ResponsiveHelper.all(6),
            decoration: BoxDecoration(
              color: AppColors.accentOrange,
              shape: BoxShape.circle,
            ),
            child: Text(
              count,
              style: TextStyle(
                color: Colors.white,
                fontSize: ResponsiveHelper.fontSize(10),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
