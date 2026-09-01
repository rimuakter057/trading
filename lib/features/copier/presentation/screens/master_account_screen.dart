import 'package:flutter/material.dart';
import 'package:trading/core/routes/app_routes.dart';
import 'package:trading/features/common/presentation/widgets/title_text_widget.dart';
import 'package:trading/features/copier/presentation/widgets/card_title_text_widget.dart';
import 'package:trading/features/copier/presentation/widgets/custom_appbar_copier.dart';
import 'package:trading/features/copier/presentation/widgets/setting_sheet_copier_widget.dart';
import 'package:trading/features/copier/presentation/widgets/slave_account_card_widget.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';
import 'package:trading/share/widgets/custom_container/custom_container.dart';
import 'package:trading/share/widgets/custom_image/custom_image.dart';
import 'package:trading/utils/app_assets/app_assets.dart';
import 'package:trading/utils/app_colors/app_colors.dart';
import 'package:trading/utils/app_text/app_strings.dart';
import 'package:get/get.dart';

class MasterAccountScreen extends StatefulWidget {
  const MasterAccountScreen({super.key});

  @override
  State<MasterAccountScreen> createState() => _MasterAccountScreenState();
}

class _MasterAccountScreenState extends State<MasterAccountScreen> {
  bool isSwitched = true;

  @override
  Widget build(BuildContext context) {
    final Widget gap = SizedBox(height: ResponsiveHelper.height(12));
    return Scaffold(
      appBar: CustomAppBarCopier(
        title: AppText.masterAccount,
        actionIcon: CustomImage(imageSrc: AppAssets.threeDotCopier),
        onAction: () {
          Get.bottomSheet(SettingSheetCopierWidget(), isScrollControlled: true);
        },
      ),

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
                    title: AppText.masterAccount,
                    borderColor: AppColors.primary,
                    bgColor: AppColors.white,
                    switchColor: AppColors.primary,

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
            gap,

            TitleTextWidget(title: AppText.slaves),
            gap,

            ///slave list=======================================================
            CustomContainer(
              backgroundColor: AppColors.white,
              borderColor: AppColors.boarderColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CardTitleTextWidget(title: "Enabled Slaves (07)"),

                  SizedBox(height: ResponsiveHelper.height(8)),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.slaveAccountScreen);
                    },
                    child: SlaveAccountCard(
                      isSwitched: isSwitched,
                      title: AppText.slaveAccount,
                      subTitle: "Risk Type: Lot Multiplier  Risk: 1%",
                      onChanged: (value) {
                        setState(() {
                          isSwitched = value;
                        });
                      },
                    ),
                  ),

                  SizedBox(height: ResponsiveHelper.height(8)),

                  SlaveAccountCard(
                    isSwitched: isSwitched,
                    title: AppText.slaveAccount,
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
          ],
        ),
      ),
    );
  }
}
