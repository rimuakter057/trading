import 'package:flutter/material.dart';
import 'package:trading/utils/app_colors/app_colors.dart';
import 'package:trading/utils/extension/base_extension.dart';


class InstrumentRowWidget extends StatelessWidget {
  const InstrumentRowWidget({
    super.key, required this.title, required this.number, this.color,
  });
final String title;
final String number;
final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style: context.bodySmall.copyWith(fontWeight: FontWeight.w600),),
        Text(number,style: context.bodySmall.copyWith(fontWeight: FontWeight.w600,color: color??AppColors.subTitle),),
      ],
    );
  }
}