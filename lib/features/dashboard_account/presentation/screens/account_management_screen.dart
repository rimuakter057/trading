import 'package:flutter/material.dart';
import 'package:trading/features/copier/presentation/widgets/custom_appbar_copier.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';
import 'package:trading/share/widgets/custom_appbar/custom_appbar_container.dart';
import 'package:trading/share/widgets/custom_container/custom_container.dart';
import 'package:trading/share/widgets/custom_divider/custom_divider.dart';
import 'package:trading/share/widgets/custom_text_field/custom_text_field.dart';
import 'package:trading/share/widgets/custom_text_field_parent/custom_text_field_parent.dart';
import 'package:trading/utils/app_colors/app_colors.dart';
import 'package:trading/utils/app_text/app_strings.dart';
import 'package:trading/utils/extension/base_extension.dart';

import '../widgets/account_appbar_row_widget.dart' show AccountAppbarRowWidget;
import 'equity_protector_screen.dart';

class AccountManagementScreen extends StatelessWidget {
  AccountManagementScreen({super.key});

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   //   appBar: CustomAppBarCopier(title: AppText.accountManagement),

      body: Column(
        children: [
          CustomAppBarContainer(

            child: Padding(
              padding: ResponsiveHelper.all(16),
              child: Column(
                children: [
                  CustomAppbarWidget(
                    title: AppText.accountManagement,
                  ),
                  SizedBox(height: ResponsiveHelper.height(8)),
                  AccountAppbarRowWidget(
                  ),
                  SizedBox(height: ResponsiveHelper.height(12)),
                ],
              ),
            ),
          ),
          SizedBox(height: ResponsiveHelper.height(12)),

          CustomContainer(
            vertical: ResponsiveHelper.height(38),
            horizontal: ResponsiveHelper.height(38),
            borderColor: AppColors.boarderColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppText.accountSettings,
                  style: context.bodySmall.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: ResponsiveHelper.height(12)),
                CustomContainerBorderParent(
                  child: Column(
                    children: [
                      CustomTextField(
                        labelText: AppText.accountName,
                        controller: controller,
                        obscureText: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: ResponsiveHelper.height(24)),

          /// password field=============================================================================
          CustomContainer(
            vertical: ResponsiveHelper.padding(18),
            horizontal: ResponsiveHelper.padding(18),
            borderColor: AppColors.boarderColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppText.password,
                  style: context.bodySmall.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),

                SizedBox(height: ResponsiveHelper.height(12)),
                CustomContainerBorderParent(
                  child: Column(
                    children: [
                      CustomTextField(
                        labelText: AppText.oldPassword,
                        controller: controller,
                        obscureText: true,
                      ),
                      CustomDivider(),
                      CustomTextField(
                        labelText: AppText.newPassword,
                        controller: controller,
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Password is required";
                          }
                          if (!AppText.passRegexp.hasMatch(value)) {
                            return "Minimum 8 characters with upper & lower case letters";
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
                            return "Password is required";
                          }
                          if (!AppText.passRegexp.hasMatch(value)) {
                            return "Minimum 8 characters with upper & lower case letters";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: ResponsiveHelper.height(40)),

          ElevatedButton(onPressed: () {}, child: Text(AppText.saveSettings)),
        ],
      ),
    );
  }
}
