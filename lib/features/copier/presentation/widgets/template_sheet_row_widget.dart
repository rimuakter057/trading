

import 'package:flutter/material.dart';
import 'package:trading/utils/app_colors/app_colors.dart';
import 'package:trading/utils/extension/base_extension.dart';


class TemplateSheetRowWidget extends StatelessWidget {
  const TemplateSheetRowWidget({
    super.key, required this.title, required this.subTitle, this.color,
  });

  final String title;
  final String subTitle;
  final Color?color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style: context.bodyMedium,),
        Text(subTitle,style: context.bodyMedium.copyWith(
            color:color?? AppColors.subPrimary
        ),),

      ],);
  }
}