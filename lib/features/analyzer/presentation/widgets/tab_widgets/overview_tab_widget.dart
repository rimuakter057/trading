import 'package:flutter/material.dart';

import 'package:trading/features/analyzer/presentation/widgets/over_view_card_widget.dart';
import 'package:trading/features/analyzer/presentation/widgets/chart/drow_down_series_chart.dart';
import 'package:trading/features/analyzer/presentation/widgets/return_distribution_chart.dart';
import 'package:trading/features/dashboard_account/presentation/widgets/performance_card.dart';

import 'package:trading/helper/responsive_helper/responsive_helper.dart';

class OverviewTabWidget extends StatelessWidget {
  const OverviewTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Widget gap=SizedBox(height:ResponsiveHelper.height(16) );
    return Column(
      children: [
        /// Graph Chart
        PerformanceCard(),

         SizedBox(height:ResponsiveHelper.height(16) ),

        /// GridView Builder
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 4,
          gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio:ResponsiveHelper.height(1.3) ,
          ),
          itemBuilder: (context, index) {
            return OverviewCardWidget();



          },
        ),
       gap,

        ReturnDistributionWidget(
          values: [5.5, 10.2, 15.8, 22.0, 13.5, 9.5, 3.0],
          buckets: ['-1.0', '-0.5', '-0.2', '0', '0.2', '0.5', '1.0'],
        ),
        gap,
        DrawdownSeriesWidget(
          drawdownData: {
            '1 Oct': -0.58,
            '2 Oct': -0.96,
            '3 Oct': -0.38,
            '4 Oct': 0.0,
            '5 Oct': -0.59,
            '6 Oct': 0.0,
            '7 Oct': 0.0,
          },
        ),
        gap,
        gap,

      ],
    );
  }
}



