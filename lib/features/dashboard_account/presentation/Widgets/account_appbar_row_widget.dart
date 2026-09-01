import 'package:flutter/material.dart';
import 'package:trading/features/dashboard_account/presentation/Widgets/setting_sheet_dashboard_widget.dart';

import 'package:trading/helper/responsive_helper/responsive_helper.dart';
import 'package:trading/share/widgets/custom_image/custom_image.dart';
import 'package:trading/utils/app_assets/app_assets.dart';
import 'package:trading/utils/app_text/app_strings.dart';
import 'package:trading/utils/extension/base_extension.dart';
import 'package:get/get.dart';

class AccountAppbarRowWidget extends StatelessWidget {
  const AccountAppbarRowWidget({super.key,
    this.isDashboard = false,
  });
final bool isDashboard;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppText.account,
              style: context.titleSmall.copyWith(fontWeight: FontWeight.w400),
            ),

            Text(
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              AppText.mt4104392,
              style: context.bodyMedium,
            ),
          ],
        ),
     isDashboard?CustomImage(imageSrc: AppAssets.dropdown):   Row(
          children: [
            CustomImage(imageSrc: AppAssets.dropdown),
            SizedBox(width: ResponsiveHelper.width(12)),
            GestureDetector(
              onTap: () {
                Get.bottomSheet(
                  SettingSheetDashboardWidget(),

                  isScrollControlled: true,
                );
              },
              child: CustomImage(imageSrc: AppAssets.setting),
            ),
          ],
        ),
      ],
    );
  }
}
