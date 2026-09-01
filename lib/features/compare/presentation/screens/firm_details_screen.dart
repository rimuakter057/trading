import 'package:flutter/material.dart';
import 'package:trading/features/copier/presentation/widgets/custom_appbar_copier.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';
import 'package:trading/share/widgets/custom_container/custom_container.dart';
import 'package:trading/share/widgets/custom_divider/custom_divider.dart';
import 'package:trading/utils/app_colors/app_colors.dart';
import 'package:trading/utils/app_text/app_strings.dart';
import 'package:trading/utils/extension/base_extension.dart';

class FirmDetailsScreen extends StatelessWidget {
  const FirmDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:CustomAppBarCopier(title: AppText.firmDetails),
      body: Padding(
        padding:  ResponsiveHelper.symmetric(horizontal: 8.0),
        child: Column(
          children: [

            CustomContainer(
              borderColor: AppColors.boarderColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppText.overview,
                    style: context.bodySmall.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: ResponsiveHelper.height(8),),
                  CustomContainer(
                    backgroundColor: AppColors.backgroundColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                "Breakout v2",
                                style: context.bodySmall.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "Liquidity Provider",
                                style: context.bodySmall.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                        CustomDivider(thickness: 1.2,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                "Breakout v2",
                                style: context.bodySmall.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "Apply Pay, Credit /Debit Card, Crypto,GooglePay, Neteller, Paypal, Skrill",
                                maxLines: 5,
                                overflow: TextOverflow.ellipsis,
                                style: context.bodySmall.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: ResponsiveHelper.height(24),),
          CustomContainer(
            borderColor: AppColors.boarderColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Leverage",
                  style: context.bodySmall.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: ResponsiveHelper.height(8),),
                CustomContainer(
                backgroundColor: AppColors.backgroundColor,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Breakout v2",
                      style: context.bodySmall.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(height: ResponsiveHelper.height(16)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Column(
                          children: [
                            Text(
                              AppText.instant,
                              style: context.bodySmall.copyWith(
                                fontSize: ResponsiveHelper.fontSize(12),
                              ),
                            ),
                            SizedBox(height: ResponsiveHelper.height(4)),
                            Text(
                              "\$1333",
                              style: context.bodySmall.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: ResponsiveHelper.width(24)),
                        Column(
                          children: [
                            Text(
                              "1-Steps",
                              style: context.bodySmall.copyWith(
                                fontSize: ResponsiveHelper.fontSize(12),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: ResponsiveHelper.height(4)),
                            Text(
                              "+2.1%",
                              style: context.bodySmall.copyWith(
                                fontWeight: FontWeight.w700,

                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: ResponsiveHelper.width(24)),
                        Column(
                          children: [
                            Text(
                              "2-Steps",
                              style: context.bodySmall.copyWith(
                                fontSize: ResponsiveHelper.fontSize(12),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: ResponsiveHelper.height(4)),
                            Text(
                              "\$1333",
                              style: context.bodySmall.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: ResponsiveHelper.width(24)),
                        Column(
                          children: [
                            Text(
                              "3-Steps",
                              style: context.bodySmall.copyWith(
                                fontSize: ResponsiveHelper.fontSize(12),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: ResponsiveHelper.height(4)),
                            Text(
                              "\$1333",
                              style: context.bodySmall.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                  ],
                ),
                      ),
              ],
            ),
          ),

          ],
        ),
      ),
    );
  }
}
