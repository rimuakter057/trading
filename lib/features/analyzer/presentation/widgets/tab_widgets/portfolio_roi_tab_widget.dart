import 'package:flutter/material.dart';
import 'package:trading/features/analyzer/presentation/widgets/portfolio_gauge.dart';
import 'package:trading/features/analyzer/presentation/widgets/status_card.dart';
import 'package:trading/features/common/presentation/widgets/high_insights_container.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';
import 'package:trading/share/widgets/custom_container/custom_container.dart';
import 'package:trading/utils/app_colors/app_colors.dart';
import 'package:trading/utils/app_text/app_strings.dart';
import 'package:trading/utils/extension/base_extension.dart';



class PortfolioRoiTabWidget extends StatelessWidget {
  const PortfolioRoiTabWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Widget gap=  SizedBox(height: ResponsiveHelper.height(24));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PortfolioGauge(),
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
                mainTitle: "Open Traders",
                mainValueNumber: "(+\$92,435)",

                subtitleColor:AppColors.primary,
                title1: 'Biggest',
                title2: 'Avg risk',
                title3: 'Avg hold',
                value1: 'XAUUSD  \$123',
                value2: '5344',
                value3: '2h 3m',
              ),
              gap,
              StatisticsAnalyzerCard(
                mainTitle: "Open Traders",
                mainValueNumber: "(+\$92,435)",
                mainValue: "7 ",
                subtitleColor:AppColors.primary,
                title1: 'Biggest',
                title2: 'Avg risk',
                title3: 'Avg hold',
                value1: 'XAUUSD  \$123',
                value2: '5344',
                value3: '2h 3m',
              ),
              gap,

              StatisticsAnalyzerCard(
                mainTitle: "Open Traders",
                mainValueNumber: "(+\$92,435)",
                mainValue: "7 ",
                subtitleColor:AppColors.primary,
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

        SizedBox(height: ResponsiveHelper.height(24)),

        HighInsightsContainerWidget(),
        SizedBox(height: ResponsiveHelper.height(24)),


      ],
    );
  }
}