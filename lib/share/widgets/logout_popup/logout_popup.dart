
import 'package:flutter/material.dart';
import 'package:trading/share/widgets/custom_text/custom_text.dart';

import 'package:trading/utils/app_colors/app_colors.dart' show AppColors;
import 'package:get/get.dart';

class LogoutDialog extends StatelessWidget {
  final VoidCallback onConfirm;

  const LogoutDialog({super.key, required this.onConfirm});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedScale(
        scale: 1.0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutBack,
        child: Container(
          width: 300,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.logout, size: 48, color: Colors.redAccent),
              const SizedBox(height: 12),
              const CustomText(
                text: "Log Out",
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 8),
              const CustomText(
                text: "Are you sure you want to log out?",
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    onPressed: () => Get.back(),
                    child: const CustomText(
                      text: "Cancel",
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.back(); // close dialog
                      onConfirm(); // run logout
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                    ),
                    child: const CustomText(
                      text: "Yes",
                      color: AppColors.black,
                      fontWeight: FontWeight.bold,
                    ), // const Text("Yes"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  static void showLogoutDialog() {
    Get.dialog(
      Material(
        color: Colors.black38, // for backdrop effect
        child: LogoutDialog(onConfirm: handleLogout),
      ),
      barrierDismissible: true,
      transitionCurve: Curves.easeInOutBack,
      transitionDuration: const Duration(milliseconds: 300),
    );
  }

  static void handleLogout() {
    // Add your logout logic here
    //  Get.offAllNamed(AppRoutes.signinScreen);
  }
}
