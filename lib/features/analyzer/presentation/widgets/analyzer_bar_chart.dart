import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';
import 'package:trading/utils/app_colors/app_colors.dart';

class AnalyzerBarChart extends StatelessWidget {
  const AnalyzerBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ResponsiveHelper.height(220),
      padding: ResponsiveHelper.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardDark,
        borderRadius:
        BorderRadius.circular(ResponsiveHelper.width(20)),
      ),
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: 20,
          minY: -20,
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            getDrawingHorizontalLine: (value) =>
            const FlLine(color: Colors.white10, strokeWidth: 1),
          ),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: ResponsiveHelper.width(30),
                getTitlesWidget: (val, meta) => Text(
                  "${val.toInt()}%",
                  style: TextStyle(
                    color: Colors.white38,
                    fontSize: ResponsiveHelper.fontSize(8),
                  ),
                ),
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (val, meta) {
                  const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul'];
                  return Text(
                    months[val.toInt() % 7],
                    style: TextStyle(
                      color: Colors.white38,
                      fontSize: ResponsiveHelper.fontSize(10),
                    ),
                  );
                },
              ),
            ),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          ),
          borderData: FlBorderData(show: false),
          barGroups: [
            _makeGroup(0, 10, isPositive: true),
            _makeGroup(1, -8, isPositive: false),
            _makeGroup(2, 15, isPositive: true),
            _makeGroup(3, -12, isPositive: false),
            _makeGroup(4, 8, isPositive: true),
            _makeGroup(5, -5, isPositive: false),
            _makeGroup(6, 12, isPositive: true),
          ],
        ),
      ),
    );
  }

  BarChartGroupData _makeGroup(int x, double y, {required bool isPositive}) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: isPositive ? AppColors.primary : Colors.redAccent,
          width: ResponsiveHelper.width(12),
          borderRadius:
          BorderRadius.circular(ResponsiveHelper.width(4)),
          backDrawRodData:  BackgroundBarChartRodData(
            show: true,
            toY: 20,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
