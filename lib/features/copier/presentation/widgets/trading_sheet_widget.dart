import 'package:flutter/material.dart';
import 'package:trading/features/copier/presentation/widgets/map_symbol_sheet_widget.dart';
import 'package:trading/features/copier/presentation/widgets/radio_tile_widget.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';
import 'package:trading/share/widgets/custom_divider/custom_divider.dart';
import 'package:trading/share/widgets/custom_image/custom_image.dart';
import 'package:trading/share/widgets/custom_text_field/custom_text_field.dart';
import 'package:trading/share/widgets/custom_text_field_parent/custom_text_field_parent.dart';
import 'package:trading/utils/app_assets/app_assets.dart';
import 'package:trading/utils/app_text/app_strings.dart';
import 'package:trading/utils/extension/base_extension.dart';
import 'package:get/get.dart';



class TradingSheetWidget extends StatelessWidget {
   TradingSheetWidget({super.key});
final TextEditingController controller =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ResponsiveHelper.screenHeight * 0.6,
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
              AppText.addedTradingHours,
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

            ///input field===========================================================
            CustomContainerBorderParent(
              child: Column(
                children: [
                  CustomTextField(
                    labelText: AppText.day,
                    suffixWidget: CustomImage(
                      imageSrc: AppAssets.dropdown,
                    ),
                    controller: controller,
                  ),
                  CustomDivider(),
                  CustomTextField(
                    labelText: AppText.selectStartTime,
                    suffixWidget: CustomImage(
                      imageSrc: AppAssets.dropdown,
                    ),
                    controller: controller,
                  ),
                  CustomDivider(),
                  CustomTextField(
                    labelText: "End Time",
                    suffixWidget: CustomImage(
                      imageSrc: AppAssets.dropdown,
                    ),
                    controller: controller,
                  ),

                ],
              ),
            ),

            SizedBox(height: ResponsiveHelper.height(24)),

            ElevatedButton(onPressed: (){

            },
                child: Text(AppText.addTradingHour)
            ),



          ],
        ),
      ),
    );
  }
}