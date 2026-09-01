import 'package:flutter/material.dart';
import 'package:trading/core/routes/app_routes.dart';
import 'package:trading/features/dashboard_account/presentation/screens/account_screen.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';
import 'package:trading/utils/app_assets/app_assets.dart';
import 'package:trading/utils/app_colors/app_colors.dart';
import 'package:trading/utils/app_text/app_strings.dart';
import 'package:trading/utils/extension/base_extension.dart';
import 'package:get/get.dart';

import 'delete_account_popup.dart';

class SettingSheetDashboardWidget extends StatelessWidget {
  const SettingSheetDashboardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ResponsiveHelper.screenHeight * 0.5,
      padding: EdgeInsets.all(ResponsiveHelper.padding(16)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(ResponsiveHelper.borderRadius(20)),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              AppText.selectAccount,
              style: context.bodyLarge.copyWith(
                fontSize: ResponsiveHelper.fontSize(18),
              ),
            ),

            SizedBox(height: ResponsiveHelper.height(4)),

            // Subtitle
            Text(
              AppText.showingListOfAllAccounts,
              style: context.bodySmall.copyWith(
                fontSize: ResponsiveHelper.fontSize(14),
              ),
            ),

            SizedBox(height: ResponsiveHelper.height(12)),

            Column(
              children: [
                GestureDetector(
                  onTap: (){
                    Get.toNamed(AppRoutes.accountManagementScreen);
                  },
                  child: SelectAccountTitleWidget(
                    icon: AppAssets.accountManagementDashboard,
                    title: AppText.accountManagement,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.equityProtectorScreen);
                  },
                  child: SelectAccountTitleWidget(
                    icon: AppAssets.equityProtectorDashboard,
                    title: AppText.equityProtector,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.tradingSymbolScreen);
                  },
                  child: SelectAccountTitleWidget(
                    icon: AppAssets.tradingSymbolDashboard,
                    title: AppText.tradingSymbols,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showDeleteAccountDialog(context, isDelete: true,
                    
                    );
                  },
                  child: SelectAccountTitleWidget(
                    icon: AppAssets.deleteAccountDashboard,
                    title: AppText.deleteAccount,
                    titleColor: AppColors.red,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
