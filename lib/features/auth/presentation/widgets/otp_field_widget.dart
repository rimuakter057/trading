
import 'package:flutter/material.dart';
import 'package:trading/utils/app_colors/app_colors.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpFieldWidget extends StatelessWidget {
  final int length;
  final ValueChanged<String>? onCompleted;
  final TextEditingController? controller;
  const OtpFieldWidget({
    super.key,
    this.length = 6,
    this.onCompleted,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: length,
      keyboardType: TextInputType.number,
      animationType: AnimationType.fade,
      enableActiveFill: true,

      textStyle: const TextStyle(
        color: Colors.grey,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),

      cursorColor: Colors.black,

      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,       // box বা underline
        borderRadius: BorderRadius.circular(8),
        fieldHeight: 50,
        fieldWidth: 50,
        activeColor: AppColors.black,          // focused field border
        selectedColor: AppColors.boarderTextField,         // cursor field border
        inactiveColor: AppColors.boarderTextField,         // unfocused field border
        activeFillColor: AppColors.white,      // background
        selectedFillColor: AppColors.white,
        inactiveFillColor: AppColors.white,
        borderWidth: 1
      ),

      onChanged: (value) {},
      controller: controller,
      onCompleted: (value) {
        onCompleted?.call(value);
      },
    );
  }
}
