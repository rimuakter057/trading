import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trading/features/auth/controllers/onboarding_controller.dart';
import 'package:trading/features/auth/presentation/widgets/action_text_widget.dart';
import 'package:trading/share/widgets/custom_button/custom_button.dart';
import 'package:trading/share/widgets/custom_divider/custom_divider.dart';
import 'package:trading/share/widgets/custom_text_field/custom_text_field.dart';
import 'package:trading/share/widgets/custom_text_field_parent/custom_text_field_parent.dart';
import 'package:trading/utils/app_colors/app_colors.dart';
import 'package:trading/utils/app_text/app_strings.dart';
import 'package:get/get.dart';
import '../onboarding_heading_widget.dart';

class ResetPasswordWidget extends StatefulWidget {
  const ResetPasswordWidget({super.key});

  @override
  State<ResetPasswordWidget> createState() => _ResetPasswordWidgetState();
}

class _ResetPasswordWidgetState extends State<ResetPasswordWidget> {
  final OnBoardingController onBoardingController =
      Get.find<OnBoardingController>();

  final TextEditingController controller = TextEditingController();

  bool isValue = false;

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
              title: AppText.createNewPassword,
              subTitle: AppText.resetPasswordHint,
            ),

            SizedBox(height: 32.h),

            /// password field=============================================================================
            CustomContainerBorderParent(
              child: Column(
                children: [
                  CustomTextField(
                    labelText: AppText.enterPass,
                    controller: controller,
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
                  CustomDivider(),
                  CustomTextField(
                    labelText: AppText.reEnterPass,
                    controller: controller,
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
            SizedBox(height: 36.h),

            ///container green =======================================================================
            _buildRowContainer(),

            SizedBox(height: 16.h),

            /// password type======================================================================
            ActionTextWidget(
              prefixText: AppText.passStrength,
              actionText: AppText.strong,
              onActionTapped: () {},
            ),

            SizedBox(height: 164.h),

            /// custom button================================================================
            CustomButton(
              onTap: () {
                onBoardingController.nextStepCreateAccount();
              },

              title: AppText.resetPassword,
            ),
            SizedBox(height: 8.h),
          ],
        ),
      ),
    );
  }

  /// build row container================================================================================
  Row _buildRowContainer() {
    return Row(
      children: [
        Expanded(
          child: Container(height: 5.h, color: AppColors.subPrimary),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: Container(height: 5.h, color: AppColors.subPrimary),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: Container(height: 5.h, color: AppColors.green),
        ),
      ],
    );
  }
}
