import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trading/core/routes/app_routes.dart';
import 'package:trading/features/auth/controllers/onboarding_controller.dart';
import 'package:trading/share/widgets/custom_button/custom_button.dart';
import 'package:trading/share/widgets/custom_divider/custom_divider.dart';
import 'package:trading/share/widgets/custom_svg_icon/custom_svg_icon.dart';
import 'package:trading/share/widgets/custom_text_field/custom_text_field.dart';
import 'package:trading/share/widgets/custom_text_field_parent/custom_text_field_parent.dart';
import 'package:trading/utils/app_assets/app_assets.dart';
import 'package:trading/utils/app_colors/app_colors.dart';

import 'package:trading/utils/app_text/app_strings.dart';
import 'package:trading/utils/extension/base_extension.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../onboarding_heading_widget.dart';

class LoginWidget extends StatelessWidget {
  LoginWidget({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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
        borderRadius: BorderRadius.vertical(top: Radius.circular(35.r)),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///heading sections==================================
            OnboardingHeadingWidget(
              title: AppText.loginToYourAccount,
              subTitle:
                  AppText.fillInformation,
            ),

            SizedBox(height: 32.h),

            /// password field=============================================================================
            CustomContainerBorderParent(
              child: Column(
                children: [
           // TextFormField(
           //   keyboardType: TextInputType.emailAddress,
           //   style: context.labelMedium,
           //   controller: emailController,
           //
           //   decoration: InputDecoration(
           //       prefixIcon: CustomSvgIcon(
           //         icon: AppAssets.email,
           //
           //       ),
           //     labelText: AppText.email
           //   ),
           //
           //   validator: (value) {
           //     if (value == null || value.isEmpty) {
           //       return "Email address is required";
           //     }
           //     if (!AppText.emailRegexp.hasMatch(value)) {
           //       return "Please enter a valid email address";
           //     }
           //     return null;
           //   },
           //
           //
           //
           // ),


                SizedBox(height: 4,),
                  CustomTextField(
                    keyboardType: TextInputType.emailAddress,
                    labelText: AppText.emailAddress,
                    prefixIcon: CustomSvgIcon(
                      icon: AppAssets.email,
                      height: 14.h,
                      width: 14.w,
                    ),
                    controller: emailController,

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
                  SizedBox(height: 2.h,),
                  CustomDivider(),
                  SizedBox(height: 2.h,),
                  CustomTextField(
                    labelText: AppText.password,
                    prefixIcon: CustomSvgIcon(
                      icon: AppAssets.pass,
                      height: 14.h,
                      width: 14.w,
                    ),
                    controller: passwordController,
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password is required";
                      }
                      if (!AppText.passRegexp.hasMatch(value)) {
                        return "Minimum 8 characters with upper & lower case letters";
                      }
                      return null;
                    },
                  ),
                ],
              ),
            ),

            SizedBox(height: 16.h),
/// forget password text=======================================================================
            GestureDetector(
              onTap: (){
                onBoardingController.nextStepLogin();
              },
              child: Text(
                AppText.forgotYourPassword,

                style: GoogleFonts.instrumentSans(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textBlack,
                  decoration: TextDecoration.underline, // underline active
                  decorationColor: AppColors.black, // underline color
                ),
              ),
            ),

            /// enable authentication===================================================================
            SizedBox(height: 164.h),

            /// custom button================================================================
            CustomButton(onTap: () {

              Get.toNamed(AppRoutes.mainNavScreen);



            }, title: AppText.login),
            SizedBox(height: 8.h),
          ],
        ),
      ),
    );
  }
}
