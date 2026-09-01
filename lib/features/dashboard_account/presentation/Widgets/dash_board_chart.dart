import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';
import 'package:trading/utils/app_colors/app_colors.dart';


class DashboardChart extends StatelessWidget {
  const DashboardChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ResponsiveHelper.height(180),
      padding: EdgeInsets.only(top: ResponsiveHelper.height(20),right: ResponsiveHelper.width(10),),
      child: LineChart(
        LineChartData(
          gridData: FlGridData(
            show: true,
            drawVerticalLine: false,
            getDrawingHorizontalLine: (value) => FlLine(
              color: Colors.white10,
              strokeWidth: 1,
            ),
          ),
          titlesData: FlTitlesData(
            show: true,
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  const days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
                  if (value.toInt() < days.length) {
                    return Text(days[value.toInt()],
                        style: TextStyle(color: Colors.white54, fontSize: ResponsiveHelper.fontSize(10),));
                  }
                  return const Text('');
                },
              ),
            ),
          ),
          borderData: FlBorderData(show: false),
          lineBarsData: [
            // Blue/Main Performance Line
            LineChartBarData(
              spots: [
                FlSpot(0, 2), FlSpot(1, 1.5), FlSpot(2, 3),
                FlSpot(3, 2.5), FlSpot(4, 5), FlSpot(5, 3.5), FlSpot(6, 4),
              ],
              isCurved: true,
              color: AppColors.primary,
              barWidth: ResponsiveHelper.width(3),
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                color: AppColors.primary.withOpacity(0.1),
              ),
            ),
            // Light Indicator Line
            LineChartBarData(
              spots: [
                FlSpot(0, 1), FlSpot(2, 2.2), FlSpot(4, 3.1), FlSpot(6, 2.8),
              ],
              isCurved: true,
              color: Colors.white24,
              barWidth: ResponsiveHelper.width(2),
              dashArray: [5, 5],
              dotData: FlDotData(show: false),
            ),
          ],
        ),
      ),
    );
  }
}