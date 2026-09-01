import 'package:flutter/material.dart';
import 'package:trading/share/widgets/custom_image/custom_image.dart';
import 'package:trading/utils/app_colors/app_colors.dart';

import 'package:trading/utils/extension/base_extension.dart';

import 'custom_switch_button.dart';

class NotificationTileWidget extends StatelessWidget {
  final String leadingIcon;
  final String title;
  final String subtitle;

  // Trailing params
  final bool showSwitch;
  final bool switchValue;

// switch current value
  final ValueChanged<bool>? onChanged;
  final String? trailingText;


  const NotificationTileWidget({
    super.key,
    required this.leadingIcon,
    required this.title,
    required this.subtitle,
    this.showSwitch = true,
    this.switchValue = false,
    this.onChanged,
    this.trailingText,

  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(0),
      leading: CustomImage(imageSrc: leadingIcon),
      title: Text(title, style: context.bodyMedium),
      subtitle: Text(
        subtitle,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: context.bodySmall,
      ),
      trailing: showSwitch
          ? CustomTealSwitch(
        value: switchValue,
          onChanged: onChanged!,
      )
          : Text(
        trailingText ?? "",
        style:  context.bodyMedium.copyWith(color: AppColors.subPrimary),
      ),
    );
  }
}
