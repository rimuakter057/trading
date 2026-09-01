import 'package:flutter/material.dart';
import 'package:trading/features/auth/controllers/onboarding_controller.dart';
import 'package:trading/features/auth/presentation/widgets/screen_widgets/login_widget.dart';
import 'package:trading/features/auth/presentation/widgets/screen_widgets/password_recovery_widget.dart';
import 'package:trading/features/auth/presentation/widgets/screen_widgets/reset_password.dart';
import 'package:trading/features/auth/presentation/widgets/screen_widgets/verify_otp.dart';
import 'package:trading/utils/enum/enum.dart';
import 'package:get/get.dart';



class AuthFlowBottomSheetLogIn extends StatelessWidget {
  AuthFlowBottomSheetLogIn({super.key});

  final OnBoardingController controller = Get.find<OnBoardingController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _buildStep(controller.currentStepLogIn.value),
      ),
    );
  }

  Widget _buildStep(AuthStepLogin step) {
    switch (step) {
      case AuthStepLogin.logInWidget:
        return LoginWidget();

      case AuthStepLogin.passwordRecoveryWidget:
        return PasswordRecoveryWidget();

      case AuthStepLogin.verifyOtpWidget:
        return VerifyOtpWidget();

      case AuthStepLogin.resetPasswordWidget:
        return ResetPasswordWidget();
    }
  }
}
