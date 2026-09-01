import 'package:flutter/material.dart';
import 'package:trading/features/auth/controllers/onboarding_controller.dart';
import 'package:trading/utils/enum/enum.dart';
import 'package:get/get.dart';
import 'screen_widgets/create_account_widget.dart';
import 'screen_widgets/verify_account_widget.dart';
import 'screen_widgets/create_password_widget.dart';
import 'screen_widgets/choose_plan_widget.dart';


class AuthFlowBottomSheetCreateAccount extends StatelessWidget {
  AuthFlowBottomSheetCreateAccount({super.key});

  final OnBoardingController controller = Get.find<OnBoardingController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _buildStep(controller.currentStepCreateAccount.value),
      ),
    );
  }

  Widget _buildStep(AuthStepCreateAccount step) {
    switch (step) {
      case AuthStepCreateAccount.createAccountWidget:
        return CreateAccountWidget();

      case AuthStepCreateAccount.verifyAccountWidget:
        return VerifyAccountWidget();

      case AuthStepCreateAccount.createPasswordWidget:
        return CreatePasswordWidget();

      case AuthStepCreateAccount.choosePlanWidget:
        return ChoosePlanWidget();
    }
  }
}
