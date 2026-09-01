import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';
import 'package:trading/share/widgets/custom_image/custom_image.dart';
import 'package:trading/utils/app_assets/app_assets.dart';
import 'package:trading/utils/extension/base_extension.dart';

class CustomAppBarCopier extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  /// Custom leading (logo / anything)
  final Widget? leading;

  /// Default back show or not
  final bool showBack;

  /// Optional action
  final VoidCallback? onAction;
  final Widget? actionIcon;

  const CustomAppBarCopier({
    super.key,
    required this.title,
    this.leading,
    this.showBack = true,
    this.onAction,
    this.actionIcon,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: context.bodyMedium),

      /// Leading priority:
      /// 1. Custom leading
      /// 2. Default back
      /// 3. Null
      leading: Padding(
        padding: EdgeInsets.only(left: ResponsiveHelper.width(20)),
        child: leading ??
            (showBack
                ? GestureDetector(
                            onTap: () => Get.back(),
                            child: CustomImage(imageSrc: AppAssets.arrowBack),
                          )
                : null),
      ),

      /// Action (optional)
      actions: onAction == null
          ? []
          : [
        GestureDetector(
          onTap: onAction,
          child: Row(
            children: [
              actionIcon ??
                  CustomImage(imageSrc: AppAssets.threeDotCopier),
              SizedBox(width: ResponsiveHelper.width(16)),
            ],
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
