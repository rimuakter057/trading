import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trading/features/auth/controllers/onboarding_controller.dart';
import 'package:trading/features/auth/presentation/widgets/action_text_widget.dart';
import 'package:trading/share/widgets/custom_button/custom_button.dart';
import 'package:trading/share/widgets/custom_divider/custom_divider.dart';
import 'package:trading/share/widgets/custom_svg_icon/custom_svg_icon.dart';
import 'package:trading/share/widgets/custom_text/custom_text.dart';
import 'package:trading/share/widgets/custom_text_field/custom_text_field.dart';
import 'package:trading/share/widgets/custom_text_field_parent/custom_text_field_parent.dart';
import 'package:trading/utils/app_assets/app_assets.dart';
import 'package:trading/utils/app_colors/app_colors.dart';

import 'package:trading/utils/app_text/app_strings.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../onboarding_heading_widget.dart';

class CreatePasswordWidget extends StatefulWidget {
  const CreatePasswordWidget({super.key});

  @override
  State<CreatePasswordWidget> createState() => _CreatePasswordWidgetState();
}

class _CreatePasswordWidgetState extends State<CreatePasswordWidget> {
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
              title: AppText.createSecure,
              subTitle:AppText.protectAccount,
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
                        return "Email address is required";
                      }
                      if (!AppText.emailRegexp.hasMatch(value)) {
                        return "Please enter a valid email address";
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
                        return "Email address is required";
                      }
                      if (!AppText.emailRegexp.hasMatch(value)) {
                        return "Please enter a valid email address";
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

            SizedBox(height: 24.h),

            /// enable authentication===================================================================
            Row(
              children: [
                Checkbox(
                  side: BorderSide(color: AppColors.primary),
                  checkColor: AppColors.white,
                  activeColor: AppColors.primary,
                  focusColor: AppColors.primary,
                  value: isValue,
                  onChanged: (value) {
                    setState(() {
                      isValue = value ?? false;
                    });

                    if (value == true) {
                      _showFaceLockDialog(context);
                    }
                  },
                ),
                const Expanded(
                  child: CustomText(
                    maxLines: 2,
                    text: AppText.enableTwoFactor,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: AppColors.subTitle,
                  ),
                ),
              ],
            ),

            SizedBox(height: 64.h),

            /// custom button================================================================
            CustomButton(
              onTap: () {
                onBoardingController.nextStepCreateAccount();
              },

              title: AppText.continueButton,
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

///alert dialog

void _showFaceLockDialog(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (context) {
      return Padding(
        padding: EdgeInsets.all(16.w),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 48.w, vertical: 16.h),
          decoration: BoxDecoration(
            color: Color(0xFFF9F9F9),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 8,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 24.h),
              CustomSvgIcon(icon: AppAssets.face, height: 50.h, width: 50.w),
              SizedBox(height: 16.h),

              Text(
                AppText.useFace,
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textBlack,
                ),
              ),

              SizedBox(height: 4.h),

              Text(
                textAlign: TextAlign.center,
                maxLines: 2,
             AppText.wouldYouLike,
                style: GoogleFonts.poppins(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.subTitle,
                ),
              ),
              SizedBox(height: 16),

              CustomButton(
                height: 52.h,
                onTap: () {},
                title: AppText.yesEnable,
              ),

              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  AppText.notNow,
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textBlack,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
