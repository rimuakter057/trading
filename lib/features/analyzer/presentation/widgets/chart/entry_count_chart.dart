import 'package:flutter/material.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';


class EntryExitCountsWidget extends StatelessWidget {
  final List<TradeEntryData> data;

  const EntryExitCountsWidget({super.key, required this.data});

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
            "Entry/Exit Types (Counts)",
            style: TextStyle(
              color: Colors.white,
              fontSize: ResponsiveHelper.fontSize(16),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: ResponsiveHelper.height(30)),
          ...data.map((item) => _buildHorizontalBar(item)).toList(),
          SizedBox(height: ResponsiveHelper.height(20)),
          _buildBottomScale(),
        ],
      ),
    );
  }

  Widget _buildHorizontalBar(TradeEntryData item) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: ResponsiveHelper.height(12)),
      child: Row(
        children: [
          SizedBox(
            width: ResponsiveHelper.width(60),
            child: Text(
              item.label,
              style: TextStyle(
                color: Colors.grey,
                fontSize: ResponsiveHelper.fontSize(12),
              ),
            ),
          ),
          Expanded(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                // Dashed Background Line
                Row(
                  children: List.generate(
                    20,
                        (index) => Expanded(
                      child: Container(
                        height: ResponsiveHelper.height(1),
                        color: index % 2 == 0 ? Colors.white10 : Colors.transparent,
                      ),
                    ),
                  ),
                ),
                // The Actual Bar
                FractionallySizedBox(
                  widthFactor: (item.count / 50).clamp(0, 1), // max count 50
                  child: Container(
                    height: ResponsiveHelper.height(12),
                    decoration: BoxDecoration(
                      color: item.isPositive ? const Color(0xFF2ECC71) : const Color(0xFFF25C54),
                      borderRadius: BorderRadius.circular(ResponsiveHelper.borderRadius(2)),
                    ),
                  ),
                ),
                // Tooltip
                if (item.showTooltip)
                  Positioned(
                    right: 0,
                    top: -ResponsiveHelper.height(45),
                    child: _buildBarTooltip(item.count),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBarTooltip(int count) {
    return Container(
      padding: ResponsiveHelper.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFF0D1117),
        borderRadius: BorderRadius.circular(ResponsiveHelper.borderRadius(8)),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        children: [
          Text(
            "Entry",
            style: TextStyle(color: Colors.grey, fontSize: ResponsiveHelper.fontSize(10)),
          ),
          Text(
            "COUNTS",
            style: TextStyle(color: Colors.white54, fontSize: ResponsiveHelper.fontSize(8)),
          ),
          Text(
            "$count",
            style: TextStyle(
              color: Colors.white,
              fontSize: ResponsiveHelper.fontSize(14),
              fontWeight: FontWeight.bold,
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
        SizedBox(width: ResponsiveHelper.width(60)),
        Text("0 Count", style: TextStyle(color: Colors.grey, fontSize: ResponsiveHelper.fontSize(10))),
        Text("10 Counts", style: TextStyle(color: Colors.grey, fontSize: ResponsiveHelper.fontSize(10))),
        Text("20 Counts", style: TextStyle(color: Colors.grey, fontSize: ResponsiveHelper.fontSize(10))),
        Text("30 Counts", style: TextStyle(color: Colors.grey, fontSize: ResponsiveHelper.fontSize(10))),
        Text("40 Counts", style: TextStyle(color: Colors.grey, fontSize: ResponsiveHelper.fontSize(10))),
      ],
    );
  }
}

class TradeEntryData {
  final String label;
  final int count;
  final bool isPositive;
  final bool showTooltip;

  TradeEntryData({
    required this.label,
    required this.count,
    this.isPositive = false,
    this.showTooltip = false,
  });
}
