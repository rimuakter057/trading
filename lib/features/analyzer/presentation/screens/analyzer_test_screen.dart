import 'package:flutter/material.dart';
import 'package:trading/features/analyzer/presentation/widgets/portfolio_gauge.dart';
import 'package:trading/features/analyzer/presentation/widgets/status_card.dart';
import 'package:trading/features/common/presentation/widgets/high_insights_container.dart';
import 'package:trading/features/common/presentation/widgets/status_outline_container.dart';
import 'package:trading/share/widgets/custom_container/custom_container.dart';
import 'package:trading/share/widgets/custom_image/custom_image.dart';
import 'package:trading/utils/app_assets/app_assets.dart';
import 'package:trading/utils/app_colors/app_colors.dart';
import 'package:trading/utils/app_text/app_strings.dart';
import 'package:trading/utils/extension/base_extension.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';

class AnalyzerTestScreen extends StatelessWidget {
  const AnalyzerTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: Icon(Icons.grid_view_rounded, color: AppColors.primary),
        title: Text(
          "Analyzer",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: ResponsiveHelper.fontSize(18),
          ),
        ),
        actions: [
          Icon(Icons.notifications_none_outlined, color: Colors.black),
          Icon(Icons.filter_list, color: Colors.black),
          SizedBox(width: ResponsiveHelper.width(10)),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(ResponsiveHelper.width(16)),
        child: Column(
          children: [
            _buildDropdownHeader(),
            SizedBox(height: ResponsiveHelper.height(15)),
            _buildTabSelector(context),
            SizedBox(height: ResponsiveHelper.height(20)),

            PortfolioGauge(),
            SizedBox(height: ResponsiveHelper.height(20)),

            ///static card
            Text(
              "statics",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: ResponsiveHelper.fontSize(16)),
            ),
            StatisticsAnalyzerCard(
              mainTitle: "Total PNL",
              mainValueNumber: "\$12,437",
              title1: 'Fee/Swap',
              title2: 'Commission',
              title3: 'Best Day',
              value1: '123',
              value2: '5344',
              value3: '454353',
            ),

            ///high insights card
            Text(
              "high card",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: ResponsiveHelper.fontSize(16)),
            ),
            HighInsightsContainerWidget(),

            ///key metrics card
            Text(
              "key metrics",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: ResponsiveHelper.fontSize(16)),
            ),
            CustomContainer(
              backgroundColor: AppColors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "title",
                        style: context.bodySmall.copyWith(
                          fontSize: ResponsiveHelper.fontSize(14),
                        ),
                      ),
                      StatusOutlineContainer(
                        statusBgColor: AppColors.primaryShade100,
                        statusBorderColor: AppColors.primary,
                        status: AppText.healthy,
                        statusTextColor: AppColors.primary,
                      ),
                    ],
                  ),
                  Text(
                    "1.78",
                    style: context.bodyMedium.copyWith(
                      fontSize: ResponsiveHelper.fontSize(16),
                    ),
                  ),
                  SizedBox(height: ResponsiveHelper.height(16)),

                  Row(
                    children: [
                      _buildRow(context, title: "title", mainValue: "2363"),
                      SizedBox(width: ResponsiveHelper.width(8)),
                      Text("/", style: context.bodySmall),
                      SizedBox(width: ResponsiveHelper.width(8)),
                      _buildRow(context, title: "title", mainValue: "23"),
                    ],
                  ),
                ],
              ),
            ),

            ///heatmap traders card
            Text(
              "heat map",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: ResponsiveHelper.fontSize(16)),
            ),
            CustomContainer(
              backgroundColor: AppColors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppText.xauUsd,
                        style: context.bodySmall.copyWith(
                          fontWeight: FontWeight.w700,
                          fontSize: ResponsiveHelper.fontSize(14),
                        ),
                      ),
                      Text(
                        "2025-10-11",
                        style: context.bodySmall.copyWith(
                          fontSize: ResponsiveHelper.fontSize(12),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: ResponsiveHelper.height(16)),
                  Row(
                    children: [
                      Column(
                        children: [
                          Text(
                            AppText.side,
                            style: context.bodySmall.copyWith(
                              fontSize: ResponsiveHelper.fontSize(12),
                            ),
                          ),
                          Text(
                            "buy",
                            style: context.bodySmall.copyWith(
                              fontWeight: FontWeight.w700,
                              fontSize: ResponsiveHelper.fontSize(14),
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
                            ),
                          ),
                          Text(
                            "\$1333",
                            style: context.bodySmall.copyWith(
                              fontWeight: FontWeight.w700,
                              fontSize: ResponsiveHelper.fontSize(14),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: ResponsiveHelper.width(24)),
                      Column(
                        children: [
                          Text(
                            AppText.exit,
                            style: context.bodySmall.copyWith(
                              fontSize: ResponsiveHelper.fontSize(12),
                            ),
                          ),
                          Text(
                            "\$1333",
                            style: context.bodySmall.copyWith(
                              fontWeight: FontWeight.w700,
                              fontSize: ResponsiveHelper.fontSize(14),
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
                          Text(
                            "\$1333",
                            style: context.bodySmall.copyWith(
                              fontWeight: FontWeight.w700,
                              fontSize: ResponsiveHelper.fontSize(14),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            /// AI Insights Trail
            Text(
              "AI Insights Trail",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: ResponsiveHelper.fontSize(16)),
            ),
            CustomContainer(
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
            ),

            SizedBox(height: ResponsiveHelper.height(38)),
          ],
        ),
      ),
    );
  }

  Widget _buildDropdownHeader() {
    return Container();
  }

  ///tab selector
  Widget _buildTabSelector(BuildContext context) {
    return CustomContainer(
      backgroundColor: AppColors.grey,
      borderColor: AppColors.tabBoarderColor,
      horizontal: ResponsiveHelper.width(4),
      vertical: ResponsiveHelper.height(4),
      radius: ResponsiveHelper.width(10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(ResponsiveHelper.height(8)),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(ResponsiveHelper.width(8)),
              ),
              child: Center(
                child: Text(
                  "Performance",
                  style: GoogleFonts.inter(
                    fontSize: ResponsiveHelper.fontSize(14),
                    fontWeight: FontWeight.w500,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(ResponsiveHelper.height(8)),
              decoration: BoxDecoration(
                color: AppColors.grey,
                borderRadius: BorderRadius.circular(ResponsiveHelper.width(8)),
              ),
              child: Center(
                child: Text(
                  "Analysis Hub",
                  style: GoogleFonts.inter(
                    fontSize: ResponsiveHelper.fontSize(14),
                    fontWeight: FontWeight.w500,
                    color: AppColors.textBlack,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row _buildRow(
    BuildContext context, {
    required String title,
    required mainValue,
  }) {
    return Row(
      children: [
        Text(
          title,
          style: context.bodySmall.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: ResponsiveHelper.fontSize(14),
          ),
        ),
        SizedBox(width: ResponsiveHelper.width(4)),
        Text(
          "\$$mainValue",
          style: context.bodySmall.copyWith(
            color: AppColors.primary,
            fontSize: ResponsiveHelper.fontSize(14),
          ),
        ),
      ],
    );
  }
}
