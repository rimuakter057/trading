import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trading/features/auth/controllers/onboarding_controller.dart';
import 'package:trading/features/auth/presentation/widgets/action_text_widget.dart';
import 'package:trading/features/auth/presentation/widgets/otp_field_widget.dart';
import 'package:trading/share/widgets/custom_button/custom_button.dart';
import 'package:trading/utils/app_colors/app_colors.dart';
import 'package:trading/utils/app_text/app_strings.dart';
import 'package:get/get.dart';
import '../onboarding_heading_widget.dart';

class VerifyOtpWidget extends StatelessWidget {
  VerifyOtpWidget({super.key});
  final OnBoardingController onBoardingController =
      Get.find<OnBoardingController>();
  final TextEditingController controller = TextEditingController();

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
              title: AppText.enterVerificationCode,
              subTitle: AppText.enterSixDigitCode,
            ),

            SizedBox(height: 32.h),

            ///otp field
            OtpFieldWidget(
              controller: controller,
              onCompleted: (value) {
                debugPrint("OTP Completed: $value");
              },
            ),

            SizedBox(height: 8.h),

            ActionTextWidget(
              prefixText: AppText.haventReceivedCode,
              actionText: AppText.sendAgain,
              prefixColor: AppColors.subPrimary,
              actionColor: AppColors.subPrimary,

              onActionTapped: () {},
            ),
            SizedBox(height: 168.h),

            /// custom button================================================================
            CustomButton(
              onTap: () {
                onBoardingController.nextStepLogin();
              },

              title: AppText.verifyCode,
            ),
            SizedBox(height: 8.h),
          ],
        ),
      ),
    );
  }
}
