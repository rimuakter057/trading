import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';
import 'package:trading/utils/app_assets/app_assets.dart';
import 'package:get/get.dart'; // GetX
import 'package:trading/share/widgets/custom_text/custom_text.dart';
import 'package:trading/utils/app_colors/app_colors.dart';
import 'package:trading/utils/app_text/app_strings.dart';
import '../../../auth/presentation/screens/auth_flow_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 3), () {
        Get.to(() => AuthFlowScreen());
      });
    });

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: ResponsiveHelper.width(16)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: ResponsiveHelper.height(140),
                child: SvgPicture.asset(AppAssets.logoIcon, fit: BoxFit.contain),
              ),
              SizedBox(height: ResponsiveHelper.height(8)),
              CustomText(
                text: AppText.empowerAnalyzeConnect,
                color: AppColors.subPrimary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
