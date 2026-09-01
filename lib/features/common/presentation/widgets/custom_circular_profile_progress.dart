import 'package:flutter/material.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';

class CustomCircularProgress extends StatelessWidget {
  final double percentage; // Value between 0.0 and 1.0 (e.g., 0.68)
  final Color activeColor;
  final Color backgroundColor;

  const CustomCircularProgress({
    super.key,
    required this.percentage,
    this.activeColor = const Color(0xFFFFB74D), // Image-er orange color
    this.backgroundColor = const Color(0xFFF0F2F5), // Light grey track
  });

  @override
  Widget build(BuildContext context) {
    final double size = ResponsiveHelper.width(150); // Responsive size
    final double stroke = ResponsiveHelper.width(12); // Responsive stroke
    final double fontSize = ResponsiveHelper.fontSize(42); // Responsive text

    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background track
          SizedBox(
            width: size,
            height: size,
            child: CircularProgressIndicator(
              value: 1.0,
              strokeWidth: stroke,
              color: backgroundColor,
            ),
          ),
          // Active progress
          SizedBox(
            width: size,
            height: size,
            child: CircularProgressIndicator(
              value: percentage,
              strokeWidth: stroke,
              strokeCap: StrokeCap.round, // Rounded edges
              color: activeColor,
            ),
          ),
          // Percentage Text
          Text(
            "${(percentage * 100).toInt()}%",
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF2D3E50), // Dark blue-grey text
            ),
          ),
        ],
      ),
    );
  }
}
