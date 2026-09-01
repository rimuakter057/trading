import 'package:flutter/material.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';
import 'package:trading/share/widgets/custom_container/custom_container.dart';
import 'package:trading/share/widgets/custom_divider/custom_divider.dart';
import 'package:trading/utils/app_colors/app_colors.dart';
import 'package:trading/utils/app_text/app_strings.dart';
import 'package:trading/utils/extension/base_extension.dart';

class GeneralCardWidget extends StatelessWidget {
  const GeneralCardWidget({super.key, required this.title1, required this.value1, this.valueColor1, required this.title2, required this.value2, this.valueColor2, required this.title});

  final String title;
  final String title1;
  final String value1;
  final Color? valueColor1;
  final String title2;
  final String value2;
  final Color? valueColor2;





  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      backgroundColor: AppColors.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(title,style: context.bodySmall.copyWith(fontWeight: FontWeight.w700),),

          SizedBox(height: ResponsiveHelper.height(16)),
          _buildGeneralRowWithValue(
            context,
            title:title1,
            value: value1,
            valueColor: valueColor1,


          ),
          SizedBox(height: ResponsiveHelper.height(16)),
          CustomDivider(thickness: 1.2),
          SizedBox(height: ResponsiveHelper.height(16)),
          _buildGeneralRowWithValue(
            context,
            title:title2,
            value: value2,
            valueColor: valueColor2,

          ),
        ],
      ),
    );
  }










  Widget _buildGeneralRowWithValue(
      BuildContext context,{required  String title,
        required   String  value,
         Color? valueColor,
      }


      ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [

            Container(
              width: ResponsiveHelper.width(18),
              height: ResponsiveHelper.height(18),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  ResponsiveHelper.borderRadius(6),
                ),
                color: AppColors.white,
                border: Border.all(color: AppColors.boarderColor),
              ),
            ),
            SizedBox(width: ResponsiveHelper.width(4)),
            Text(
              title,
              style: context.bodySmall.copyWith(
                fontWeight: FontWeight.w600,

                color: AppColors.textBlack
              ),
            ),
          ],
        ),
        Text(
          value,
          style: context.bodySmall.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: ResponsiveHelper.fontSize(14),
            color:valueColor?? AppColors.subTitle
          ),
        ),
      ],
    );
  }



}
