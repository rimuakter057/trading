import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';


class SlippageSymbolWidget extends StatelessWidget {
  final double avgSlippage; // e.g., -0.35
  final double p95Slippage; // e.g., -0.12

  const SlippageSymbolWidget({
    super.key,
    required this.avgSlippage,
    required this.p95Slippage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: ResponsiveHelper.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(ResponsiveHelper.borderRadius(24)),
        border: Border.all(color: Colors.grey.shade200, width: ResponsiveHelper.width(1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Slippage by Symbol",
            style: TextStyle(
              color: const Color(0xFF4A4A4A),
              fontSize: ResponsiveHelper.fontSize(18),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: ResponsiveHelper.height(10)),
          SizedBox(
            height: ResponsiveHelper.height(200),
            child: Stack(
              alignment: Alignment.center,
              children: [
                PieChart(
                  PieChartData(
                    startDegreeOffset: 270,
                    sectionsSpace: 0,
                    centerSpaceRadius: ResponsiveHelper.width(70),
                    sections: [
                      PieChartSectionData(
                        color: const Color(0xFF00897B),
                        value: 75,
                        radius: ResponsiveHelper.width(20),
                        showTitle: false,
                      ),
                      PieChartSectionData(
                        color: const Color(0xFF2ECC71),
                        value: 25,
                        radius: ResponsiveHelper.width(20),
                        showTitle: false,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: ResponsiveHelper.width(20),
                  child: _buildChartTooltip(avgSlippage),
                ),
              ],
            ),
          ),
          SizedBox(height: ResponsiveHelper.height(30)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildInfoTile("Avg Slippage (pips)", avgSlippage, const Color(0xFF00897B)),
              _buildInfoTile("P95 Slippage (pips)", p95Slippage, const Color(0xFF2ECC71)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildChartTooltip(double value) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveHelper.width(12),
        vertical: ResponsiveHelper.height(8),
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(ResponsiveHelper.borderRadius(10)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "AVG SLIPPAGE (PIPS)",
            style: TextStyle(
              color: Colors.grey,
              fontSize: ResponsiveHelper.fontSize(8),
            ),
          ),
          Text(
            "$value",
            style: TextStyle(
              color: Colors.white,
              fontSize: ResponsiveHelper.fontSize(18),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoTile(String title, double value, Color indicatorColor) {
    return Row(
      children: [
        Container(
          width: ResponsiveHelper.width(3),
          height: ResponsiveHelper.height(40),
          color: indicatorColor,
        ),
        SizedBox(width: ResponsiveHelper.width(10)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.grey,
                fontSize: ResponsiveHelper.fontSize(12),
              ),
            ),
            Text(
              "$value",
              style: TextStyle(
                color: const Color(0xFF2D2D2D),
                fontSize: ResponsiveHelper.fontSize(20),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
