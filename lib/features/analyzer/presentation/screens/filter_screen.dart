import 'package:flutter/material.dart';
import 'package:trading/features/copier/presentation/widgets/custom_appbar_copier.dart';
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

class FilterScreen extends StatelessWidget {
   FilterScreen({super.key});
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarCopier(title: AppText.filter),

      body: SingleChildScrollView(
        child: Padding(
          padding:  ResponsiveHelper.all(8.0),
          child: Column(

            children: [
              CustomContainer(
                borderColor: AppColors.boarderColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppText.filter,
                      style: context.bodySmall.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
        
                    SizedBox(height: ResponsiveHelper.height(8)),
        
                    CustomContainerBorderParent(
                      child: Column(
                        children: [
                          CustomTextField(
                            labelText: AppText.accountType,
                            controller: controller,
        
                            suffixWidget: CustomImage(imageSrc: AppAssets.dropdown),
                          ),
                          CustomDivider(),
                          CustomTextField(
                            labelText: AppText.selectCurrency,
                            controller: controller,
        
                            suffixWidget: CustomImage(imageSrc: AppAssets.dropdown),
                          ),
                          CustomDivider(),
                          CustomTextField(
                            labelText: AppText.dateRange,
                            controller: controller,
        
                            suffixWidget: CustomImage(imageSrc: AppAssets.dropdown),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            SizedBox(height: ResponsiveHelper.height(180),),
              ElevatedButton(onPressed: (){}, child: Text(
                AppText.applyFilter
              ))
              
            ],
          ),
        ),
      ),
    );
  }
}
