import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';

class CustomGraphCard extends StatelessWidget {
  final String totalBalance;
  final String percentage;
  final String openBalance;
  final List<FlSpot> mainData;
  final List<FlSpot> secondaryData;

  const CustomGraphCard({
    super.key,
    required this.totalBalance,
    required this.percentage,
    required this.openBalance,
    required this.mainData,
    required this.secondaryData,
  });

  @override
  Widget build(BuildContext context) {
    final double padding = ResponsiveHelper.width(20);
    final double borderRadius = ResponsiveHelper.width(24);
    final double headerFont = ResponsiveHelper.fontSize(24);
    final double percentageFont = ResponsiveHelper.fontSize(14);
    final double openBalanceFont = ResponsiveHelper.fontSize(14);
    final double tabHeight = ResponsiveHelper.height(40);
    final double tabRadius = ResponsiveHelper.width(12);
    final double chartHeight = ResponsiveHelper.height(200);
    final double lineBarWidth = ResponsiveHelper.width(2);
    final double tabTextFont = ResponsiveHelper.fontSize(14);

    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: const Color(0xFF0D1117), // Dark Background
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Info
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    totalBalance,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: headerFont,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    percentage,
                    style: TextStyle(
                        color: const Color(0xFF2ECC71), fontSize: percentageFont),
                  ),
                ],
              ),
              Text(
                "\$$openBalance open",
                style: TextStyle(color: Colors.grey, fontSize: openBalanceFont),
              ),
            ],
          ),
          SizedBox(height: ResponsiveHelper.height(20)),

          // Custom Tab Selector (Simplified)
          Container(
            height: tabHeight,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              borderRadius: BorderRadius.circular(tabRadius),
            ),
            child: Row(
              children: [
                _buildTab("Week", isActive: true, fontSize: tabTextFont),
                _buildTab("Month", fontSize: tabTextFont),
                _buildTab("Year", fontSize: tabTextFont),
              ],
            ),
          ),
          SizedBox(height: ResponsiveHelper.height(30)),

          // Line Chart
          SizedBox(
            height: chartHeight,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  getDrawingHorizontalLine: (value) => FlLine(
                    color: Colors.white10,
                    strokeWidth: 1,
                    dashArray: [5, 5],
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
                        return Text(days[value.toInt() % 7],
                            style: TextStyle(color: Colors.grey, fontSize: ResponsiveHelper.fontSize(12)));
                      },
                    ),
                  ),
                ),
                borderData: FlBorderData(show: false),
                lineBarsData: [
                  _lineData(mainData, const Color(0xFF26A69A), true, lineBarWidth), // Teal Line
                  _lineData(secondaryData, Colors.white24, false, lineBarWidth),   // Grey Line
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String label, {bool isActive = false, required double fontSize}) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF26A69A) : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          label,
          style: TextStyle(color: isActive ? Colors.white : Colors.grey, fontSize: fontSize),
        ),
      ),
    );
  }

  LineChartBarData _lineData(List<FlSpot> spots, Color color, bool isMain, double barWidth) {
    return LineChartBarData(
      spots: spots,
      isCurved: true,
      color: color,
      barWidth: barWidth,
      isStrokeCapRound: true,
      dotData: const FlDotData(show: false),
      belowBarData: isMain
          ? BarAreaData(show: true, color: color.withOpacity(0.1))
          : BarAreaData(show: false),
    );
  }
}
