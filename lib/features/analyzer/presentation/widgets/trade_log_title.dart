import 'package:flutter/material.dart';
import 'package:trading/utils/app_colors/app_colors.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';

class TradeLogTile extends StatelessWidget {
  const TradeLogTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: ResponsiveHelper.height(12)),
      padding: ResponsiveHelper.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(ResponsiveHelper.borderRadius(12)),
        border: Border.all(color: AppColors.black),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "XAUUSD",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: ResponsiveHelper.fontSize(14),
                ),
              ),
              Text(
                "2025-10-11",
                style: TextStyle(
                  color: AppColors.textGrey,
                  fontSize: ResponsiveHelper.fontSize(10),
                ),
              ),
            ],
          ),
          SizedBox(height: ResponsiveHelper.height(10)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _infoItem("Side", "Buy", Colors.black),
              _infoItem("Entry", "1928.4", Colors.black),
              _infoItem("Exit", "1923.1", Colors.black),
              _infoItem("P/L", "+\$162.00", AppColors.primary),
            ],
          ),
        ],
      ),
    );
  }

  Widget _infoItem(String label, String value, Color valueColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: AppColors.textGrey,
            fontSize: ResponsiveHelper.fontSize(10),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: ResponsiveHelper.fontSize(12),
            color: valueColor,
          ),
        ),
      ],
    );
  }
}
