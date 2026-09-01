import 'package:flutter/material.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';
import 'package:trading/share/widgets/custom_container/custom_container.dart';
import 'package:trading/utils/app_colors/app_colors.dart';
import 'package:trading/utils/extension/base_extension.dart';


class RadioTileWidget extends StatelessWidget {
  const RadioTileWidget({
    super.key,
    required this.isSelected, required this.title, this.vertical, this.horizontal,
  });
final double?vertical;
final double?horizontal;
  final String title;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(

     horizontal: ResponsiveHelper.width(horizontal??8),
      vertical: ResponsiveHelper.height(vertical??8),
      borderColor: AppColors.primaryShade,
      backgroundColor: AppColors.primaryShade100,
      child:       Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Text(title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.titleSmall
          ),
          Container(
            height:ResponsiveHelper.height(24),
            width:ResponsiveHelper.width(24),
            padding: ResponsiveHelper.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color:isSelected? AppColors.primary:AppColors.greySwitch,
                width: ResponsiveHelper.width(2)
              ),
            ),
            child: isSelected
                ? Container(
              decoration:  BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected? AppColors.primary:AppColors.greySwitch,
              ),
            )
                : null,
          ),

        ],
      ),
    );
  }
}