import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';
import 'package:trading/utils/app_colors/app_colors.dart';

class CustomTealSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color? activeColor;
  const CustomTealSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    this.activeColor,
  });

  @override
  State<CustomTealSwitch> createState() => _CustomTealSwitchState();
}

class _CustomTealSwitchState extends State<CustomTealSwitch> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onChanged(!widget.value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: ResponsiveHelper.width(64),
        height: ResponsiveHelper.height(28),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            ResponsiveHelper.borderRadius(20),
          ),

          color: widget.value
              ? widget.activeColor ?? AppColors.primary
              : AppColors.greySwitch,
          border: Border.all(
            color: widget.value
                ? widget.activeColor ?? AppColors.primary
                : AppColors.greySwitch,
            width: ResponsiveHelper.width(2),
          ),
        ),
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 200),
          alignment: widget.value
              ? Alignment.centerRight
              : Alignment.centerLeft,
          child: Padding(
            padding: ResponsiveHelper.symmetric(horizontal: 2.0),
            child: Container(
              width: ResponsiveHelper.width(39),
              height: ResponsiveHelper.height(24),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  ResponsiveHelper.borderRadius(20),
                ),
                color: AppColors.white, // The white thumb
              ),
            ),
          ),
        ),
      ),
    );
  }
}
