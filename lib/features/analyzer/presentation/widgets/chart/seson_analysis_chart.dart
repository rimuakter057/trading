import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';


class SessionAnalysisWidget extends StatelessWidget {
  final List<double> sessionRoi; // e.g., [0.52, 1.69, 0.76]
  final List<String> sessions;   // e.g., ['Asia', 'London', 'New York']

  const SessionAnalysisWidget({
    super.key,
    required this.sessionRoi,
    required this.sessions,
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
            "Session Analysis",
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
                maxY: 1.75,
                alignment: BarChartAlignment.spaceAround,
                barTouchData: BarTouchData(
                  touchTooltipData: BarTouchTooltipData(
                    getTooltipColor: (group) => const Color(0xFF1E1E1E),
                    getTooltipItem: (group, groupIndex, rod, rodIndex) {
                      return BarTooltipItem(
                        '10/01/2026\n\n',
                        TextStyle(
                          color: Colors.grey,
                          fontSize: ResponsiveHelper.fontSize(10),
                        ),
                        children: [
                          TextSpan(
                            text: 'TRADES     ROI\n',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: ResponsiveHelper.fontSize(8),
                            ),
                          ),
                          TextSpan(
                            text: '88         ${rod.toY}%',
                            style: TextStyle(
                              color: const Color(0xFF00A38D),
                              fontSize: ResponsiveHelper.fontSize(14),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    axisNameWidget: Text(
                      "ROI % (0 → 1.75%)",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: ResponsiveHelper.fontSize(10),
                      ),
                    ),
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: ResponsiveHelper.width(45),
                      getTitlesWidget: (value, meta) => Text(
                        "${value.toStringAsFixed(2)}%",
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
                        int index = value.toInt();
                        if (index >= 0 && index < sessions.length) {
                          return Padding(
                            padding: EdgeInsets.only(top: ResponsiveHelper.height(10)),
                            child: Text(
                              sessions[index],
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: ResponsiveHelper.fontSize(12),
                              ),
                            ),
                          );
                        }
                        return const SizedBox();
                      },
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
                barGroups: List.generate(sessionRoi.length, (i) {
                  return BarChartGroupData(
                    x: i,
                    barRods: [
                      BarChartRodData(
                        toY: sessionRoi[i],
                        color: const Color(0xFF00A38D),
                        width: ResponsiveHelper.width(60),
                        borderRadius: BorderRadius.circular(ResponsiveHelper.borderRadius(4)),
                      ),
                    ],
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
