import 'package:flutter/material.dart';
import 'package:trading/share/widgets/custom_image/custom_image.dart';
import 'package:trading/utils/app_assets/app_assets.dart';
import 'package:trading/utils/app_colors/app_colors.dart';
import 'package:trading/utils/app_text/app_strings.dart';
import 'package:trading/utils/extension/base_extension.dart';


class SettingTileCopierWidget extends StatelessWidget {
  const SettingTileCopierWidget({
    super.key, required this.icon, required this.title, this.subtitle, required this.onTap, this.color,
  });

  final String icon;
  final String title;
  final String?subtitle;
  final VoidCallback onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        dense: true,
        minVerticalPadding: 0,
        visualDensity:  VisualDensity(vertical: -3),
        leading: CustomImage(imageSrc: icon),
        title: Text(title, style: context.bodyMedium.copyWith(color:color?? AppColors.textBlack)),
        subtitle: Text(
          subtitle??AppText.descriptionWillGoHere,
          style: context.bodySmall,
        ),
        trailing: CustomImage(imageSrc: AppAssets.arrowFront),
      ),
    );
  }
}