import 'package:flutter/material.dart';
import 'package:trading/features/analyzer/presentation/widgets/analyzer_bar_chart.dart';
import 'package:trading/features/analyzer/presentation/widgets/metric_title.dart';
import 'package:trading/utils/app_colors/app_colors.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';

class AnalyzerDetailsScreen extends StatelessWidget {
  const AnalyzerDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: Text(
          "Performance ROI",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: ResponsiveHelper.fontSize(16),
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(ResponsiveHelper.width(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AnalyzerBarChart(),
            SizedBox(height: ResponsiveHelper.height(25)),

            Text(
              "Key Metrics",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: ResponsiveHelper.fontSize(16),
              ),
            ),
            SizedBox(height: ResponsiveHelper.height(15)),

            const MetricTile(
              label: "Profit Factor",
              value: "1.78",
              status: "GOOD",
              statusColor: Colors.teal,
            ),
            const MetricTile(
              label: "Sharpe Ratio",
              value: "1.24",
              status: "HEALTHY",
              statusColor: Colors.blue,
            ),
            const MetricTile(
              label: "Daily Drawdown",
              value: "-1.5%",
              status: "WARNING",
              statusColor: Colors.orange,
            ),
            const MetricTile(
              label: "Win Rate",
              value: "62%",
              status: "AVERAGE",
              statusColor: Colors.grey,
            ),

            SizedBox(height: ResponsiveHelper.height(20)),
            _buildExpectancyCard(),
          ],
        ),
      ),
    );
  }

  Widget _buildExpectancyCard() {
    return Container(
      padding: EdgeInsets.all(ResponsiveHelper.width(16)),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(ResponsiveHelper.width(16)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Expectancy",
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: ResponsiveHelper.fontSize(12),
                ),
              ),
              Text(
                "+0.20R (\$22 / 0.19%)",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: ResponsiveHelper.fontSize(14),
                ),
              ),
            ],
          ),
          Icon(Icons.info_outline, color: Colors.white70),
        ],
      ),
    );
  }
}
