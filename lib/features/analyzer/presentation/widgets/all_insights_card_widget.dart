import 'package:flutter/material.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';
import 'package:trading/share/widgets/custom_container/custom_container.dart';
import 'package:trading/share/widgets/custom_image/custom_image.dart';
import 'package:trading/utils/app_assets/app_assets.dart';
import 'package:trading/utils/app_colors/app_colors.dart';
import 'package:trading/utils/app_text/app_strings.dart';
import 'package:trading/utils/extension/base_extension.dart';



class AllInsightsCardWidget extends StatelessWidget {
  const AllInsightsCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      backgroundColor: AppColors.primaryShade100,
      child: Row(
        children: [
          Container(
            width: ResponsiveHelper.width(4),
            height: ResponsiveHelper.height(200),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(ResponsiveHelper.width(5)),
              ),
              color: AppColors.red,
            ),
          ),
          SizedBox(width: ResponsiveHelper.width(12)),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomContainer(
                      vertical: ResponsiveHelper.height(4),
                      horizontal: ResponsiveHelper.width(4),
                      backgroundColor: AppColors.primaryShade100,
                      borderColor: AppColors.primary,
                      child: Row(
                        children: [
                          CustomImage(
                            imageSrc: AppAssets.insightsAnalyzer,
                          ),
                          Text(
                            AppText.strong,
                            style: context.bodySmall.copyWith(
                              fontWeight: FontWeight.w700,
                              color: AppColors.primary,
                              fontSize: ResponsiveHelper.fontSize(14),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Row(
                      children: [
                        CustomImage(imageSrc: AppAssets.clock),
                        SizedBox(width: ResponsiveHelper.width(4)),
                        Text(
                          "2 min ago",
                          style: context.bodySmall.copyWith(
                            fontSize: ResponsiveHelper.fontSize(12),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: ResponsiveHelper.height(16)),
                Text(
                  "Risk — Wed 18-21 UTC Drawdown Cluster",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: context.bodyMedium.copyWith(
                    fontSize: ResponsiveHelper.fontSize(14),
                  ),
                ),
                SizedBox(height: ResponsiveHelper.height(8)),
                Text(
                  "DD risk +23% vs baseline; losing streaks originate here.",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: context.bodySmall.copyWith(
                    fontSize: ResponsiveHelper.fontSize(12),
                  ),
                ),
                SizedBox(height: ResponsiveHelper.height(8)),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tip: ",
                      style: context.bodySmall.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: ResponsiveHelper.fontSize(12),
                      ),
                    ),

                    Expanded(
                      child: Text(
                        "Avoid entries after 18:00 UTC on Fridays for NAS100",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: context.bodySmall.copyWith(
                          fontSize: ResponsiveHelper.fontSize(12),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}