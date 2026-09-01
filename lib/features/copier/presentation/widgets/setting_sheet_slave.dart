import 'package:flutter/material.dart';
import 'package:trading/features/dashboard_account/presentation/widgets/account_title.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';
import 'package:trading/share/widgets/custom_container/custom_container.dart';
import 'package:trading/utils/app_colors/app_colors.dart';
import 'package:trading/utils/app_text/app_strings.dart';
import 'package:trading/utils/extension/base_extension.dart';



class SettingSheetSlaveWidget extends StatelessWidget {
  const SettingSheetSlaveWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ResponsiveHelper.screenHeight * 0.85,
      padding: EdgeInsets.all(ResponsiveHelper.padding(16)),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(ResponsiveHelper.borderRadius(20)),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              AppText.copyFromAccount,
              style: context.bodyLarge.copyWith(
                fontSize: ResponsiveHelper.fontSize(18),
              ),
            ),

            SizedBox(height: ResponsiveHelper.height(4)),

            // Subtitle
            Text(
              AppText.showingListOfAllAccounts,
              style: context.bodySmall.copyWith(
                fontSize: ResponsiveHelper.fontSize(14),
              ),
            ),

            SizedBox(height: ResponsiveHelper.height(12)),

            Column(

              children: List.generate(5,
                  (index){

                return  Padding(
                  padding:  EdgeInsets.only(bottom:ResponsiveHelper.height(8)),
                  child: CustomContainer(
                    backgroundColor: AppColors.primaryShade100,
                    borderColor: AppColors.primary,
                    child: AccountTile(
                      id: "MT5-104392",
                      broker: "IC Markets",
                      amount: "\$1,624",
                      status: "active",
                      statusTextColor: AppColors.primary,
                      statusBgColor: AppColors.primaryShade100,
                      statusBorderColor:
                      AppColors.primary, // statusColor: Colors.orange
                    ),
                  ),
                );

                  }
              )
            ),

            SizedBox(height: ResponsiveHelper.height(24)),
            ElevatedButton(onPressed: (){},
                child: Text(AppText.addAccount)),
          ],
        ),
      ),
    );
  }
}

