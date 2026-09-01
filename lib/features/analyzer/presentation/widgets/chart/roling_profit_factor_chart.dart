import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import 'package:trading/helper/responsive_helper/responsive_helper.dart';


class RollingProfitFactorWidget extends StatelessWidget {
  final Map<String, double> pfData; // Example: {'1 Oct': 1.5, '2 Oct': 1.7, ...}

  const RollingProfitFactorWidget({super.key, required this.pfData});

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
            "Rolling Profit Factor",
            style: TextStyle(
              color: const Color(0xFF4A4A4A),
              fontSize: ResponsiveHelper.fontSize(18),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: ResponsiveHelper.height(30)),
          SizedBox(
            height: ResponsiveHelper.height(250),
            child: LineChart(
              LineChartData(
                minY: 1.40,
                maxY: 2.00,
                lineTouchData: LineTouchData(
                  touchTooltipData: LineTouchTooltipData(
                    getTooltipColor: (touchedSpot) => const Color(0xFF1E1E1E),
                    getTooltipItems: (List<LineBarSpot> touchedSpots) {
                      return touchedSpots.map((spot) {
                        return LineTooltipItem(
                          '30/01/2026\n\n',
                          TextStyle(color: Colors.grey, fontSize: ResponsiveHelper.fontSize(10)),
                          children: [
                            TextSpan(
                              text: 'TRADES     PF\n',
                              style: TextStyle(color: Colors.grey, fontSize: ResponsiveHelper.fontSize(8)),
                            ),
                            TextSpan(
                              text: '35         ${spot.y}',
                              style: TextStyle(
                                color: const Color(0xFF00A38D),
                                fontSize: ResponsiveHelper.fontSize(14),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        );
                      }).toList();
                    },
                  ),
                ),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    axisNameWidget: Text(
                      "Profit Factor",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: ResponsiveHelper.fontSize(10),
                      ),
                    ),
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: ResponsiveHelper.width(40),
                      getTitlesWidget: (value, meta) => Text(
                        value.toStringAsFixed(2),
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
                        if (index >= 0 && index < pfData.keys.length) {
                          return Padding(
                            padding: EdgeInsets.only(top: ResponsiveHelper.height(10)),
                            child: Text(
                              pfData.keys.elementAt(index),
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: ResponsiveHelper.fontSize(10),
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
                lineBarsData: [
                  LineChartBarData(
                    spots: pfData.values.toList().asMap().entries.map((e) {
                      return FlSpot(e.key.toDouble(), e.value);
                    }).toList(),
                    isCurved: false,
                    color: const Color(0xFF00897B),
                    barWidth: ResponsiveHelper.width(2),
                    isStrokeCapRound: true,
                    dotData: FlDotData(
                      show: true,
                      getDotPainter: (spot, percent, barData, index) => FlDotCirclePainter(
                        radius: ResponsiveHelper.width(3),
                        color: const Color(0xFF00897B),
                        strokeWidth: ResponsiveHelper.width(1),
                        strokeColor: Colors.white,
                      ),
                    ),
                    belowBarData: BarAreaData(show: false),
                  ),
                ],
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
