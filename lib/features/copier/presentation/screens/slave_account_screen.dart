import 'package:flutter/material.dart';
import 'package:trading/core/routes/app_routes.dart';
import 'package:trading/features/common/presentation/widgets/title_text_widget.dart';
import 'package:trading/features/copier/presentation/widgets/card_title_text_widget.dart';
import 'package:trading/features/copier/presentation/widgets/custom_appbar_copier.dart';
import 'package:trading/features/copier/presentation/widgets/setting_tile_copier_widget.dart';
import 'package:trading/features/copier/presentation/widgets/slave_account_card_widget.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';
import 'package:trading/share/widgets/custom_container/custom_container.dart';
import 'package:trading/share/widgets/custom_divider/custom_divider.dart';
import 'package:trading/utils/app_assets/app_assets.dart';
import 'package:trading/utils/app_colors/app_colors.dart';
import 'package:trading/utils/app_text/app_strings.dart';
import 'package:get/get.dart';


class SlaveAccountScreen extends StatefulWidget {
  const SlaveAccountScreen({super.key});

  @override
  State<SlaveAccountScreen> createState() => _SlaveAccountScreenState();
}

class _SlaveAccountScreenState extends State<SlaveAccountScreen> {
  bool isSwitched = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarCopier(title: AppText.slaveAccount),

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: ResponsiveHelper.width(8)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///master account=======================================================
            CustomContainer(
              backgroundColor: AppColors.white,
              borderColor: AppColors.boarderColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CardTitleTextWidget(title: AppText.masterAccount),
                  SizedBox(height: ResponsiveHelper.height(8)),
                  SlaveAccountCard(
                    isSwitched: isSwitched,
                    title: AppText.slaveAccount,
                    borderColor: AppColors.orange,
                    bgColor: AppColors.orangeShadeBg,
                    switchColor: AppColors.orange,

                    subTitle: "Risk Type: Lot Multiplier  Risk: 1%",
                    onChanged: (value) {
                      setState(() {
                        isSwitched = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: ResponsiveHelper.height(12)),
            TitleTextWidget(title: AppText.settings),
            SizedBox(height: ResponsiveHelper.height(12)),
            ///setting =======================================================
            CustomContainer(
              backgroundColor: AppColors.white,
              borderColor: AppColors.boarderColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CardTitleTextWidget(title: "Enabled Slaves (07)"),

                  SizedBox(height: ResponsiveHelper.height(8)),
                  SettingTileCopierWidget(
                    icon: AppAssets.editCopier,
                    title: AppText.editSlave,
                    onTap: () {
                      Get.toNamed(AppRoutes.editSlaveScreen);
                    },
                  ),
                  CustomDivider(),
                  SettingTileCopierWidget(
                    icon: AppAssets.exportCopier,
                    title: AppText.mapSymbols,
                    onTap: () {
                      Get.toNamed(AppRoutes.mapSymbolScreen);
                    },
                  ),
                  CustomDivider(),
                  SettingTileCopierWidget(
                    icon: AppAssets.exportCopier,
                    title: AppText.override,
                    onTap: () {},
                  ),
                  CustomDivider(),
                  SettingTileCopierWidget(
                    icon: AppAssets.exportCopier,
                    title: AppText.tradingHours,
                    onTap: () {
                      Get.toNamed(AppRoutes.tradingHourScreen);
                    },
                  ),
                  CustomDivider(),
                  SettingTileCopierWidget(
                    icon: AppAssets.deleteAccountDashboard,
                    title: AppText.deleteMasterAccount,
                    color: AppColors.red,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
