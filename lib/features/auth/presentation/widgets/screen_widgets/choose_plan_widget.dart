import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trading/features/auth/controllers/onboarding_controller.dart';
import 'package:trading/features/auth/presentation/widgets/action_text_widget.dart';
import 'package:trading/features/auth/presentation/widgets/payment_option_row.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';
import 'package:trading/share/widgets/custom_button/custom_button.dart';
import 'package:trading/share/widgets/custom_container/custom_container.dart';
import 'package:trading/share/widgets/custom_divider/custom_divider.dart';
import 'package:trading/share/widgets/custom_text/custom_text.dart';
import 'package:trading/utils/app_colors/app_colors.dart';
import 'package:trading/utils/app_text/app_strings.dart';
import 'package:get/get.dart';
import '../onboarding_heading_widget.dart';

class ChoosePlanWidget extends StatelessWidget {
  ChoosePlanWidget({super.key});
  final OnBoardingController onBoardingController =
      Get.find<OnBoardingController>();
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.9,
      padding: EdgeInsets.symmetric(horizontal: ResponsiveHelper.width(24)),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(ResponsiveHelper.borderRadius(8))),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///heading sections==================================
            OnboardingHeadingWidget(
              maxLine: 3,
              title: AppText.choosePlan,
              subTitle:
                  "Start your 14-day free trial. Your card will be charged automatically after the trial ends. Cancel anytime.",
            ),

            /// payment option===============================================================================
            PaymentOptionRow(),

            SizedBox(height: ResponsiveHelper.spacing(16)),

            /// custom container beginner===================================
            _buildBeginnerPopularContainer(
              level: 'Starter',
              levelBox: AppText.beginner,
              totalAmount: "\$219",
              monthAmount: "\$18.25/${AppText.month}",
              text:
                  "2 Copier Accounts (Master + Slave)\nTC Analyzer (Web + Mobile)\nSave up to 30% vs standalone\nAdd extra accounts for \$8/month each.",
            ),
            SizedBox(height:ResponsiveHelper.height(24)),

            /// custom container beginner===================================
            _buildBeginnerPopularContainer(
              borderColor: AppColors.primary,
              bgColor: AppColors.primaryShade100,
              boxColor: AppColors.primary,
              boxTextColor: AppColors.white,
              level: 'Pro',
              levelBox: AppText.popular,
              totalAmount: "\$399",
              monthAmount: "\$33.25/${AppText.month}",
              text:
                  "5 Copier Accounts\nTC Analyzer (included free after 6 months)\nPriority Support\nAdd extra accounts for \$6/month each.",
            ),

            SizedBox(height: ResponsiveHelper.height(16)),

            /// text section==============================================================
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ActionTextWidget(
                    prefixText: AppText.tradersConnect,
                    actionText: AppText.elite,
                    actionColor: AppColors.subPrimary,
                    onActionTapped: () {},
                  ),
                ),
                _buildSmallContainer(title: AppText.bestValue),
              ],
            ),

            /// custom button================================================================
            CustomButton(
              onTap: () {
                onBoardingController.nextStepCreateAccount();
              },
              title: AppText.start14Day,
            ),
            SizedBox(height: ResponsiveHelper.height(8)),
          ],
        ),
      ),
    );
  }

  CustomContainer _buildBeginnerPopularContainer({
    required String level,
    required String levelBox,
    required String totalAmount,
    required String monthAmount,
    required String text,
    Color? boxTextColor, // default value
    Color? bgColor,
    Color? boxColor,
    Color? borderColor,
  }) {
    return CustomContainer(
      borderColor: borderColor ?? AppColors.white,
      backgroundColor: bgColor ?? AppColors.white,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            /// text section==============================================================
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: ActionTextWidget(
                    prefixColor: AppColors.subTitle,
                    prefixText: AppText.tradersConnect,
                    actionColor: AppColors.subTitle,
                    actionText: level,
                    onActionTapped: () {},
                  ),
                ),
                _buildSmallContainer(
                  title: levelBox,
                  bgColorSm: boxColor ?? Color(0xFFF7F9FA),
                  textColor: boxTextColor ?? AppColors.subPrimary,
                ),
              ],
            ),

            /// $ per year text section=================================================
            Row(
              children: [
                CustomText(
                  text: totalAmount,
                  color: AppColors.textBlack,
                  fontSize: ResponsiveHelper.fontSize(36)
                ),
                SizedBox(width: ResponsiveHelper.width(16)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(text: AppText.parYear),
                    CustomText(text: monthAmount, fontWeight: FontWeight.w700),
                  ],
                ),
              ],
            ),
            SizedBox(height: ResponsiveHelper.height(4)),
            CustomDivider(color: AppColors.dividerColor),
            SizedBox(height: ResponsiveHelper.height(4)),

            /// column text section==========================================
            CustomText(
              fontSize: ResponsiveHelper.fontSize(12),
              color: AppColors.subPrimary,
              text: text,
            ),

            SizedBox(height: ResponsiveHelper.height(16)),
          ],
        ),
      ),
    );
  }

  ///small container section=============================================================
  CustomContainer _buildSmallContainer({
    required String title,
    Color? bgColorSm,
    Color? textColor,
  }) {
    return CustomContainer(
      backgroundColor: bgColorSm ?? Color(0xFFF7F9FA),
      child: CustomText(
        text: title,
        color: textColor ?? AppColors.subPrimary,
        fontSize: ResponsiveHelper.fontSize(14)
      ),
    );
  }
}
