import 'package:flutter/material.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';


class PortfolioROIWidget extends StatelessWidget {
  final double roiValue; // Example: 14.8
  final String percentageChange; // Example: "+2.1%"

  const PortfolioROIWidget({
    super.key,
    required this.roiValue,
    required this.percentageChange,
  });

  @override
  Widget build(BuildContext context) {
    // ResponsiveHelper already main.dart e init thakle ekhane call lagbe na

    return Container(
      padding: ResponsiveHelper.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1C1E), // Card background
        borderRadius: BorderRadius.circular(ResponsiveHelper.borderRadius(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Portfolio ROI",
              style: TextStyle(
                color: Colors.white,
                fontSize: ResponsiveHelper.fontSize(18),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: ResponsiveHelper.height(10)),

          // The Gauge Chart
          SizedBox(
            height: ResponsiveHelper.height(180),
            child: SfRadialGauge(
              axes: <RadialAxis>[
                RadialAxis(
                  minimum: -100,
                  maximum: 100,
                  startAngle: 180,
                  endAngle: 0,
                  showLabels: false,
                  showTicks: true,
                  axisLineStyle: AxisLineStyle(
                    thickness: 0.2,
                    thicknessUnit: GaugeSizeUnit.factor,
                    gradient: const SweepGradient(
                      colors: <Color>[
                        Colors.redAccent,
                        Colors.orange,
                        Colors.yellow,
                        Colors.greenAccent,
                        Colors.tealAccent
                      ],
                      stops: <double>[0.0, 0.25, 0.5, 0.75, 1.0],
                    ),
                  ),
                  pointers: <GaugePointer>[
                    NeedlePointer(
                      value: roiValue,
                      needleColor: Colors.grey[700]!,
                      knobStyle: KnobStyle(
                        color: Colors.grey[800]!,
                        knobRadius: ResponsiveHelper.width(8), // responsive knob radius
                      ),
                      needleLength: ResponsiveHelper.height(0.6 * 180), // proportionally responsive
                    )
                  ],
                ),
              ],
            ),
          ),

          // Value and Text
          Text(
            "$roiValue%",
            style: TextStyle(
              color: Colors.white,
              fontSize: ResponsiveHelper.fontSize(32),
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "$percentageChange from last month",
                style: TextStyle(
                  color: const Color(0xFF2ECC71),
                  fontSize: ResponsiveHelper.fontSize(14),
                ),
              ),
              SizedBox(width: ResponsiveHelper.width(4)),
              Icon(
                Icons.arrow_upward,
                color: const Color(0xFF2ECC71),
                size: ResponsiveHelper.iconSize(16),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
