import 'package:flutter/material.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';
import 'package:trading/share/widgets/custom_container/custom_container.dart';
import 'package:trading/utils/app_colors/app_colors.dart';
import 'package:trading/utils/app_text/app_strings.dart';
import 'package:trading/utils/extension/base_extension.dart';


class ConsistencyCardWidget extends StatelessWidget {
  const ConsistencyCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      width: double.infinity,
      backgroundColor: AppColors.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppText.worstStreakDay,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: context.bodySmall.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: ResponsiveHelper.height(16)),
          Text("1", style: context.bodyMedium),
        ],
      ),
    );
  }
}