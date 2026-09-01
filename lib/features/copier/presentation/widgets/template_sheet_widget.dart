import 'package:flutter/material.dart';
import 'package:trading/core/routes/app_routes.dart';
import 'package:trading/features/copier/presentation/widgets/template_sheet_row_widget.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';
import 'package:trading/share/widgets/custom_divider/custom_divider.dart';
import 'package:trading/utils/app_colors/app_colors.dart';
import 'package:trading/utils/app_text/app_strings.dart';
import 'package:trading/utils/extension/base_extension.dart';
import 'package:get/get.dart';




class TemplateSheetWidget extends StatelessWidget {
  TemplateSheetWidget({super.key});
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
              AppText.testTemplate,
              style: context.bodyLarge.copyWith(
                fontSize: ResponsiveHelper.fontSize(18),
              ),
            ),

            SizedBox(height: ResponsiveHelper.height(18)),

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
                              TemplateSheetRowWidget(title: 'Risk Type', subTitle: 'Lot Multiplier',),
                              SizedBox(height: ResponsiveHelper.height(4),),
                              CustomDivider(),
                              TemplateSheetRowWidget(title: 'Risk Settings', subTitle: '100% ',),
                  SizedBox(height: ResponsiveHelper.height(4),),
                              CustomDivider(),
                              TemplateSheetRowWidget(title: 'Copy SL', subTitle: '-',),
                  SizedBox(height: ResponsiveHelper.height(4),),
                              CustomDivider(),
                              TemplateSheetRowWidget(title: 'Copy TP', subTitle: 'Activated',
                              color: AppColors.primary,
                              ),
                  SizedBox(height: ResponsiveHelper.height(4),),
                              CustomDivider(),
                              TemplateSheetRowWidget(title: 'Copy Pending', subTitle: 'Activated',
                                color: AppColors.primary,

                              ),
                ],
              ),



            SizedBox(height: ResponsiveHelper.height(24)),

            ElevatedButton(onPressed: (){

              Get.toNamed(AppRoutes.editTemplateScreen);

            },
                child: Text(AppText.editTemplate)
            ),



          ],
        ),
      ),
    );
  }
}

