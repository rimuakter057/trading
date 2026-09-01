import 'package:flutter/material.dart';
import 'package:trading/features/common/presentation/widgets/status_outline_container.dart';
import 'package:trading/features/common/presentation/widgets/title_text_widget.dart';
import 'package:trading/features/copier/presentation/widgets/custom_appbar_copier.dart';
import 'package:trading/features/copier/presentation/widgets/map_symbol_sheet_widget.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';
import 'package:trading/share/widgets/custom_container/custom_container.dart';
import 'package:trading/share/widgets/custom_divider/custom_divider.dart';
import 'package:trading/share/widgets/custom_image/custom_image.dart';
import 'package:trading/share/widgets/custom_text_field/custom_text_field.dart';
import 'package:trading/share/widgets/custom_text_field_parent/custom_text_field_parent.dart';
import 'package:trading/utils/app_assets/app_assets.dart';
import 'package:trading/utils/app_colors/app_colors.dart';
import 'package:trading/utils/app_text/app_strings.dart';
import 'package:trading/utils/extension/base_extension.dart';
import 'package:get/get.dart';


class MapSymbolScreen extends StatelessWidget {
  MapSymbolScreen({super.key});
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Widget gap = SizedBox(height: ResponsiveHelper.height(18));
    final Widget gapSmall = SizedBox(height: ResponsiveHelper.height(12));
    return Scaffold(
      appBar: CustomAppBarCopier(title: AppText.mapSymbols),

      body: Padding(
        padding: ResponsiveHelper.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            gap,
            TitleTextWidget(title: AppText.addMapSymbol),
            gapSmall,
            ///heading input===========================================
            CustomContainer(
              borderColor: AppColors.boarderColor,
              child: Column(
                children: [
                  ///input field===========================================================
                  CustomContainerBorderParent(
                    child: Column(
                      children: [
                        CustomTextField(
                          labelText: AppText.masterTradeRisk,
                          suffixWidget: CustomImage(
                            imageSrc: AppAssets.dropdown,
                          ),
                          controller: controller,
                        ),
                        CustomDivider(),
                        CustomTextField(
                          labelText: AppText.slaveTradeRisk,
                          controller: controller,
                          readOnly: true,
                          suffixWidget: CustomImage(imageSrc: AppAssets.dropdown),
                          onTap: () {
                            Get.bottomSheet(
                              MapSymbolSheetWidget(
                                // onSelect: (value) {
                                //   controller.text = value;
                                // },
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  gap,

                  ElevatedButton(
                    onPressed: () {},
                    child: Text(AppText.createMapping),
                  ),
                ],
              ),
            ),
            gap,
            TitleTextWidget(title: AppText.symbolsMapped),
            gapSmall,
            ///symbol map card=========================================
            CustomContainer(
              borderColor: AppColors.boarderColor,
              child: Padding(
                padding: ResponsiveHelper.all(8.0),
                child: Column(
                  children: [
                    ///label text===========================
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppText.label,
                          style: context.bodySmall.copyWith(
                            color: AppColors.textBlack,
                            fontWeight: FontWeight.w600,
                          ),
                        ),

                        Row(
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: ResponsiveHelper.height(16),
                                  width: ResponsiveHelper.width(16),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: AppColors.blue,
                                      width: 1,
                                    ),
                                    color: AppColors.blueShade,
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                ),
                                SizedBox(width: ResponsiveHelper.width(8)),

                                Text(
                                  AppText.from,
                                  style: context.bodySmall.copyWith(
                                    color: AppColors.textBlack,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: ResponsiveHelper.width(12)),
                            Row(
                              children: [
                                Container(
                                  height: ResponsiveHelper.height(16),
                                  width: ResponsiveHelper.width(16),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: AppColors.primary,
                                      width: 1,
                                    ),
                                    color: AppColors.primaryShade100,
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                ),
                                SizedBox(width: ResponsiveHelper.width(8)),

                                Text(
                                  AppText.to,
                                  style: context.bodySmall.copyWith(
                                    color: AppColors.textBlack,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: ResponsiveHelper.height(8),),
                    Column(
                      children: List.generate(3, (index) {
                        return Padding(
                          padding: EdgeInsets.only(
                            bottom: ResponsiveHelper.height(12),
                          ),
                          child: CustomContainer(
                            backgroundColor: AppColors.backgroundColor,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        StatusOutlineContainer(
                                          verticalPadding: 8,
                                          horizontalPadding: 8,
                                          statusBgColor: AppColors.blueShade,
                                          statusBorderColor: AppColors.blue,
                                          status: "AUDUSD",
                                          statusTextColor: AppColors.blue,
                                        ),
                                        SizedBox(
                                          width: ResponsiveHelper.width(8),
                                        ),
                                        StatusOutlineContainer(
                                          verticalPadding: 8,
                                          horizontalPadding: 8,
                                          statusBgColor: AppColors.greenShade,
                                          statusBorderColor: AppColors.green,
                                          status: "AUDUSD",
                                          statusTextColor: AppColors.green,
                                        ),
                                      ],
                                    ),
                                    CustomImage(
                                      imageSrc: AppAssets.deleteProfile,
                                      height: ResponsiveHelper.iconSize(28),
                                      width: ResponsiveHelper.iconSize(28),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
