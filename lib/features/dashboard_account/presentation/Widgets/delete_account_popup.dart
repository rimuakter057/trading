import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:trading/helper/responsive_helper/responsive_helper.dart';
import 'package:trading/utils/app_colors/app_colors.dart';
import 'package:trading/utils/app_text/app_strings.dart';
import 'package:trading/utils/extension/base_extension.dart';

void showDeleteAccountDialog(BuildContext context,{required bool isDelete}) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Dialog(
          backgroundColor: AppColors.deletePopBgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              ResponsiveHelper.borderRadius(30),
            ),
          ),
          child: Padding(
            padding: ResponsiveHelper.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(

                    isDelete?'Delete this account?':AppText.riskSettings,

                    style: context.bodyMedium),
                SizedBox(height: ResponsiveHelper.height(8)),
                Text(
                isDelete?  'A message should be a short,complete sentence.'
                    :"Based on the options you have selected, we recommend that you trade with Balance Multiplier with a risk setting of 100%. Simply click below to apply these settings.",
                  textAlign: TextAlign.center,
                  style: context.bodySmall.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: ResponsiveHelper.height(24)),
                // Delete Button
                SizedBox(
                  width: double.infinity,
                  height: ResponsiveHelper.height(55),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:isDelete? AppColors.red:AppColors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          ResponsiveHelper.borderRadius(30),
                        ),
                      ),
                      elevation: 0,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      isDelete?AppText.deleteAccount:AppText.apply,
                      style: context.bodyMedium.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: ResponsiveHelper.height(12)),
                // Cancel Button
                SizedBox(
                  width: double.infinity,
                  height: ResponsiveHelper.height(55),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          ResponsiveHelper.borderRadius(30),
                        ),
                      ),
                      elevation: 0,
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      AppText.cancel,
                      style: context.bodyMedium.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
