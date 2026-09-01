import 'package:fl_chart/fl_chart.dart' show FlSpot;
import 'package:flutter/material.dart';
import 'package:trading/features/analyzer/presentation/widgets/roi_heat_map.dart';
import 'package:trading/features/common/presentation/widgets/custom_circular_profile_progress.dart';
import 'package:trading/features/common/presentation/widgets/custom_graph_chart_one.dart';
import 'package:trading/features/analyzer/presentation/widgets/chart/day_of_week_roi_chart.dart';
import 'package:trading/features/analyzer/presentation/widgets/chart/drow_down_series_chart.dart';
import 'package:trading/features/analyzer/presentation/widgets/chart/entry_count_chart.dart';
import 'package:trading/features/common/presentation/widgets/over_view_area_chart.dart';
import 'package:trading/features/analyzer/presentation/widgets/chart/performance_bar_chart.dart';
import 'package:trading/features/analyzer/presentation/widgets/portfolio_roi_widget.dart';
import 'package:trading/features/analyzer/presentation/widgets/return_distribution_chart.dart';
import 'package:trading/features/analyzer/presentation/widgets/rist_out_chart.dart';
import 'package:trading/features/analyzer/presentation/widgets/chart/roling_profit_factor_chart.dart';
import 'package:trading/features/analyzer/presentation/widgets/chart/seson_analysis_chart.dart';
import 'package:trading/features/common/presentation/widgets/slip_page_symbol.dart';
import 'package:trading/features/common/presentation/widgets/spread_analysis.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';
import 'package:trading/utils/app_colors/app_colors.dart';

import '../../../analyzer/presentation/widgets/rio_heat_map.dart' show ROIHeatmap;


class GraphChartScreen extends StatefulWidget {
  const GraphChartScreen({super.key});

  @override
  State<GraphChartScreen> createState() => _GraphChartScreenState();
}

class _GraphChartScreenState extends State<GraphChartScreen> {
  @override
  Widget build(BuildContext context) {
    final Widget gap=SizedBox(height:ResponsiveHelper.height(8));

    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            CustomGraphCard(
              totalBalance: "\$175,320.56",
              percentage: "+18%",
              openBalance: "256.35",
              mainData: [
                FlSpot(0, 100), FlSpot(1, 150), FlSpot(2, 120),
                FlSpot(3, 200), FlSpot(4, 500), FlSpot(5, 150), FlSpot(6, 150),
              ],
              secondaryData: [
                FlSpot(0, 50), FlSpot(1, 60), FlSpot(2, 110),
                FlSpot(3, 60), FlSpot(4, 120), FlSpot(5, 80), FlSpot(6, 80),
              ],
            ),
            gap,
            PortfolioROIWidget(
              roiValue: 14.8,
              percentageChange: "+2.1%",
            ),
            gap,
            PerformanceBarChart(roiData: [0.6, -1.1, 0.9, 1.9, -1.4, 1.6, 1.3, -1.2, 0.9, 1.2, -1.8, 0.8]),
            gap,
            ROIHeatmap(
              // heatmapData: [
              //
              //   [-0.08, -0.08, -0.09, -0.09, -0.07, -0.07, -0.07], // 00:00AM-03:00AM
              //   [0.19, 0.20, 0.18, 0.17, 0.18, 0.17, 0.16],       // 04:00AM-07:00AM
              //   [0.52, 0.58, 0.51, 0.50, 0.49, 0.47, 0.45],       // 08:00AM-11:00AM
              //   [1.00, 1.05, 0.97, 0.95, 0.87, 0.80, 0.85],       // 12:00PM-03:00PM
              //   [0.12, 0.14, 0.13, 0.12, 0.12, 0.12, 0.12],       // 04:00PM-07:00PM
              //   [-0.53, -0.59, -0.51, -0.50, -0.48, -0.47, -0.45],
              //
              //
              // ],
            ),
            gap,
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
            RiskOutcomeChart(
              values: [0.14, -0.20, 0.30, 0.05],
              labels: ["-0.3% Risk", "-0.8% Risk", "1.1% Risk", "0.5% Risk"],
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
            SessionAnalysisWidget(
              sessionRoi: [0.52, 1.69, 0.76],
              sessions: ['Asia', 'London', 'New York'],
            ),
            gap,
            SlippageSymbolWidget(
              avgSlippage: -0.35,
              p95Slippage: -0.12,
            ),
            gap,
            SpreadAnalysisWidget(
              symbol: "XAUUSD",
              avgSpread: 1.6,
              maxSpread: 3.4,
            ),

            gap,

            RollingProfitFactorWidget(
              pfData: {
                '1 Oct': 1.50,
                '2 Oct': 1.70,
                '3 Oct': 1.60,
                '4 Oct': 1.55,
                '5 Oct': 1.75,
                '7 Oct': 1.83,
              },
            ),
            gap,
            gap,
            CustomCircularProgress(percentage: 0.68),
            gap,
            gap,
            OverviewAreaChart(
              dataPoints: [10.0, 14.5, 12.0, 18.2, 22.8, 25.0, 26.5],
            ),
            gap,
            gap,
            gap,


            
          ],),
        ),
      ),
    );
  }
}
