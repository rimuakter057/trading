import 'package:flutter/material.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';


class CustomRadioCard extends StatelessWidget {
  final String title;
  final String leadingText;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomRadioCard({
    super.key,
    required this.title,
    required this.leadingText,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: ResponsiveHelper.width(16),
          vertical: ResponsiveHelper.height(12),
        ),
        decoration: BoxDecoration(
          color: const Color(0xFFE0F2F1).withOpacity(0.5),
          borderRadius: BorderRadius.circular(ResponsiveHelper.borderRadius(12)),
          border: Border.all(
            color: const Color(0xFF00897B),
            width: ResponsiveHelper.borderWidth(1),
          ),
        ),
        child: Row(
          children: [
            // Blue Square Avatar
            Container(
              height: ResponsiveHelper.height(40),
              width: ResponsiveHelper.width(40),
              decoration: BoxDecoration(
                color: const Color(0xFF90CAF9),
                borderRadius: BorderRadius.circular(ResponsiveHelper.borderRadius(8)),
              ),
              alignment: Alignment.center,
              child: Text(
                leadingText,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: ResponsiveHelper.fontSize(14),
                ),
              ),
            ),
            SizedBox(width: ResponsiveHelper.width(12)),

            // Title Text
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: ResponsiveHelper.fontSize(18),
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF00695C),
                ),
              ),
            ),

            // Custom Radio Button
            _buildCustomRadio(),
          ],
        ),
      ),
    );
  }

  Widget _buildCustomRadio() {
    return Container(
      height: ResponsiveHelper.height(24),
      width: ResponsiveHelper.width(24),
      padding: EdgeInsets.all(ResponsiveHelper.width(3)),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: const Color(0xFF00897B),
          width: ResponsiveHelper.borderWidth(2),
        ),
      ),
      child: isSelected
          ? Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFF00897B),
        ),
      )
          : null,
    );
  }
}
