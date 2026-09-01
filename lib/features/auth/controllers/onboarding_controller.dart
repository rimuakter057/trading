import 'package:trading/utils/enum/enum.dart';
import 'package:get/get.dart';
import 'dart:async';


class OnBoardingController extends GetxController {


  var selectedOption = "monthly".obs;

  /// indicator section=========================================================================
  final RxInt activeIndex = 0.obs;

  final int totalIndicators = 5; // 5 ta indicator

  Timer? _timer;

  @override
  void onInit() {
    super.onInit();

    _timer = Timer.periodic(
      const Duration(seconds: 2),
          (timer) {
        activeIndex.value =
            (activeIndex.value + 1) % totalIndicators;
      },
    );
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }


  ///screen navigate Create copier==============================



  final currentStepCreateAccount = AuthStepCreateAccount.createAccountWidget.obs;

  void nextStepCreateAccount() {
    switch (currentStepCreateAccount.value) {
      case AuthStepCreateAccount.createAccountWidget:
        currentStepCreateAccount.value = AuthStepCreateAccount.verifyAccountWidget;
        break;
      case AuthStepCreateAccount.verifyAccountWidget:
        currentStepCreateAccount.value = AuthStepCreateAccount.createPasswordWidget;
        break;
      case AuthStepCreateAccount.createPasswordWidget:
        currentStepCreateAccount.value = AuthStepCreateAccount.choosePlanWidget;
        break;
      case AuthStepCreateAccount.choosePlanWidget:
        Get.back(); // flow finished
        break;
    }
  }

  /// 🔹 Reset flow to first step
  void resetFlowCreateAccount() {
    currentStepCreateAccount.value = AuthStepCreateAccount.createAccountWidget;
  }












  ///screen navigate login==============================



  final currentStepLogIn = AuthStepLogin.logInWidget.obs;

  void nextStepLogin() {
    switch (currentStepLogIn.value) {
      case AuthStepLogin.logInWidget:
        currentStepLogIn.value = AuthStepLogin.passwordRecoveryWidget;
        break;
      case AuthStepLogin.passwordRecoveryWidget:
        currentStepLogIn.value = AuthStepLogin.verifyOtpWidget;
        break;
      case AuthStepLogin.verifyOtpWidget:
        currentStepLogIn.value = AuthStepLogin.resetPasswordWidget;
        break;
      case AuthStepLogin.resetPasswordWidget:
        Get.back(); // flow finished
        break;
    }
  }

  /// 🔹 Reset flow to first step
  void resetFlowLogin() {
    currentStepLogIn.value = AuthStepLogin.logInWidget;
  }






}
