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
import 'package:get/get.dart';

class AddAccountScreen extends StatelessWidget {
   AddAccountScreen({super.key});
  final TextEditingController controller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarCopier(title: AppText.addAccount),

      body: SingleChildScrollView(
        child: Padding(
          padding: ResponsiveHelper.all(16),
          child: Column(
            children: [
              CustomContainerBorderParent(
                child: Column(
                  children: [
                    // full name===============================
                    CustomTextField(
                      labelText: AppText.fullName,

                      controller: controller,

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "This field cannot be empty";
                        }
                        return null;
                      },
                    ),
                    CustomDivider(),
                    // phone number===============================
                    CustomTextField(
                      labelText: AppText.phoneNumber,

                      controller: controller,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "This field cannot be empty";
                        }
                        return null;
                      },
                    ),
                    CustomDivider(),
                    // country===============================
                    CustomTextField(
                      labelText: AppText.countryRegion,

                      controller: controller,
                      suffixWidget: CustomImage(imageSrc: AppAssets.dropdown),

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "This field cannot be empty";
                        }
                        return null;
                      },
                    ),

                    CustomDivider(),
                    // referral code===============================
                    CustomTextField(
                      labelText: AppText.referralCode,
                      suffixWidget: CustomImage(imageSrc: AppAssets.dropdown),
                      controller: controller,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "This field cannot be empty";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),

              SizedBox(height: ResponsiveHelper.height(120)),
              ElevatedButton(
                onPressed: () {
                  Get.bottomSheet(
                    Container(
                      height: ResponsiveHelper.height(400), // 50% approx of phone height
                      padding: ResponsiveHelper.all(16),
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

                            SizedBox(height: ResponsiveHelper.spacing(4)),

                            Text(
                              AppText.showingListOfAllAccounts,
                              style: context.bodySmall.copyWith(
                                fontSize: ResponsiveHelper.fontSize(14),
                              ),
                            ),

                            SizedBox(height: ResponsiveHelper.spacing(12)),

                            CustomContainer(
                              borderColor: AppColors.primaryShade,
                              backgroundColor: AppColors.primaryShade100,
                              vertical: ResponsiveHelper.height(8),
                              horizontal: ResponsiveHelper.width(8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Card(
                                        color: AppColors.blueGrey,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            ResponsiveHelper.borderRadius(4),
                                          ),
                                        ),
                                        child: SizedBox(
                                          height: ResponsiveHelper.height(25),
                                          width: ResponsiveHelper.width(25),
                                          child: Center(
                                            child: Text(
                                              AppText.eh,
                                              style: context.bodySmall.copyWith(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w700,
                                                fontSize: ResponsiveHelper.fontSize(12),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: ResponsiveHelper.width(4)),
                                      SizedBox(
                                        width: ResponsiveHelper.width(200), // max width for text
                                        child: Text(
                                          "360 Degrees Markets",
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: context.titleSmall.copyWith(
                                            fontSize: ResponsiveHelper.fontSize(14),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  _buildCustomRadio(true),
                                ],
                              ),
                            ),

                            SizedBox(height: ResponsiveHelper.spacing(12)),

                            SizedBox(
                              width: double.infinity,
                              height: ResponsiveHelper.height(48),
                              child: ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  AppText.selectBroker,
                                  style: TextStyle(
                                    fontSize: ResponsiveHelper.fontSize(16),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
                child: Text(AppText.addAccount),
              ),
            ],
          ),
        ),
      ),









    );
  }




  /// Custom Radio ==========================================
  Widget _buildCustomRadio(bool isSelected) {
    return Container(
      height: ResponsiveHelper.height(24),
      width: ResponsiveHelper.width(24),
      padding: EdgeInsets.all(ResponsiveHelper.padding(3)),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? AppColors.primary : AppColors.greySwitch,
          width: ResponsiveHelper.width(2),
        ),
      ),
      child: isSelected
          ? Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? AppColors.primary : AppColors.greySwitch,
              ),
            )
          : null,
    );
  }
}
