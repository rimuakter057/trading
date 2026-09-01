import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trading/features/auth/controllers/onboarding_controller.dart';
import 'package:trading/features/auth/presentation/widgets/action_text_widget.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';
import 'package:trading/share/widgets/custom_button/custom_button.dart';
import 'package:trading/share/widgets/custom_text_field/custom_text_field.dart';
import 'package:trading/share/widgets/custom_text_field_parent/custom_text_field_parent.dart';
import 'package:trading/utils/app_colors/app_colors.dart';
import 'package:trading/utils/app_text/app_strings.dart';
import 'package:get/get.dart';
import '../onboarding_heading_widget.dart';

class PasswordRecoveryWidget extends StatelessWidget {
  PasswordRecoveryWidget({super.key});
  final OnBoardingController onBoardingController =
      Get.find<OnBoardingController>();
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.9,
      padding: ResponsiveHelper.symmetric(horizontal: 24),
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
              title: AppText.passwordRecovery,
              subTitle:
                  AppText.passwordRecoveryDesc,
            ),

            SizedBox(height: ResponsiveHelper.spacing(32)),

            ///email field================================================
            CustomContainerBorderParent(
              child: CustomTextField(
                labelText: AppText.emailAddress,
                controller: controller,
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

            SizedBox(height: ResponsiveHelper.spacing(8)),
        ///contact support===================================================================
            ActionTextWidget(
              prefixText: AppText.forgotEmail,
              prefixColor: AppColors.black,
              actionText: AppText.contactSupport,
              isUnderline: true,
              fontWeight: FontWeight.w500,
              underlineColor: AppColors.black,
              actionColor: AppColors.black,
              onActionTapped: () {},

            ),

            SizedBox(height: ResponsiveHelper.spacing(172)),

            /// custom button================================================================
            CustomButton(
              onTap: () {
                onBoardingController.nextStepLogin();
              },

              title: AppText.requestPasswordLink,
            ),
            SizedBox(height:ResponsiveHelper.spacing(8)),
          ],
        ),
      ),
    );
  }
}
