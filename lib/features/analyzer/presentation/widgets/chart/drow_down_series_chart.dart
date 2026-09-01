import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';


class DrawdownSeriesWidget extends StatelessWidget {
  final Map<String, double> drawdownData; // Example: {'1 Oct': -0.6, '2 Oct': -1.0}

  const DrawdownSeriesWidget({super.key, required this.drawdownData});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(ResponsiveHelper.padding(20)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(ResponsiveHelper.borderRadius(24)),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Drawdown Series",
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
                minY: -1.0,
                maxY: 0.1,
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: Colors.grey.shade200,
                    strokeWidth: ResponsiveHelper.width(1),
                  ),
                ),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: ResponsiveHelper.width(35),
                      getTitlesWidget: (value, meta) => Text(
                        value.toStringAsFixed(1),
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
                      getTitlesWidget: (value, meta) {
                        int index = value.toInt();
                        if (index >= 0 && index < drawdownData.keys.length) {
                          return Padding(
                            padding: EdgeInsets.only(top: ResponsiveHelper.height(10)),
                            child: Text(
                              drawdownData.keys.elementAt(index),
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: ResponsiveHelper.fontSize(11),
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
                borderData: FlBorderData(show: false),
                barGroups: List.generate(
                  drawdownData.length,
                      (index) => BarChartGroupData(
                    x: index,
                    barRods: [
                      BarChartRodData(
                        toY: drawdownData.values.elementAt(index),
                        color: const Color(0xFFFF4D4D),
                        width: ResponsiveHelper.width(25),
                        borderRadius: BorderRadius.zero,
                        backDrawRodData: BackgroundBarChartRodData(
                          show: true,
                          toY: 0,
                          color: Colors.transparent,
                        ),
                      ),
                    ],
                  ),
                ),
                extraLinesData: ExtraLinesData(
                  horizontalLines: [
                    HorizontalLine(
                      y: 0,
                      color: Colors.red,
                      strokeWidth: ResponsiveHelper.width(1),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.only(top: ResponsiveHelper.height(10)),
              child: Text(
                "Dates",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: ResponsiveHelper.fontSize(12),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
