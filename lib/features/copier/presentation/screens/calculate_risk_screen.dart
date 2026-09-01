import 'package:flutter/material.dart';
import 'package:trading/core/routes/app_routes.dart';
import 'package:trading/features/copier/presentation/widgets/custom_appbar_copier.dart';
import 'package:trading/features/copier/presentation/widgets/map_symbol_sheet_widget.dart';
import 'package:trading/features/copier/presentation/widgets/setting_sheet_slave.dart';
import 'package:trading/features/copier/presentation/widgets/tab_widget.dart';
import 'package:trading/features/dashboard_account/presentation/widgets/delete_account_popup.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';
import 'package:trading/share/widgets/custom_container/custom_container.dart';
import 'package:trading/share/widgets/custom_divider/custom_divider.dart';
import 'package:trading/share/widgets/custom_image/custom_image.dart';
import 'package:trading/share/widgets/custom_text_field/custom_text_field.dart';
import 'package:trading/share/widgets/custom_text_field_parent/custom_text_field_parent.dart';
import 'package:trading/utils/app_assets/app_assets.dart';
import 'package:trading/utils/app_colors/app_colors.dart';
import 'package:trading/utils/app_text/app_strings.dart';
import 'package:trading/utils/extension/base_extension.dart';
import 'package:get/get.dart';

class CalculateRiskScreen extends StatelessWidget {
  CalculateRiskScreen({super.key});
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Widget gap = SizedBox(height: ResponsiveHelper.height(24));
    return Scaffold(
      appBar: CustomAppBarCopier(
        title: AppText.calculateRisk,
        actionIcon: CustomImage(imageSrc: AppAssets.threeDotCopier),
        onAction: () {
          showDeleteAccountDialog(context, isDelete: false,

          );
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  ResponsiveHelper.all(8.0),
          child: Column(
            children: [
              gap,
              TabWidgetCopier(),
              gap,
              CustomContainer(
                borderColor: AppColors.boarderColor,

                child: Column(
                  children: [
                    ///text================================================
                    CustomContainer(
                      width: double.infinity,
                      borderColor: AppColors.yellowShadeCalculate,
                      backgroundColor: AppColors.yellowShadeCalculate,
                      child: Text(
                        "When you place a trade on your master account, do you calculate your position sizing using a % of the account balance, for example, 1% risk, or do you trade based on lot sizes, for example, 0.5 lots per trade?",
                        style: context.bodySmall,
                      ),
                    ),
                    gap,


                    ///input field===========================================================
                    CustomContainerBorderParent(
                      child: Column(
                        children: [
                          CustomTextField(
                            labelText: AppText.masterTradeRisk,
                            controller: controller,
                          ),
                          CustomDivider(),
                          CustomTextField(
                            labelText: AppText.masterTradeRisk,
                            controller: controller,
                          ),


                        ],
                      ),
                    ),

                    gap,

                    ElevatedButton(

                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.black
                      ),
                      child: Text(AppText.calculate),
                    ),
                  ],
                ),
              ),
              gap,
              gap,
              gap,
              gap,
              ElevatedButton(onPressed: (){

                Get.toNamed(AppRoutes.mapSymbolScreen);
              },
                  child: Text(AppText.applyRiskSettings)
              ),

            ],
          ),
        ),
      ),
    );
  }
}
