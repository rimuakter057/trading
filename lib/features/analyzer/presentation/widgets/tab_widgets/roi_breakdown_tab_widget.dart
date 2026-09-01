import 'package:flutter/material.dart';
import 'package:trading/features/analyzer/presentation/widgets/chart/day_of_week_roi_chart.dart';
import 'package:trading/features/analyzer/presentation/widgets/instrument_heading_row_widget.dart';
import 'package:trading/features/analyzer/presentation/widgets/instrument_row_widget.dart';
import 'package:trading/features/analyzer/presentation/widgets/chart/seson_analysis_chart.dart';
import 'package:trading/features/analyzer/presentation/widgets/chart/entry_count_chart.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';
import 'package:trading/share/widgets/custom_container/custom_container.dart';
import 'package:trading/share/widgets/custom_divider/custom_divider.dart';
import 'package:trading/utils/app_colors/app_colors.dart';
import 'package:trading/utils/app_text/app_strings.dart';


class RoiBreakdownTabWidget extends StatelessWidget {
  const RoiBreakdownTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Widget gap= SizedBox(height: ResponsiveHelper.height(16),);
    return Column(
      children: [

        DayOfWeekROI(
          data: {
            'Mon': 0.9,   // Positive ROI (Green line/dot)
            'Tue': 1.3,   // Strong positive
            'Wed': 0.5,   // Light positive
            'Thu': 0.2,   // Near zero
            'Fri': -0.8,  // Negative ROI (Red line/dot)
            'Sat': 0.15,  // Slight positive
          },
        ),
        gap,
        CustomContainer(
          backgroundColor: AppColors.backgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InstrumentHeadingRow(
                title: "EURUSD",
                subtitle: "STABLE",
              ),
              SizedBox(height: ResponsiveHelper.height(16),),
              InstrumentRowWidget(
                title: AppText.roi,
                number: "+18.2%",
                color: AppColors.primary,
              ),
              CustomDivider(),
              InstrumentRowWidget(title: AppText.trades, number: "+18.2%"),
              CustomDivider(),
              InstrumentRowWidget(title: AppText.winRate, number: "+18.2%"),
              CustomDivider(),
              InstrumentRowWidget(title: AppText.pl, number: "+18.2%"),
              CustomDivider(),
              InstrumentRowWidget(title: "Avg R", number: "+18.2%"),
              CustomDivider(),
              InstrumentRowWidget(
                title: AppText.note,
                number: AppText.stable,
              ),
            ],
          ),
        ),
        gap,
        SessionAnalysisWidget(
          sessionRoi: [0.52, 1.69, 0.76],
          sessions: ['Asia', 'London', 'New York'],
        ),
        gap,
        EntryExitCountsWidget(
          data: [
            TradeEntryData(label: "Market", count: 42, isPositive: true, showTooltip: true),
            TradeEntryData(label: "Limit", count: 32, isPositive: true),
            TradeEntryData(label: "Stop", count: 40, isPositive: false),
            TradeEntryData(label: "Limit", count: 25, isPositive: false),
            TradeEntryData(label: "Manual", count: 15, isPositive: false),
          ],
        ),
        gap,
        gap,


      ],
    );
  }
}
