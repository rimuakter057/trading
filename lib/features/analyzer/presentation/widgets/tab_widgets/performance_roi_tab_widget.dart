import 'package:flutter/material.dart';
import 'package:trading/features/analyzer/presentation/widgets/chart/performance_bar_chart.dart';
import 'package:trading/features/analyzer/presentation/widgets/portfolio_gauge.dart' show PortfolioGauge;
import 'package:trading/features/analyzer/presentation/widgets/status_card.dart';
import 'package:trading/features/common/presentation/widgets/status_outline_container.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';
import 'package:trading/share/widgets/custom_container/custom_container.dart';
import 'package:trading/utils/app_colors/app_colors.dart';
import 'package:trading/utils/app_text/app_strings.dart';
import 'package:trading/utils/extension/base_extension.dart';


class PerformanceRoiTabWidget extends StatelessWidget {
  const PerformanceRoiTabWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Widget gap=  SizedBox(height: ResponsiveHelper.height(24));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PerformanceBarChart(roiData: [0.4, -1.1, 0.9, 1.9, -1.4, 1.6, 1.3, -1.2, 0.9, 1.2, -1.8, 0.8]),
        SizedBox(height: ResponsiveHelper.height(20)),

        ///static card
        CustomContainer(
          borderColor: AppColors.boarderColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "statics",
                  textAlign: TextAlign.center,
                  style: context.bodySmall.copyWith(fontWeight: FontWeight.w600,)
              ),
              SizedBox(height: ResponsiveHelper.height(6)),
              StatisticsAnalyzerCard(
                mainTitle: "Total PNL",
                mainValue: "Dec'24 ",
                mainValueNumber: "(+2.4%)",
                title1: 'Fee/Swap',
                title2: 'Commission',
                title3: 'Best Day',
                value1: '123',
                value2: '5344',
                value3: '454353',
              ),
             gap,
              StatisticsAnalyzerCard(
                mainTitle: "Open Traders",
                mainValue: "July'24 ",
                mainValueNumber: "(+2.4%)",
                subtitleColor:AppColors.red,
                title1: 'Biggest',
                title2: 'Avg risk',
                title3: 'Avg hold',
                value1: 'XAUUSD  \$123',
                value2: '5344',
                value3: '2h 3m',
              ),
             gap,




            ],
          ),
        ),

        SizedBox(height: ResponsiveHelper.height(20)),

        ///key metrics card
        Text(
          "key metrics",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: ResponsiveHelper.fontSize(16)),
        ),
        KeyMatricsCardWidget(),


    gap,

        CustomContainer(
          backgroundColor: AppColors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Expectacy",
                    style: context.bodySmall.copyWith(
                      fontSize: ResponsiveHelper.fontSize(14),
                    ),
                  ),
                  StatusOutlineContainer(
                    statusBgColor: AppColors.white,
                    statusBorderColor: AppColors.subTitle,
                    status: "AVERAGE",
                    statusTextColor: AppColors.subTitle,
                  ),
                ],
              ),
              Text(
                "+0.20R (\$22 / 0.19%)",
                style: context.bodyMedium.copyWith(
                  fontSize: ResponsiveHelper.fontSize(16),
                ),
              ),
              SizedBox(height: ResponsiveHelper.height(16)),


         Container(
           width: double.infinity,
           height: 10,
           decoration: BoxDecoration(
             color: AppColors.primary,
             borderRadius: BorderRadius.circular(50)
           ),


         ),
              SizedBox(height: ResponsiveHelper.height(6)),



              RichText(
                softWrap: true,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Total Traders: ",
                      style: context.bodySmall.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: ResponsiveHelper.fontSize(14),
                        color: AppColors.subTitle,
                      ),
                    ),
                    TextSpan(
                      text: "2363  ",
                      style: context.bodySmall.copyWith(

                        fontSize: ResponsiveHelper.fontSize(14),
                      ),
                    ),

                    TextSpan(
                      text: "Traders Won: ",
                      style: context.bodySmall.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: ResponsiveHelper.fontSize(14),
                        color: AppColors.subTitle,
                      ),
                    ),
                    TextSpan(
                      text: "2363  ",
                      style: context.bodySmall.copyWith(

                        fontSize: ResponsiveHelper.fontSize(14),
                      ),
                    ),

                    TextSpan(
                      text: "Traders Loss: ",
                      style: context.bodySmall.copyWith(
                        fontWeight: FontWeight.w700,
                        fontSize: ResponsiveHelper.fontSize(14),
                        color: AppColors.subTitle,
                      ),
                    ),
                    TextSpan(
                      text: "2363",
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

    gap,
    gap,


      ],
    );
  }








}

class KeyMatricsCardWidget extends StatelessWidget {
  const KeyMatricsCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      backgroundColor: AppColors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Profit Factor",
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


              Row(
                children: [
                  Text(
                    "Gross Profit",
                    style: context.bodySmall.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: ResponsiveHelper.fontSize(14),
                    ),
                  ),
                  SizedBox(width: ResponsiveHelper.width(4)),
                  Text(
                    "2363",
                    style: context.bodySmall.copyWith(
                      color: AppColors.primary,
                      fontSize: ResponsiveHelper.fontSize(14),
                    ),
                  ),
                ],
              ),
              SizedBox(width: ResponsiveHelper.width(8)),
              Text("/", style: context.bodySmall),
              SizedBox(width: ResponsiveHelper.width(8)),
              Row(
                children: [
                  Text(
                    "Gross Loss",
                    style: context.bodySmall.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: ResponsiveHelper.fontSize(14),
                    ),
                  ),
                  SizedBox(width: ResponsiveHelper.width(4)),
                  Text(
                    "2363",
                    style: context.bodySmall.copyWith(
                      color: AppColors.primary,
                      fontSize: ResponsiveHelper.fontSize(14),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}