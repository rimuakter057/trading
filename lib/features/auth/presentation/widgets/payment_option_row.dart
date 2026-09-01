import 'package:flutter/material.dart';
import 'package:trading/features/auth/controllers/onboarding_controller.dart';
import 'package:trading/share/widgets/custom_container/custom_container.dart';
import 'package:trading/share/widgets/custom_text/custom_text.dart';
import 'package:trading/utils/app_colors/app_colors.dart';
import 'package:trading/utils/app_text/app_strings.dart';
import 'package:get/get.dart';

class PaymentOptionRow extends StatelessWidget {
   PaymentOptionRow({super.key});
  final OnBoardingController onBoardingController =
  Get.find<OnBoardingController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Monthly Radio
        Obx((){
          return  Row(
            children: [
              Radio<String>(
                value: "monthly",
                groupValue:onBoardingController .selectedOption.value,
                onChanged: (value) {
                  onBoardingController.selectedOption.value = value!;
                },
                fillColor: MaterialStateProperty.resolveWith<Color>((states) {
                  return states.contains(MaterialState.selected)
                      ? AppColors.primary
                      : AppColors.primary;
                }),
              ),
              Text(AppText.monthly, style: TextStyle(fontSize: 16)),
            ],
          );
        }),


        // Annually Radio
        Obx((){
          return   Row(
            children: [
              Radio<String>(
                value: "annually",
                groupValue:onBoardingController .selectedOption.value,
                onChanged: (value) {
                  onBoardingController.selectedOption.value = value!;
                },
                fillColor: MaterialStateProperty.resolveWith<Color>((states) {
                  return states.contains(MaterialState.selected)
                      ? AppColors.primary
                      : AppColors.primary;
                }),
              ),
              Text(AppText.annually, style: TextStyle(fontSize: 16)),
            ],
          );
        }),



        // Saving Container

        CustomContainer(

          backgroundColor: AppColors.yellowShade,
            child: CustomText(text: "${AppText.save} 20%",
            color: AppColors.brown,
            )
        ),
      ],
    );
  }
}
