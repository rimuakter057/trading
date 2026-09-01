import 'package:flutter/material.dart';
import 'package:trading/features/dashboard_account/presentation/widgets/custom_switch_button.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';
import 'package:trading/share/widgets/custom_container/custom_container.dart';
import 'package:trading/utils/app_colors/app_colors.dart';
import 'package:trading/utils/app_text/app_strings.dart';
import 'package:trading/utils/extension/base_extension.dart';


class SlaveAccountCard extends StatelessWidget {
  final bool isSwitched;
  final ValueChanged<bool> onChanged;
  final String subTitle;
  final String title;
  final Color? bgColor;
  final Color?borderColor;
  final Color?switchColor;


  const SlaveAccountCard({
    super.key,
    required this.isSwitched,
    required this.onChanged,
    required this.subTitle, required this.title, this.bgColor, this.borderColor, this.switchColor,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      borderColor:borderColor?? AppColors.orange,
      backgroundColor:bgColor?? AppColors.orangeShadeBg,
      vertical: ResponsiveHelper.height(12),
      horizontal: ResponsiveHelper.width(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// Left Side
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: context.bodyMedium,
                ),

                SizedBox(height: ResponsiveHelper.height(4)),

                Text(
                  subTitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.bodySmall,
                ),
              ],
            ),
          ),

          /// Switch
          CustomTealSwitch(
            activeColor:switchColor?? AppColors.orange,
            value: isSwitched,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
