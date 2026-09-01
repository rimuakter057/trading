import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';

class OverviewAreaChart extends StatelessWidget {
  final List<double> dataPoints; // e.g., [10, 15, 12, 20, 25, 28]

  const OverviewAreaChart({super.key, required this.dataPoints});

  @override
  Widget build(BuildContext context) {
    // ResponsiveHelper already main.dart e init thakle ekhane call lagbe na

    return Container(
      height: ResponsiveHelper.height(120), // responsive height
      padding: ResponsiveHelper.symmetric(
        vertical: 10,
        horizontal: 8, // optional horizontal padding
      ),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F9FA), // Very light grey background
        borderRadius: BorderRadius.circular(ResponsiveHelper.borderRadius(16)),
      ),
      child: LineChart(
        LineChartData(
          gridData: const FlGridData(show: false),
          titlesData: const FlTitlesData(show: false),
          borderData: FlBorderData(show: false),
          minX: 0,
          maxX: (dataPoints.length - 1).toDouble(),
          lineBarsData: [
            LineChartBarData(
              spots: dataPoints.asMap().entries.map((e) {
                return FlSpot(
                  e.key.toDouble(),
                  e.value,
                );
              }).toList(),
              isCurved: true, // Smooth curve
              curveSmoothness: 0.35,
              color: const Color(0xFFF39C12), // Orange line color
              barWidth: ResponsiveHelper.width(2), // responsive width
              isStrokeCapRound: true,
              dotData: const FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xFFF39C12).withOpacity(0.2),
                    const Color(0xFFF39C12).withOpacity(0.01),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
