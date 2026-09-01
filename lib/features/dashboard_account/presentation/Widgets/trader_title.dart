import 'package:flutter/material.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';
import 'package:trading/utils/app_colors/app_colors.dart';

class TraderTile extends StatelessWidget {
  final int rank;
  final String name, followers, profit;
  final Color badgeColor;

  const TraderTile({
    super.key,
    required this.rank,
    required this.name,
    required this.followers,
    required this.profit,
    required this.badgeColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: ResponsiveHelper.height(8)),
      child: Row(
        children: [
          // Rank Badge (Circle)
          Container(
            width: ResponsiveHelper.width(35),
            height: ResponsiveHelper.width(35),
            decoration: BoxDecoration(
              color: badgeColor,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              "$rank",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: ResponsiveHelper.fontSize(14),
              ),
            ),
          ),
          SizedBox(width: ResponsiveHelper.width(12)),

          // Name & Followers
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: ResponsiveHelper.fontSize(14),
                  ),
                ),
                Text(
                  "$followers Followers",
                  style: TextStyle(
                    color: AppColors.textGrey,
                    fontSize: ResponsiveHelper.fontSize(11),
                  ),
                ),
              ],
            ),
          ),

          // Profit & Icon
          Row(
            children: [
              Text(
                profit,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.textDark,
                  fontSize: ResponsiveHelper.fontSize(14),
                ),
              ),
              SizedBox(width: ResponsiveHelper.width(4)), // optional spacing
              Icon(
                Icons.north_east,
                color: AppColors.primary,
                size: ResponsiveHelper.fontSize(14),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
