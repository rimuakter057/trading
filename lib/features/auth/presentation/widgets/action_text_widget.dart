import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trading/share/widgets/custom_text/custom_text.dart';
import 'package:trading/utils/app_colors/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';

class ActionTextWidget extends StatelessWidget {
  final String prefixText; // Normal text
  final String actionText; // Clickable text
  final VoidCallback onActionTapped; // Function when link tapped
  final Color? prefixColor;
  final Color? actionColor;
  final double? fontSize;
  final double? fontSizeAction;
 final bool isUnderline;
 final FontWeight? fontWeight;
  final FontWeight? fontWeightAction;
 final Color? underlineColor;
  const ActionTextWidget({
    super.key,
    required this.prefixText,
    required this.actionText,
    required this.onActionTapped,
    this.prefixColor ,
    this.actionColor ,
    this.fontSize,
    this.fontSizeAction,
    this.isUnderline=false,
    this.underlineColor,
    this.fontWeight,
    this.fontWeightAction,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Flexible(
          child: CustomText(
            text: prefixText,
            fontSize:fontSize?? 16,
            fontWeight:fontWeight?? FontWeight.w400,
            color:prefixColor??AppColors.subPrimary,
          ),
        ),
        GestureDetector(
          onTap: onActionTapped,
          child: Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child:Text(
              actionText,
            style: GoogleFonts.instrumentSans(
              fontSize:fontSizeAction?? 16.sp,
              fontWeight:fontWeightAction?? FontWeight.w600,
              color:actionColor?? AppColors.green,
              decoration:
              isUnderline ? TextDecoration.underline : TextDecoration.none,
              decorationColor:
              isUnderline ? (underlineColor ?? AppColors.subPrimary) : null,
            ),

            ),

          ),
        ),
      ],
    );
  }
}
