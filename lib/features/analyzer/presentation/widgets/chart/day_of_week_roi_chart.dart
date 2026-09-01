import 'package:flutter/material.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';


class DayOfWeekROI extends StatelessWidget {
  final Map<String, double> data; // Example: {'Mon': 0.8, 'Fri': -0.7'}

  const DayOfWeekROI({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(ResponsiveHelper.padding(20)),
      decoration: BoxDecoration(
        color: const Color(0xFF11141D),
        borderRadius: BorderRadius.circular(ResponsiveHelper.borderRadius(24)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Day of Week ROI",
            style: TextStyle(
              color: Colors.white,
              fontSize: ResponsiveHelper.fontSize(16),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: ResponsiveHelper.height(20)),
          ...data.entries.map((e) => _buildRow(e.key, e.value)).toList(),
          SizedBox(height: ResponsiveHelper.height(10)),
          _buildBottomScale(),
        ],
      ),
    );
  }

  Widget _buildRow(String day, double value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: ResponsiveHelper.height(8)),
      child: Row(
        children: [
          SizedBox(
            width: ResponsiveHelper.width(40),
            child: Text(
              day,
              style: TextStyle(
                color: Colors.grey,
                fontSize: ResponsiveHelper.fontSize(12),
              ),
            ),
          ),
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Divider(color: Colors.white10, thickness: ResponsiveHelper.height(1)),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: ResponsiveHelper.width(1),
                    height: ResponsiveHelper.height(20),
                    color: Colors.white30,
                  ),
                ),
                Align(
                  alignment: Alignment(value, 0),
                  child: Container(
                    height: ResponsiveHelper.height(2),
                    width: ResponsiveHelper.width((value.abs() * 100)),
                    color: value >= 0 ? const Color(0xFF26A69A) : Colors.redAccent,
                  ),
                ),
                Align(
                  alignment: Alignment(value, 0),
                  child: Container(
                    height: ResponsiveHelper.height(10),
                    width: ResponsiveHelper.width(10),
                    decoration: BoxDecoration(
                      color: value >= 0 ? const Color(0xFF26A69A) : Colors.redAccent,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomScale() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(width: ResponsiveHelper.width(40)),
        Text("-1.0", style: TextStyle(color: Colors.grey, fontSize: ResponsiveHelper.fontSize(10))),
        Text("0.0", style: TextStyle(color: Colors.grey, fontSize: ResponsiveHelper.fontSize(10))),
        Text("1.0", style: TextStyle(color: Colors.grey, fontSize: ResponsiveHelper.fontSize(10))),
      ],
    );
  }
}
