import 'package:flutter/material.dart';
import 'package:trading/share/widgets/custom_container/custom_container.dart';
import 'package:trading/share/widgets/custom_divider/custom_divider.dart';
import 'package:trading/utils/app_colors/app_colors.dart';
import 'package:trading/utils/extension/base_extension.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';

class StatisticsAnalyzerCard extends StatelessWidget {
  final String mainTitle;
  final String mainValueNumber;
  //final List<Map<String, String>> details;
  final Color? subtitleColor;
  final String? mainValue;
  final String title1;
  final String title2;
  final String title3;
  final String value1;
  final String value2;
  final String value3;
  final Widget? subtitle;

  const StatisticsAnalyzerCard({
    super.key,
    required this.mainTitle,
    required this.mainValueNumber,
    // required this.details,
    this.subtitleColor,
    required this.title1,
    required this.title2,
    required this.title3,
    required this.value1,
    required this.value2,
    required this.value3, this.subtitle,
    this.mainValue,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      backgroundColor: AppColors.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            mainTitle,
            style: context.bodySmall.copyWith(
              fontSize: ResponsiveHelper.fontSize(14),
            ),
          ),

          subtitle??    Row(
               children: [
                 Text(
                   mainValue??'',
                   style: context.bodyMedium.copyWith(
                     color:AppColors.textBlack,
                   ),
                 ),

                     Text(
                    mainValueNumber,
                    style: context.bodyMedium.copyWith(
                      color: subtitleColor ?? AppColors.primary,
                    ),
                  ),
               ],
             ),

          SizedBox(height: ResponsiveHelper.height(16)),
          CustomDivider(),
          SizedBox(height: ResponsiveHelper.height(16)),
          _buildRow(context, title: title1, mainValue: value1),
          SizedBox(height: ResponsiveHelper.height(4)),
          _buildRow(context, title: title2, mainValue: value2),
          SizedBox(height: ResponsiveHelper.height(4)),
          _buildRow(context, title: title3, mainValue: value3),
        ],
      ),
    );
  }

  Row _buildRow(
    BuildContext context, {
    required String title,
    required mainValue,
  }) {
    return Row(
      children: [
        Text(
          title,
          style: context.bodySmall.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: ResponsiveHelper.fontSize(14),
          ),
        ),
        SizedBox(width: ResponsiveHelper.width(4)),
        Text(
          "- $mainValue",
          style: context.bodySmall.copyWith(
            fontSize: ResponsiveHelper.fontSize(14),
          ),
        ),
      ],
    );
  }
}
