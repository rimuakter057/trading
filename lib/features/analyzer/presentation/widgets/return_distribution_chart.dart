import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';


class ReturnDistributionWidget extends StatelessWidget {
  final List<double> values;
  final List<String> buckets;

  const ReturnDistributionWidget({
    super.key,
    required this.values,
    required this.buckets,
  });

  @override
  Widget build(BuildContext context) {
    // ResponsiveHelper already main.dart e init thakle ekhane call lagbe na

    return Container(
      padding: ResponsiveHelper.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF2D2F33),
        borderRadius: BorderRadius.circular(ResponsiveHelper.borderRadius(24)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Return Distribution",
            style: TextStyle(
              color: Colors.white,
              fontSize: ResponsiveHelper.fontSize(18),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: ResponsiveHelper.height(30)),
          SizedBox(
            height: ResponsiveHelper.height(250),
            child: BarChart(
              BarChartData(
                maxY: 25,
                alignment: BarChartAlignment.spaceAround,
                barTouchData: BarTouchData(
                  enabled: true,
                  touchTooltipData: BarTouchTooltipData(
                    getTooltipColor: (group) => const Color(0xFF0D0D0D),
                    tooltipPadding: ResponsiveHelper.all(8),
                    tooltipMargin: ResponsiveHelper.height(8),
                    getTooltipItem: (group, groupIndex, rod, rodIndex) {
                      return BarTooltipItem(
                        'RBR          TRADES\n',
                        TextStyle(
                          color: Colors.grey,
                          fontSize: ResponsiveHelper.fontSize(10),
                        ),
                        children: [
                          TextSpan(
                            text: '0.0R          21\n\n',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: ResponsiveHelper.fontSize(14),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: 'TOP 2 SYMBOLS\n',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: ResponsiveHelper.fontSize(10),
                            ),
                          ),
                          TextSpan(
                            text: 'EURUSD\nNAS100',
                            style: TextStyle(
                              color: Colors.white,
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
                      getTitlesWidget: (value, meta) {
                        int index = value.toInt();
                        if (index >= 0 && index < buckets.length) {
                          return Padding(
                            padding: EdgeInsets.only(top: ResponsiveHelper.height(10)),
                            child: Text(
                              buckets[index],
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
                  rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                ),
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: Colors.white10,
                    strokeWidth: ResponsiveHelper.width(1),
                  ),
                ),
                borderData: FlBorderData(show: false),
                barGroups: List.generate(values.length, (i) {
                  return BarChartGroupData(
                    x: i,
                    barRods: [
                      BarChartRodData(
                        toY: values[i],
                        color: const Color(0xFF00A38D),
                        width: ResponsiveHelper.width(25),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(ResponsiveHelper.borderRadius(4)),
                          topRight: Radius.circular(ResponsiveHelper.borderRadius(4)),
                        ),
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
