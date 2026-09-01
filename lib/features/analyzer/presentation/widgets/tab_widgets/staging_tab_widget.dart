import 'package:flutter/material.dart';
import 'package:trading/features/analyzer/presentation/widgets/chart/entry_count_chart.dart'
    show EntryExitCountsWidget, TradeEntryData;
import 'package:trading/features/analyzer/presentation/widgets/chart/performance_bar_chart.dart';
import 'package:trading/features/analyzer/presentation/widgets/chart/seson_analysis_chart.dart';
import 'package:trading/features/analyzer/presentation/widgets/heatmap_card_widget.dart';
import 'package:trading/features/analyzer/presentation/widgets/staging_performance_card_widget.dart';
import 'package:trading/features/analyzer/presentation/widgets/tab_widgets/performance_roi_tab_widget.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';
import 'package:trading/share/widgets/custom_container/custom_container.dart';
import 'package:trading/utils/app_colors/app_colors.dart';
import 'package:trading/utils/app_text/app_strings.dart';
import 'package:trading/utils/extension/base_extension.dart';

import 'consistency_card_widget.dart';

class StagingTabWidget extends StatelessWidget {
  const StagingTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Widget gap = SizedBox(height: ResponsiveHelper.height(8));
    return Column(
      children: [
        EntryExitCountsWidget(
          data: [
            TradeEntryData(
              label: "Market",
              count: 42,
              isPositive: true,
              showTooltip: true,
            ),
            TradeEntryData(label: "Limit", count: 32, isPositive: true),
            TradeEntryData(label: "Stop", count: 40, isPositive: false),
            TradeEntryData(label: "Limit", count: 25, isPositive: false),
            TradeEntryData(label: "Manual", count: 15, isPositive: false),
          ],
        ),

        gap,

        CustomContainer(
          borderColor: AppColors.boarderColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppText.tagPerformance,
                style: context.bodySmall.copyWith(fontWeight: FontWeight.w700),
              ),

              SizedBox(height: ResponsiveHelper.height(12)),

              StagingPerformanceCardWidget(),
              gap,
              StagingPerformanceCardWidget(),
              gap,
              StagingPerformanceCardWidget(),
              gap,
            ],
          ),
        ),
        gap,

        SessionAnalysisWidget(
          sessionRoi: [0.52, 1.69, 0.76],
          sessions: ['Asia', 'London', 'New York'],
        ),
        gap,
        PerformanceBarChart(
          roiData: [
            0.4,
            -1.1,
            0.9,
            1.9,
            -1.4,
            1.6,
            1.3,
            -1.2,
            0.9,
            1.2,
            -1.8,
            0.8,
          ],
        ),
        gap,

        CustomContainer(
          borderColor: AppColors.boarderColor,
          child: Column(
            children: [
              ConsistencyCardWidget(),
              gap,

              Row(
                children: [
                  Expanded(child: ConsistencyCardWidget()),
                  SizedBox(width: ResponsiveHelper.width(8)),
                  Expanded(child: ConsistencyCardWidget()),
                ],
              ),
            ],
          ),
        ),
        gap,
        gap,
        gap,
        gap,
      ],
    );
  }
}
