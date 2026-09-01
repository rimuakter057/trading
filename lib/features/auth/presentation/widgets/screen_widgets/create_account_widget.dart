import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trading/features/auth/controllers/onboarding_controller.dart';
import 'package:trading/features/auth/presentation/widgets/onboarding_heading_widget.dart';
import 'package:trading/share/widgets/custom_button/custom_button.dart';
import 'package:trading/share/widgets/custom_divider/custom_divider.dart';
import 'package:trading/share/widgets/custom_svg_icon/custom_svg_icon.dart';
import 'package:trading/share/widgets/custom_text/custom_text.dart';
import 'package:trading/share/widgets/custom_text_field/custom_text_field.dart';
import 'package:trading/share/widgets/custom_text_field_parent/custom_text_field_parent.dart';
import 'package:trading/utils/app_assets/app_assets.dart';
import 'package:trading/utils/app_colors/app_colors.dart' show AppColors;

import 'package:trading/utils/app_text/app_strings.dart';
import 'package:get/get.dart';


class CreateAccountWidget extends StatelessWidget {
   CreateAccountWidget({
    super.key,

  });

  final TextEditingController nameController =TextEditingController();
   final TextEditingController phoneController =TextEditingController();
   final TextEditingController countryController =TextEditingController();
   final TextEditingController referController =TextEditingController();
   final OnBoardingController onBoardingController =
   Get.find<OnBoardingController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.9,
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(35.r),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///heading sections==================================
            OnboardingHeadingWidget(title: AppText.createAccount,
              subTitle: AppText.startTracking,),
             /// sign up field sections==========================
            CustomContainerBorderParent(
        
        
              child: Column(
                children: [
        // full name===============================
                  CustomTextField(
                    labelText: AppText.fullName,

                    controller: nameController,
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

                    controller: phoneController,
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

                    controller: countryController,
                    suffixWidget: DropdownButton<String>(
                      underline: SizedBox(),
                      value: "",
                      icon: CustomSvgIcon(
                        icon: AppAssets.dropdown,
                        height: 7.h,
                        width: 12.w,
                      ),
                      onChanged: (value) {},
                      items: [],
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty)
                        return "This field cannot be empty";
                      return null;
                    },
                  ),
                  CustomDivider(),
                  // referral code===============================
                  CustomTextField(
                    labelText: AppText.referralCode,

                    controller: referController,
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


            SizedBox(height: 32.h,),
        /// email field=============================================================================
            CustomContainerBorderParent(
              child: CustomTextField(
                labelText: AppText.emailAddress,

                controller: referController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email address is required";
                  }
                  if (!AppText.emailRegexp.hasMatch(value)) {
                    return "Please enter a valid email address";
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 8.h,),
            CustomText(text: AppText.otpInfo,
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
              color: AppColors.subPrimary,),
            SizedBox(height: 64.h,),
        /// custom button================================================================
            CustomButton(onTap: (){
              onBoardingController.nextStepCreateAccount();
            },
        
            title: AppText.continueButton,
            ),
            SizedBox(height: 8.h,),
          ],
        ),
      ),
    );
  }
}



