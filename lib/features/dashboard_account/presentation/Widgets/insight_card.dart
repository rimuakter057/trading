import 'package:flutter/material.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';
import 'package:trading/utils/app_assets/app_assets.dart';
import 'package:trading/utils/app_colors/app_colors.dart';


class InsightCard extends StatelessWidget {
  const InsightCard({super.key});

  @override
  Widget build(BuildContext context) {
    // Make sure ResponsiveHelper is initialized at the parent screen
    // ResponsiveHelper.init(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(ResponsiveHelper.width(16)),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(ResponsiveHelper.borderRadius(16)),
        image: DecorationImage(
          image: AssetImage(AppAssets.logo),
          opacity: 0.1,
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // === Top Row ===
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Best ROI Window",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: ResponsiveHelper.fontSize(12),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: ResponsiveHelper.width(8),
                  vertical: ResponsiveHelper.height(4),
                ),
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius:
                  BorderRadius.circular(ResponsiveHelper.borderRadius(20)),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.flash_on,
                      color: Colors.white,
                      size: ResponsiveHelper.fontSize(12),
                    ),
                    Text(
                      " High",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: ResponsiveHelper.fontSize(10),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: ResponsiveHelper.height(12)),

          // === Main Text ===
          Text(
            "Trade Between 03:00 - 11:00 UTC",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: ResponsiveHelper.fontSize(15),
            ),
          ),
          SizedBox(height: ResponsiveHelper.height(6)),

          // === Subtitle Text ===
          Text(
            "Historical data shows +1.3% average ROI during this window. Favor high-liquidity instruments.",
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: ResponsiveHelper.fontSize(11),
            ),
          ),
        ],
      ),
    );
  }
}
