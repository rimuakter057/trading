import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';


class RiskOutcomeChart extends StatelessWidget {
  final List<double> values; // [0.14, -0.20, 0.30, 0.05]
  final List<String> labels; // ["-0.3% Risk", "-0.8% Risk", "1.1% Risk", "0.5% Risk"]

  const RiskOutcomeChart({
    super.key,
    required this.values,
    required this.labels
  });

  @override
  Widget build(BuildContext context) {
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
            "Risk per Trade vs Outcome",
            style: TextStyle(
              color: Colors.white,
              fontSize: ResponsiveHelper.fontSize(16),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: ResponsiveHelper.height(30)),
          SizedBox(
            height: ResponsiveHelper.height(250),
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: 0.3,
                minY: -0.3,
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
                        value.toStringAsFixed(1),
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
                        if (value.toInt() < labels.length) {
                          return Padding(
                            padding: EdgeInsets.only(top: ResponsiveHelper.height(10)),
                            child: Text(
                              labels[value.toInt()],
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: ResponsiveHelper.fontSize(10),
                              ),
                            ),
                          );
                        }
                        return const Text('');
                      },
                    ),
                  ),
                  rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                borderData: FlBorderData(show: false),
                barGroups: List.generate(values.length, (i) => _makeGroupData(i, values[i])),
              ),
            ),
          ),
          Center(
            child: Text(
              "Risk buckets",
              style: TextStyle(
                color: Colors.grey,
                fontSize: ResponsiveHelper.fontSize(12),
              ),
            ),
          )
        ],
      ),
    );
  }

  BarChartGroupData _makeGroupData(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: y >= 0 ? const Color(0xFF2ECC71) : const Color(0xFFF25C54),
          width: ResponsiveHelper.width(45),
          borderRadius: BorderRadius.circular(ResponsiveHelper.borderRadius(4)),
        ),
      ],
    );
  }
}
