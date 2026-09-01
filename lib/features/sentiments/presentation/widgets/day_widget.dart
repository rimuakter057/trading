import 'package:flutter/material.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';
import 'package:trading/utils/extension/base_extension.dart';




Widget buildTimeOfDayHeat({required BuildContext context}) {
  return Container(
    padding:  ResponsiveHelper.all(16),
    decoration: BoxDecoration(
      color:  Color(0xFFF8F9FB), // Light grey background
      borderRadius: BorderRadius.circular(ResponsiveHelper.borderRadius(12)),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header Row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Text(
              "Time-of-day Heat",
              style: context.bodySmall
              
            ),
            Text(
              "Mon → Sun",
              style: context.bodySmall
            ),
          ],
        ),
       SizedBox(height: ResponsiveHelper.spacing(16)),
        // Days Row
        const Wrap(
          spacing: 8, // Gap between chips
          runSpacing: 8,
          children: [
            DayChip(label: "Mon", isActive: false),
            DayChip(label: "Tue", isActive: true),
            DayChip(label: "Wed", isActive: true),
            DayChip(label: "Thu", isActive: true),
            DayChip(label: "Fri", isActive: true),
            DayChip(label: "Sat", isActive: false),
            DayChip(label: "Sun", isActive: false),
          ],
        ),
      ],
    ),
  );
}







class DayChip extends StatelessWidget {
  final String label;
  final bool isActive;

  const DayChip({
    super.key,
    required this.label,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    // Define colors based on the image
    final Color color = isActive ? const Color(0xFF2D958E) : const Color(0xFFF16B67);
    final Color bgColor = isActive ? const Color(0xFFF0F9F8) : const Color(0xFFFEF5F4);

    return Container(
      padding:  ResponsiveHelper.symmetric(horizontal: 12, vertical: 2),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(ResponsiveHelper.borderRadius(6)),
        border: Border.all(color: color, width: 1),
      ),
      child: Text(
        label,
        style: context.bodySmall.copyWith(
          color: color

        )
      ),
    );
  }
}