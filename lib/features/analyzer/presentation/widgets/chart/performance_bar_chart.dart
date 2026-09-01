import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';


class PerformanceBarChart extends StatelessWidget {
  final List<double> roiData; // Example: [0.5, -1.0, 0.9, 1.8, -1.3, ...]

  const PerformanceBarChart({super.key, required this.roiData});

  @override
  Widget build(BuildContext context) {
    // ResponsiveHelper already main.dart e init thakle ekhane call lagbe na

    return Container(
      padding: ResponsiveHelper.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF11141D),
        borderRadius: BorderRadius.circular(ResponsiveHelper.borderRadius(24)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Performance ROI",
            style: TextStyle(
              color: Colors.white,
              fontSize: ResponsiveHelper.fontSize(18),
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: ResponsiveHelper.height(30)),
          AspectRatio(
            aspectRatio: 1.5,
            child: BarChart(
              BarChartData(
                maxY: 3,
                minY: -3,
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: Colors.white10,
                    strokeWidth: ResponsiveHelper.width(1),
                    dashArray: [5, 5],
                  ),
                ),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: ResponsiveHelper.width(30),
                      getTitlesWidget: (value, meta) => Text(
                        "${value.toInt()}%",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: ResponsiveHelper.fontSize(10),
                        ),
                      ),
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        const months = [
                          'Sep', 'Oct', 'Nov', 'Dec', 'Jan', 'Feb',
                          'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug'
                        ];
                        return Padding(
                          padding: EdgeInsets.only(top: ResponsiveHelper.height(8)),
                          child: Text(
                            months[value.toInt() % 12],
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: ResponsiveHelper.fontSize(10),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                borderData: FlBorderData(show: false),
                barGroups: _generateBarGroups(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<BarChartGroupData> _generateBarGroups() {
    return List.generate(roiData.length, (index) {
      double val = roiData[index];

      Color barColor = val >= 0 ? const Color(0xFF2ECC71) : const Color(0xFFE74C3C);
      if (index == 3) barColor = Colors.blue;   // December highlight
      if (index == 10) barColor = Colors.orange; // July highlight

      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: val,
            color: barColor,
            width: ResponsiveHelper.width(12), // responsive bar width
            borderRadius: BorderRadius.circular(ResponsiveHelper.borderRadius(2)),
          ),
        ],
      );
    });
  }
}
