import 'package:flutter/material.dart';
import 'package:trading/features/common/presentation/widgets/title_text_widget.dart';
import 'package:trading/features/copier/presentation/widgets/template_sheet_widget.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';
import 'package:trading/share/widgets/custom_container/custom_container.dart';
import 'package:trading/share/widgets/custom_image/custom_image.dart';
import 'package:trading/utils/app_assets/app_assets.dart';
import 'package:trading/utils/app_colors/app_colors.dart';
import 'package:trading/utils/app_text/app_strings.dart';
import 'package:trading/utils/extension/base_extension.dart';
import 'package:get/get.dart';

import 'custom_search_field.dart';

class TemplateTabWidget extends StatelessWidget {
  const TemplateTabWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomSearchField(),
        SizedBox(height: ResponsiveHelper.height(16)),
        TitleTextWidget(title: "Copier Templates"),
        SizedBox(height: ResponsiveHelper.height(16)),

        CustomContainer(
          borderColor: AppColors.boarderColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Enabled (03)",
              style: context.bodySmall,
              ),
              SizedBox(height: ResponsiveHelper.height(12),),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(4, (index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: ResponsiveHelper.height(12)),
                    child: GestureDetector(
                      onTap: () {
                        Get.bottomSheet(TemplateSheetWidget());
                      },
                      child: CustomContainer(
                        borderColor: AppColors.boarderColor,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppText.testTemplate,
                              style: Theme.of(context)
                                  .textTheme.bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height:ResponsiveHelper.spacing(4)),
                            Text(
                              "Type: Rot Multiplier   Risk Settings: 100%",
                              style: Theme.of(context)
                                  .textTheme.bodySmall
                                  ?.copyWith(fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
        SizedBox(height: ResponsiveHelper.height(18)),
      ],
    );
  }
}