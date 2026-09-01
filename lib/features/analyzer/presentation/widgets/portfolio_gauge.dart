import 'package:flutter/material.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';
import 'package:trading/utils/app_colors/app_colors.dart';
import 'dart:math' as math;

class PortfolioGauge extends StatelessWidget {
  const PortfolioGauge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: ResponsiveHelper.all(20),
      decoration: BoxDecoration(
        color: AppColors.cardDark,
        borderRadius: BorderRadius.circular(ResponsiveHelper.borderRadius(24)),
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Portfolio ROI",
              style: TextStyle(
                color: Colors.white60,
                fontSize: ResponsiveHelper.fontSize(12),
              ),
            ),
          ),
          SizedBox(height: ResponsiveHelper.height(10)),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: ResponsiveHelper.height(180),
                width: ResponsiveHelper.height(180), // square gauge
                child: CustomPaint(painter: GaugePainter()),
              ),
              Column(
                children: [
                  SizedBox(height: ResponsiveHelper.height(40)),
                  Text(
                    "14.8%",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: ResponsiveHelper.fontSize(28),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "▲ +2.1% from last month",
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: ResponsiveHelper.fontSize(10),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class GaugePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width * 0.9;

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = ResponsiveHelper.width(15) // strokeWidth responsive
      ..strokeCap = StrokeCap.round;

    final rect = Rect.fromCircle(center: center, radius: radius / 2);
    final gradient = SweepGradient(
      startAngle: math.pi,
      endAngle: 2 * math.pi,
      colors: [Colors.orange, Colors.yellow, AppColors.primary, Colors.blueGrey],
    );

    paint.shader = gradient.createShader(rect);
    canvas.drawArc(rect, math.pi, math.pi, false, paint);

    // Needle Drawing
    final needlePaint = Paint()
      ..color = Colors.white54
      ..strokeWidth = ResponsiveHelper.width(3)
      ..strokeCap = StrokeCap.round;

    canvas.drawLine(
      center,
      Offset(center.dx + ResponsiveHelper.width(40), center.dy - ResponsiveHelper.height(50)),
      needlePaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
