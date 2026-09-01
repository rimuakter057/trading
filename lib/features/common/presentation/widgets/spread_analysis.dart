import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';


class SpreadAnalysisWidget extends StatelessWidget {
  final String symbol; // e.g., 'XAUUSD'
  final double avgSpread; // e.g., 1.6
  final double maxSpread; // e.g., 3.4

  const SpreadAnalysisWidget({
    super.key,
    required this.symbol,
    required this.avgSpread,
    required this.maxSpread,
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
            "Spread",
            style: TextStyle(
              color: const Color(0xFF4A4A4A),
              fontSize: ResponsiveHelper.fontSize(18),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: ResponsiveHelper.height(30)),
          SizedBox(
            height: ResponsiveHelper.height(250),
            child: BarChart(
              BarChartData(
                maxY: 6,
                barTouchData: BarTouchData(enabled: true),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    axisNameWidget: Text(
                      "Spread (pips)",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: ResponsiveHelper.fontSize(10),
                      ),
                    ),
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: ResponsiveHelper.width(30),
                      getTitlesWidget: (value, meta) => Text(
                        value.toInt().toString(),
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: ResponsiveHelper.fontSize(12),
                        ),
                      ),
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) => Padding(
                        padding: EdgeInsets.only(top: ResponsiveHelper.height(10)),
                        child: Text(
                          symbol,
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: ResponsiveHelper.fontSize(12),
                          ),
                        ),
                      ),
                    ),
                  ),
                  topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: Colors.grey.shade100,
                    strokeWidth: ResponsiveHelper.width(1),
                    dashArray: [5, 5],
                  ),
                ),
                borderData: FlBorderData(show: false),
                barGroups: [
                  BarChartGroupData(
                    x: 0,
                    barsSpace: 0,
                    barRods: [
                      BarChartRodData(
                        toY: avgSpread,
                        color: const Color(0xFF00796B),
                        width: ResponsiveHelper.width(80),
                        borderRadius: BorderRadius.zero,
                      ),
                      BarChartRodData(
                        toY: maxSpread,
                        color: const Color(0xFF2ECC71),
                        width: ResponsiveHelper.width(80),
                        borderRadius: BorderRadius.zero,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
