import 'package:flutter/material.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';
import 'package:trading/utils/app_colors/app_colors.dart';
import 'package:trading/utils/extension/base_extension.dart';
import 'dash_board_chart.dart';


class PerformanceCard extends StatelessWidget {
  const PerformanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    // Make sure ResponsiveHelper is initialized in parent screen
    // ResponsiveHelper.init(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(ResponsiveHelper.width(20)),
      decoration: BoxDecoration(
        color: AppColors.cardDark, // Dark contrast card
        borderRadius: BorderRadius.circular(ResponsiveHelper.borderRadius(24)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // === Balance & Open Profit Row ===
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '\$175,320.58',
                    style: context.bodyLarge.copyWith(
                      color: AppColors.white,
                      fontSize: ResponsiveHelper.fontSize(20),
                    ),
                  ),
                  SizedBox(height: ResponsiveHelper.height(4)),
                  Text(
                    '+18%',
                    style: context.titleMedium.copyWith(
                      color: AppColors.primaryShade,
                      fontSize: ResponsiveHelper.fontSize(14),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    '\$256.36',
                    style: context.titleMedium.copyWith(
                      color: AppColors.white,
                      fontSize: ResponsiveHelper.fontSize(14),
                    ),
                  ),
                  Text(
                    '  open',
                    style: context.titleMedium.copyWith(
                      color: AppColors.subPrimary,
                      fontSize: ResponsiveHelper.fontSize(14),
                    ),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(height: ResponsiveHelper.height(20)),

          // === Tabs Container ===
          Container(
            height: ResponsiveHelper.height(36),
            padding: EdgeInsets.all(ResponsiveHelper.width(4)),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.1),
              borderRadius: BorderRadius.circular(ResponsiveHelper.borderRadius(12)),
            ),
            child: Row(
              children: [
                _buildTab("Week", isSelected: true),
                _buildTab("Month"),
                _buildTab("Year"),
              ],
            ),
          ),

          SizedBox(height: ResponsiveHelper.height(10)),

          // === Chart ===
          DashboardChart(),
        ],
      ),
    );
  }

  Widget _buildTab(String label, {bool isSelected = false}) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(ResponsiveHelper.borderRadius(8)),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.white54,
            fontSize: ResponsiveHelper.fontSize(12),
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
