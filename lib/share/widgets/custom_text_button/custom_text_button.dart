import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trading/utils/app_colors/app_colors.dart';
class CustomOutlineButton extends StatelessWidget {
  final String title;          // ✅ final
  final VoidCallback onTap;    // ✅ final, use VoidCallback

  const CustomOutlineButton({
    super.key, required this.title,required this.onTap
  });


  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed:onTap,
      style: OutlinedButton.styleFrom(
        minimumSize: Size(double.infinity, 61.h), // Full width & height 50
        side: BorderSide(color: AppColors.outlineBorder, width: 1), // Outline color & thickness
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // Rounded corner
        ),
        backgroundColor: Colors.white,
      ),
      child: Text(
        title,
        style: TextStyle(
          color: AppColors.black,       // Text color
          fontSize: 18,             // Font size
          fontWeight: FontWeight.w600, // Font weight
        ),
      ),
    );
  }
}