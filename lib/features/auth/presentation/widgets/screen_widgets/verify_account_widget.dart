import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trading/features/auth/controllers/onboarding_controller.dart';
import 'package:trading/features/auth/presentation/widgets/otp_field_widget.dart';
import 'package:trading/share/widgets/custom_button/custom_button.dart';
import 'package:trading/utils/app_colors/app_colors.dart';
import 'package:trading/utils/app_text/app_strings.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../onboarding_heading_widget.dart';


class VerifyAccountWidget extends StatelessWidget {
  VerifyAccountWidget({
    super.key,

  });
  final OnBoardingController onBoardingController =
  Get.find<OnBoardingController>();
  final TextEditingController controller =TextEditingController();


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
            OnboardingHeadingWidget(title: AppText.verifyYourIdentity,
              subTitle: AppText.enterSixDigitCode,),

            SizedBox(height: 32.h,),

            ///otp field========================================================================
            OtpFieldWidget(

              controller: controller,
              onCompleted: (value) {
                debugPrint("OTP Completed: $value");
              },
            ),



            SizedBox(height: 8.h,),

            RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                style: GoogleFonts.instrumentSans(
                  color: AppColors.subTitle,
                  fontSize: 14.sp,
                ),
                children: [
                  const TextSpan(text: AppText.haventReceivedCode),

                  ///privacy policy===================================================
                  _buildTextSpanTermsPrivacy(
                    title: AppText.sendAgain,
                    onTap: () {},
                  ),
                  const TextSpan(text: AppText.or),

                  /// terms condition=======================================================
                  _buildTextSpanTermsPrivacy(
                    title: AppText.changeEmailAddress,
                    onTap: () {},
                  ),
                ],
              ),
            ),
            SizedBox(height: 148.h,),
            /// custom button================================================================
            CustomButton(onTap: (){
              onBoardingController.nextStepCreateAccount();
            },

              title: AppText.verifyEmail,
            ),
            SizedBox(height: 8.h,),



          ],
        ),
      ),
    );
  }
}



/// build text span privacy terms ==============================
TextSpan _buildTextSpanTermsPrivacy({
  required String title,
  required VoidCallback onTap,
}) {
  return TextSpan(
    text: title,
    style: GoogleFonts.instrumentSans(
      color: AppColors.subPrimary,
      decoration: TextDecoration.underline,
      decorationColor: AppColors.subPrimary,
      decorationThickness: 2,
      fontWeight: FontWeight.bold,
    ),
    recognizer: TapGestureRecognizer()..onTap = onTap,
  );
}



