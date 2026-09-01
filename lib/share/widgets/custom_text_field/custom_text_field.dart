

import 'package:flutter/material.dart';
import 'package:trading/utils/app_colors/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class CustomTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final Widget? prefixIcon;
  final Widget? suffixWidget;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Color? backgroundColor;
  final InputBorder? border;
  final EdgeInsetsGeometry? padding;

  /// NEW
  final VoidCallback? onTap;
  final bool readOnly;

  const CustomTextField({
    super.key,
    required this.labelText,
    required this.controller,
    this.prefixIcon,
    this.suffixWidget,
    this.validator,
    this.keyboardType,
    this.obscureText = false,
    this.backgroundColor,
    this.border,
    this.padding,

    /// new
    this.onTap,
    this.readOnly = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 6.w),
      child: TextFormField(
        controller: controller,
        readOnly: readOnly,
        onTap: onTap, // only opens if provided
        textAlignVertical: TextAlignVertical.center,
        style: GoogleFonts.instrumentSans(
          fontWeight: FontWeight.w500,
          fontSize: 16.sp,
          color: AppColors.textBlack,
        ),
        keyboardType: keyboardType,
        obscureText: obscureText,
        validator: validator,
        maxLines: 1,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: GoogleFonts.instrumentSans(
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
            color: AppColors.subPrimary,
          ),
          filled: true,
          fillColor: AppColors.textFieldBg,
          border: border ?? InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          prefixIcon: prefixIcon,
          prefixIconConstraints: BoxConstraints(
            minWidth: 24.w,
            minHeight: 24.h,
          ),
          suffixIcon: suffixWidget,
          isDense: true,
          contentPadding: EdgeInsets.zero,
        ),
      ),
    );
  }
}





//
// class CustomTextField extends StatelessWidget {
//   final String labelText;
//
//   final TextEditingController controller;
//   final Widget? prefixIcon;
//   final Widget? suffixWidget;
//   final String? Function(String?)? validator;
//   final TextInputType? keyboardType;
//   final bool obscureText; // true/false directly
//   final Color? backgroundColor;
//   final InputBorder? border;
//   final EdgeInsetsGeometry? padding;
//
//   const CustomTextField({
//     super.key,
//     required this.labelText,
//
//     required this.controller,
//     this.prefixIcon,
//     this.suffixWidget,
//     this.validator,
//     this.keyboardType,
//     this.obscureText = false, // default false
//     this.backgroundColor,
//     this.border,
//     this.padding,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding:  EdgeInsets.symmetric(horizontal: 10.h,vertical: 6.w),
//       child: TextFormField(
//
//         textAlignVertical: TextAlignVertical.center,
//         style: GoogleFonts.instrumentSans(
//           fontWeight: FontWeight.w500,
//           fontSize: 16.sp,
//           color: AppColors.textBlack,
//         ),
//         keyboardType: keyboardType,
//         obscureText: obscureText, // direct true/false
//         controller: controller,
//         validator: validator,
//         maxLines: 1,
//         decoration: InputDecoration(
//           labelText: labelText,
//          // hintText: hintText,
//           labelStyle: GoogleFonts.instrumentSans(
//             fontWeight: FontWeight.w500,
//             fontSize: 16.sp,
//             color: AppColors.subPrimary,
//           ),
//           filled: true,                     // enable background fill
//           fillColor: AppColors.textFieldBg, // background color
//           border: border ?? InputBorder.none,
//
//           enabledBorder: InputBorder.none,
//           focusedBorder: InputBorder.none,
//           prefixIcon: prefixIcon ,
//
//           // icon box size
//           prefixIconConstraints: BoxConstraints(
//             minWidth: 24.w,
//             minHeight: 24.h,
//           ),
//
//           prefixIconColor: AppColors.hintText,
//           suffixIcon: suffixWidget,
//           isDense: true,
//           contentPadding: EdgeInsets.zero,
//         ),
//       ),
//     );
//   }
// }
