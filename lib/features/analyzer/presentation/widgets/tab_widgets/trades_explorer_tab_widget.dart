import 'package:flutter/material.dart';
import 'package:trading/features/analyzer/presentation/widgets/staging_performance_card_widget.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';
import 'package:trading/share/widgets/custom_container/custom_container.dart';
import 'package:trading/share/widgets/custom_image/custom_image.dart';
import 'package:trading/utils/app_assets/app_assets.dart';
import 'package:trading/utils/app_colors/app_colors.dart';
import 'package:trading/utils/app_text/app_strings.dart';
import 'package:trading/utils/extension/base_extension.dart';


class TradesExplorerTabWidget extends StatelessWidget {
  const TradesExplorerTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Widget gap=SizedBox(height: ResponsiveHelper.height(12),);
    return Column(
      children: [
        CustomContainer(
          borderColor: AppColors.boarderColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppText.tagPerformance,
                style: context.bodySmall.copyWith(fontWeight: FontWeight.w700),
              ),

              gap,

              CustomContainer(
                backgroundColor: AppColors.backgroundColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Breakout v2",
                          style: context.bodySmall.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),

                        CustomImage(imageSrc: AppAssets.dropUp),

                      ],
                    ),
                    SizedBox(height: ResponsiveHelper.height(16)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              AppText.side,
                              style: context.bodySmall.copyWith(
                                fontSize: ResponsiveHelper.fontSize(12),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: ResponsiveHelper.height(4)),
                            Text(
                              "+2.1%",
                              style: context.bodySmall.copyWith(
                                fontWeight: FontWeight.w700,
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: ResponsiveHelper.width(24)),
                        Column(
                          children: [
                            Text(
                              AppText.entry,
                              style: context.bodySmall.copyWith(
                                fontSize: ResponsiveHelper.fontSize(12),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: ResponsiveHelper.height(4)),
                            Text(
                              "\$1333",
                              style: context.bodySmall.copyWith(
                                fontWeight: FontWeight.w700,
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: ResponsiveHelper.width(24)),

                        Column(
                          children: [
                            Text(
                              AppText.pl,
                              style: context.bodySmall.copyWith(
                                fontSize: ResponsiveHelper.fontSize(12),
                              ),
                            ),
                            SizedBox(height: ResponsiveHelper.height(4)),
                            Text(
                              "\$1333",
                              style: context.bodySmall.copyWith(
                                fontWeight: FontWeight.w700,
                                color: AppColors.red,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              gap,
              CustomContainer(
                backgroundColor: AppColors.backgroundColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Breakout v2",
                          style: context.bodySmall.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),

                        CustomImage(imageSrc: AppAssets.dropUp),

                      ],
                    ),
                    SizedBox(height: ResponsiveHelper.height(16)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              AppText.side,
                              style: context.bodySmall.copyWith(
                                fontSize: ResponsiveHelper.fontSize(12),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: ResponsiveHelper.height(4)),
                            Text(
                              "+2.1%",
                              style: context.bodySmall.copyWith(
                                fontWeight: FontWeight.w700,
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: ResponsiveHelper.width(24)),
                        Column(
                          children: [
                            Text(
                              AppText.entry,
                              style: context.bodySmall.copyWith(
                                fontSize: ResponsiveHelper.fontSize(12),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: ResponsiveHelper.height(4)),
                            Text(
                              "\$1333",
                              style: context.bodySmall.copyWith(
                                fontWeight: FontWeight.w700,
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: ResponsiveHelper.width(24)),

                        Column(
                          children: [
                            Text(
                              AppText.pl,
                              style: context.bodySmall.copyWith(
                                fontSize: ResponsiveHelper.fontSize(12),
                              ),
                            ),
                            SizedBox(height: ResponsiveHelper.height(4)),
                            Text(
                              "\$1333",
                              style: context.bodySmall.copyWith(
                                fontWeight: FontWeight.w700,
                                color: AppColors.red,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              gap,
            ],
          ),
        ),
        gap,
        gap,



      ],
    );
  }
}
