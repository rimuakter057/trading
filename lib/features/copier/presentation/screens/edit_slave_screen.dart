import 'package:flutter/material.dart';
import 'package:trading/core/routes/app_routes.dart';
import 'package:trading/features/common/presentation/widgets/title_text_widget.dart';
import 'package:trading/features/copier/presentation/widgets/card_title_text_widget.dart';
import 'package:trading/features/copier/presentation/widgets/custom_appbar_copier.dart';
import 'package:trading/features/copier/presentation/widgets/edit_slave_tile_widget.dart';
import 'package:trading/features/copier/presentation/widgets/setting_sheet_slave.dart';
import 'package:trading/features/copier/presentation/widgets/setting_tile_copier_widget.dart';
import 'package:trading/features/dashboard_account/presentation/widgets/custom_switch_button.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';
import 'package:trading/share/widgets/custom_container/custom_container.dart';
import 'package:trading/share/widgets/custom_divider/custom_divider.dart';
import 'package:trading/share/widgets/custom_image/custom_image.dart';
import 'package:trading/share/widgets/custom_text_field/custom_text_field.dart';
import 'package:trading/share/widgets/custom_text_field_parent/custom_text_field_parent.dart';
import 'package:trading/utils/app_assets/app_assets.dart';
import 'package:trading/utils/app_colors/app_colors.dart';
import 'package:trading/utils/app_text/app_strings.dart';
import 'package:get/get.dart';

class EditSlaveScreen extends StatelessWidget {
  EditSlaveScreen({super.key});
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Widget gap =SizedBox(height: ResponsiveHelper.height(18));
    return Scaffold(
      appBar: CustomAppBarCopier(
        title: AppText.editSlave,
        actionIcon: CustomImage(imageSrc: AppAssets.threeDotCopier),
        onAction: () {
          Get.bottomSheet(SettingSheetSlaveWidget(), isScrollControlled: true);
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  ResponsiveHelper.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              gap,
              TitleTextWidget(title: AppText.copySettings),
              gap,
              ///account setting =========================================================================
              CustomContainer(
                borderColor: AppColors.boarderColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CardTitleTextWidget(title: AppText.accountSettings),
                    SizedBox(height: ResponsiveHelper.height(12)),
                    CustomContainerBorderParent(
                      child: Column(
                        children: [
                          CustomTextField(
                            labelText: AppText.copyFromAccount,
                            suffixWidget: CustomImage(
                              imageSrc: AppAssets.dropdown,
                            ),
                            controller: controller,
                          ),
                          CustomDivider(),
                          CustomTextField(
                            labelText: AppText.copyFromAccount,
                            controller: controller,
                          ),
                        ],
                      ),
                    ),



                  ],
                ),
              ),

              gap,
              ///other Protection =========================================================================
              CustomContainer(
                borderColor: AppColors.boarderColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CardTitleTextWidget(title: AppText.otherProtection),

                    SizedBox(height: ResponsiveHelper.height(8)),
                    EditSlaveTileWidget(
                      title: AppText.copyStopLoss,
                    ),
                    CustomDivider(),
                    EditSlaveTileWidget(
                      title: AppText.copyTakeProfit,
                    ),
                    CustomDivider(),
                    EditSlaveTileWidget(
                      title: AppText.copyPendingOrders,
                    ),




                  ],
                ),
              ),
              gap,
              ///advance  setting =========================================================================

              gap,

              CustomContainer(
                borderColor: AppColors.boarderColor,
                child:          SettingTileCopierWidget(
                  icon: AppAssets.editCopier,
                  title: AppText.advanceSettings,
                  onTap: () {
                    Get.toNamed(AppRoutes.advanceSettingScreen);
                  },

                ),

              ),
              gap,
              ElevatedButton(onPressed: (){},
                  child: Text(AppText.saveSettings)
              )

            ],
          ),
        ),
      ),
    );
  }
}


