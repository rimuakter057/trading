import 'package:flutter/material.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';
import 'package:trading/utils/app_colors/app_colors.dart';

class ROIHeatmap extends StatelessWidget {
  const ROIHeatmap({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: ResponsiveHelper.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardDark,
        borderRadius: BorderRadius.circular(ResponsiveHelper.borderRadius(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "ROI Heatmap",
            style: TextStyle(
              color: Colors.white,
              fontSize: ResponsiveHelper.fontSize(14),
            ),
          ),
          SizedBox(height: ResponsiveHelper.height(15)),

          // Heatmap Grid Placeholder (Simulating the 7x6 grid)
          AspectRatio(
            aspectRatio: 1.5,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7, // Days: Mon to Sun
                mainAxisSpacing: ResponsiveHelper.height(2),
                crossAxisSpacing: ResponsiveHelper.width(2),
              ),
              itemCount: 42, // Example cells
              itemBuilder: (context, index) {
                // Color logic based on intensity (Red to Green)
                Color cellColor = index % 5 == 0
                    ? Colors.redAccent
                    : index % 3 == 0
                    ? Colors.orange
                    : Colors.teal;
                return Container(
                  decoration: BoxDecoration(
                    color: cellColor.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(ResponsiveHelper.borderRadius(2)),
                  ),
                  child: Center(
                    child: Text(
                      "-0.07",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: ResponsiveHelper.fontSize(6),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          SizedBox(height: ResponsiveHelper.height(10)),
          // Legend Bar (Red to Green)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "-1.0%",
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: ResponsiveHelper.fontSize(10),
                ),
              ),
              Expanded(
                child: Container(
                  height: ResponsiveHelper.height(4),
                  margin: ResponsiveHelper.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(ResponsiveHelper.borderRadius(2)),
                    gradient: const LinearGradient(colors: [Colors.red, Colors.orange, Colors.teal]),
                  ),
                ),
              ),
              Text(
                "+2.0%",
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: ResponsiveHelper.fontSize(10),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
