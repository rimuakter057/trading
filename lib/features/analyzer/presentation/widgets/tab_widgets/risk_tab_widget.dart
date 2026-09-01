import 'package:flutter/material.dart';
import 'package:trading/features/common/presentation/widgets/status_outline_container.dart';
import 'package:trading/features/copier/presentation/widgets/setting_sheet_slave.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';
import 'package:trading/share/widgets/custom_container/custom_container.dart';
import 'package:trading/share/widgets/custom_image/custom_image.dart';
import 'package:trading/utils/app_assets/app_assets.dart';
import 'package:trading/utils/app_colors/app_colors.dart';
import 'package:trading/utils/extension/base_extension.dart';
import 'package:get/get.dart';

class RiskTabWidget extends StatelessWidget {
  const RiskTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Widget gap = SizedBox(height: ResponsiveHelper.height(16));
    return SingleChildScrollView(
      child: Column(
        children: [
          gap,
          TextButton(
            onPressed: () {
              Get.bottomSheet(
                SettingSheetSlaveWidget(),
                isScrollControlled: true,
              );
            },
            child: Text("open bottom sheet"),
          ),
          gap,

          CustomContainer(
            borderColor: AppColors.boarderColor,
            child: CustomContainer(
              backgroundColor: AppColors.backgroundColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Daily Loss %",
                        style: context.bodySmall.copyWith(
                          fontSize: ResponsiveHelper.fontSize(14),
                        ),
                      ),
                      StatusOutlineContainer(
                        statusBgColor: AppColors.primaryShade100,
                        statusBorderColor: AppColors.primary,
                        status: "AVERAGE",
                        statusTextColor: AppColors.primary,
                      ),
                    ],
                  ),
                  Text(
                    "+0.20R (\$22 / 0.19%)",
                    style: context.bodyMedium.copyWith(
                      fontSize: ResponsiveHelper.fontSize(16),
                      color: AppColors.subTitle,
                    ),
                  ),
                  SizedBox(height: ResponsiveHelper.height(16)),

                  Container(
                    width: double.infinity,
                    height: 10,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  SizedBox(height: ResponsiveHelper.height(6)),

                  RichText(
                    softWrap: true,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Today’s realized P/L: ",
                          style: context.bodySmall.copyWith(
                            fontWeight: FontWeight.w700,
                            fontSize: ResponsiveHelper.fontSize(14),
                            color: AppColors.subTitle,
                          ),
                        ),
                        TextSpan(
                          text: " −1.4% of equity (= 28% × 5% rule)",

                          style: context.bodySmall.copyWith(
                            fontSize: ResponsiveHelper.fontSize(14),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          gap,
          CustomContainer(
            borderColor: AppColors.boarderColor,

            child: CustomContainer(
              backgroundColor: AppColors.redAccent,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            StatusOutlineContainer(
                              statusBgColor: AppColors.redAccent,
                              statusBorderColor: AppColors.red,
                              status: "Critial: Risk",
                              statusTextColor: AppColors.red,
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
                          style: context.bodySmall.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: ResponsiveHelper.height(8)),
                        Text(
                          "DD risk +23% vs baseline; losing streaks originate here.",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: context.bodySmall.copyWith(
                            fontWeight: FontWeight.w500,
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
                                  fontWeight: FontWeight.w500,
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
            ),
          ),
          gap,
          CustomContainer(
            borderColor: AppColors.boarderColor,

            child: CustomContainer(
              backgroundColor: AppColors.redAccent,
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            StatusOutlineContainer(
                              statusBgColor: AppColors.orangeShadeBg,
                              statusBorderColor: AppColors.orange,
                              status: "Warning: Margin",
                              statusTextColor: AppColors.orange,
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
                          style: context.bodySmall.copyWith(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: ResponsiveHelper.height(8)),
                        Text(
                          "DD risk +23% vs baseline; losing streaks originate here.",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: context.bodySmall.copyWith(
                            fontWeight: FontWeight.w500,
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
                                  fontWeight: FontWeight.w500,
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
            ),
          ),
        ],
      ),
    );
  }
}
