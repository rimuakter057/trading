import 'package:flutter/material.dart';
import 'package:trading/features/common/presentation/widgets/status_outline_container.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';
import 'package:trading/share/widgets/custom_container/custom_container.dart';
import 'package:trading/share/widgets/custom_divider/custom_divider.dart';
import 'package:trading/utils/app_colors/app_colors.dart';
import 'package:trading/utils/extension/base_extension.dart';

import 'day_widget.dart';
import 'market_news_widget.dart';

class CustomSentimentsSheet extends StatelessWidget {
  const CustomSentimentsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ResponsiveHelper.screenHeight * 0.95,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(ResponsiveHelper.borderRadius(20)),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomContainer(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Text("XAUUSD", style: context.bodyMedium)],
                      ),
                      _riskBadge("Confidence: HIGH"),
                    ],
                  ),
                  SizedBox(height: ResponsiveHelper.height(15)),
                  Row(
                    children: [
                      Text("68%", style: context.bodySmall),
                      SizedBox(width: ResponsiveHelper.width(4)),
                      Expanded(
                        child: CustomContainer(
                          horizontal: ResponsiveHelper.width(2),
                          vertical: ResponsiveHelper.height(2),
                          backgroundColor: AppColors.greyShade,
                          child: _sentimentBar(),
                        ),
                      ),
                      SizedBox(width: ResponsiveHelper.width(4)),
                      Text("32%", style: context.bodySmall),
                    ],
                  ),
                ],
              ),
            ),

            /// Time of Day Heat=============================
            Padding(
              padding: ResponsiveHelper.all(8.0),
              child: buildTimeOfDayHeat(context: context),
            ),

            /// Custom Divider================================
            Padding(
              padding: ResponsiveHelper.symmetric(horizontal: 8.0),
              child: CustomDivider(),
            ),

            /// Market News======================================
            MarketNewsWidget(isSheet: true),
             ///button=========================================
            Padding(
              padding: ResponsiveHelper.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: ResponsiveHelper.spacing(8)),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      3,
                      (index) => Container(
                        margin: ResponsiveHelper.symmetric(horizontal: 4),
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                          color: AppColors.primary, // active color
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: ResponsiveHelper.spacing(16)),
                  OutlinedButton(
                    onPressed: () {},
                    child: Text("Add to watchlist"),
                  ),
                  SizedBox(height: ResponsiveHelper.spacing(8)),
                  ElevatedButton(onPressed: () {}, child: Text("Analyze")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  ///sentiment bar---------------===========================================

  Widget _sentimentBar() {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ResponsiveHelper.width(8),
            ),
            child: Row(
              children: List.generate(20, (index) {
                return Expanded(
                  child: Container(
                    height: ResponsiveHelper.height(4),
                    margin: EdgeInsets.symmetric(
                      horizontal: ResponsiveHelper.width(1),
                    ),

                    decoration: BoxDecoration(
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(
                        ResponsiveHelper.borderRadius(5),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }

  ///risk badge====================================
  Widget _riskBadge(String label) {
    Color color;

    switch (label) {
      case "HIGH":
        color = AppColors.primary;
        break;
      case "LOW":
        color = AppColors.red;
        break;
      case "MEDIUM":
        color = AppColors.orange;
        break;
      default:
        color = AppColors.primary;
    }

    return StatusOutlineContainer(
      statusBgColor: AppColors.primaryShade100,
      statusBorderColor: AppColors.primary,
      status: label,
      statusTextColor: color,
    );
  }
}
