import 'package:flutter/material.dart';
import 'package:trading/features/common/presentation/widgets/status_outline_container.dart';
import 'package:trading/utils/app_colors/app_colors.dart';
import 'package:trading/utils/extension/base_extension.dart';



class InstrumentHeadingRow extends StatelessWidget {
  const InstrumentHeadingRow({
    super.key, required this.title, required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context,) {
    return Row(
      mainAxisAlignment:  MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: context.bodyLarge),
        StatusOutlineContainer(
          statusBgColor: AppColors.backgroundColor,
          statusBorderColor: AppColors.subTitle,
          status: subtitle,
          statusTextColor:AppColors.subTitle,
        ),
      ],
    );
  }
}