import 'package:flutter/material.dart';
import 'package:trading/features/analyzer/presentation/widgets/tab_widgets/all_insights_tab_widget.dart';
import 'package:trading/features/analyzer/presentation/widgets/tab_widgets/broker_execution_tab_widget.dart';
import 'package:trading/features/analyzer/presentation/widgets/tab_widgets/heatmap_tab_widget.dart';
import 'package:trading/features/analyzer/presentation/widgets/tab_widgets/instrument_roi_tab_widget.dart';
import 'package:trading/features/analyzer/presentation/widgets/tab_widgets/overview_tab_widget.dart';
import 'package:trading/features/analyzer/presentation/widgets/tab_widgets/performance_roi_tab_widget.dart';
import 'package:trading/features/analyzer/presentation/widgets/tab_widgets/portfolio_roi_tab_widget.dart';
import 'package:trading/features/analyzer/presentation/widgets/tab_widgets/risk_consistency_tab_widget.dart';
import 'package:trading/features/analyzer/presentation/widgets/tab_widgets/risk_tab_widget.dart';
import 'package:trading/features/analyzer/presentation/widgets/tab_widgets/roi_breakdown_tab_widget.dart';
import 'package:trading/features/analyzer/presentation/widgets/tab_widgets/staging_tab_widget.dart';
import 'package:trading/features/analyzer/presentation/widgets/tab_widgets/trades_explorer_tab_widget.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';
import 'package:trading/share/widgets/custom_container/custom_container.dart';
import 'package:trading/utils/app_colors/app_colors.dart';
import 'package:trading/utils/app_text/app_strings.dart';
import 'package:trading/utils/extension/base_extension.dart';

class AnalyzerScreen extends StatefulWidget {
  const AnalyzerScreen({super.key});

  @override
  State<AnalyzerScreen> createState() => _AnalyzerScreenState();
}

class _AnalyzerScreenState extends State<AnalyzerScreen> {
  int selectedParentTabIndex = 0;
  int selectedSubTabIndex = 0;

  // Parent tab labels
  final List<String> parentTabLabels = [
    AppText.performance,
    AppText.analysisHub,
  ];

  // Sub tab labels
  final List<List<String>> subTabLabels = [
    [
      AppText.performanceROI,
      "performanceCost",
      "performanceProfit",
      "performanceProfit",
      "Risk",
    ],
    ["accountROI", "accountCost", "accountProfit", "accountProfit"],
  ];


  final List<List<Widget>> tabContents = [
    ///performance tab=========================================
    [
      PortfolioRoiTabWidget(),
      PerformanceRoiTabWidget(),
      InstrumentRoiTabWidget(),
      HeatMapTabWidget(),
      RiskTabWidget(),
    ],

    ///analyzer tab=============================
    [
      OverviewTabWidget(),
      RoiBreakdownTabWidget(),
      RiskConsistencyTabWidget(),
      StagingTabWidget(),
      PerformanceRoiTabWidget(),
      BrokerExecutionTabWidget(),
      TradesExplorerTabWidget(),
      AllInsightsTabWidget(),

    ],
  ];



  @override
  Widget build(BuildContext context) {
    final Widget gap = SizedBox(height: ResponsiveHelper.height(24));

    return Scaffold(
      body: Column(
        children: [
          /// Header + Parent Tabs
          Container(
            height: ResponsiveHelper.height(180),
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(50),
                bottomLeft: Radius.circular(50),
              ),
              border: Border(
                bottom: BorderSide(width: 2, color: AppColors.boarderColor),
              ),
              color: AppColors.white,
            ),
            child: Column(
              children: [
                SizedBox(height: 36),
                Text(
                  "Analyzer",
                  style: context.bodyLarge.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: ResponsiveHelper.symmetric(
                    horizontal: 24,
                    vertical: 24,
                  ),

                  /// Parent Tabs
                  child: CustomContainer(
                    backgroundColor: AppColors.grey,
                    borderColor: AppColors.tabBoarderColor,
                    horizontal: ResponsiveHelper.width(4),
                    vertical: ResponsiveHelper.height(4),
                    radius: ResponsiveHelper.width(10),
                    child: Row(
                      children: List.generate(2, (index) {
                        bool isSelected = selectedParentTabIndex == index;
                        return Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedParentTabIndex = index;
                                selectedSubTabIndex = 0; // reset sub tab
                              });
                            },
                            child: CustomContainer(
                              horizontal: ResponsiveHelper.width(4),
                              vertical: ResponsiveHelper.height(4),
                              backgroundColor: isSelected
                                  ? AppColors.primary
                                  : AppColors.grey,
                              child: Text(
                                parentTabLabels[index],
                                textAlign: TextAlign.center,
                                style: context.bodySmall.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: isSelected
                                      ? AppColors.white
                                      : AppColors.black,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ],
            ),
          ),

          gap,

          /// Sub Tabs
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(selectedParentTabIndex==0?05:08, (index) {
                  bool isSelected = selectedSubTabIndex == index;
                  return Padding(
                    padding: EdgeInsets.only(left: ResponsiveHelper.width(8)),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedSubTabIndex = index;
                        });
                      },
                      child: CustomContainer(
                        horizontal: ResponsiveHelper.width(8),
                        vertical: ResponsiveHelper.height(6),
                        radius: ResponsiveHelper.borderRadius(50),
                        borderColor: isSelected
                            ? AppColors.primaryShade100
                            : AppColors.boarderColor,
                        backgroundColor: isSelected
                            ? AppColors.primaryShade100
                            : AppColors.white,
                        child: Text(
                          AppText.portfolioROI,
                          style: context.titleSmall.copyWith(
                            color: isSelected
                                ? AppColors.primary
                                : AppColors.subTitle,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),

          gap,

          /// Expanded Scrollable Column for Selected Tabs
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: SingleChildScrollView(
                child: tabContents[selectedParentTabIndex][selectedSubTabIndex],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
