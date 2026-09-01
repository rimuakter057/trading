import 'package:flutter/material.dart';
import 'package:trading/features/dashboard_account/presentation/widgets/custom_switch_button.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';
import 'package:trading/utils/app_colors/app_colors.dart';
import 'package:trading/utils/app_text/app_strings.dart';
import 'package:trading/utils/extension/base_extension.dart';



class EditSlaveTileWidget extends StatelessWidget {
  const EditSlaveTileWidget({
    super.key, required this.title, this.subtitle,
  });
  final String title;
  final String?subtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
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
                style: context.bodyMedium.copyWith(fontWeight: FontWeight.w500),
              ),

              SizedBox(height: ResponsiveHelper.height(4)),

              Text(
                subtitle??AppText.descriptionWillGoHere,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.bodySmall,
              ),
            ],
          ),
        ),

        /// Switch
        CustomTealSwitch(
          activeColor:AppColors.orange,
          value: true,
          onChanged: (value){},
        ),
      ],
    );
  }
}