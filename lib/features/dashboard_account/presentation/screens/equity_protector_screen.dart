import 'package:flutter/material.dart';
import 'package:trading/features/dashboard_account/presentation/Widgets/notification_tile_widget.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';

import 'package:trading/share/widgets/custom_appbar/custom_appbar_container.dart';
import 'package:trading/share/widgets/custom_divider/custom_divider.dart';
import 'package:trading/share/widgets/custom_image/custom_image.dart';
import 'package:trading/share/widgets/custom_text_field_parent/custom_text_field_parent.dart';
import 'package:trading/utils/app_assets/app_assets.dart';
import 'package:trading/utils/app_colors/app_colors.dart';
import 'package:trading/utils/app_text/app_strings.dart';
import 'package:trading/utils/extension/base_extension.dart';
import 'package:get/get.dart';

import '../widgets/account_appbar_row_widget.dart' show AccountAppbarRowWidget;


class EquityProtectorScreen extends StatefulWidget {
  const EquityProtectorScreen({super.key});

  @override
  State<EquityProtectorScreen> createState() => _EquityProtectorScreenState();
}

class _EquityProtectorScreenState extends State<EquityProtectorScreen> {
  bool isSwitched = true;

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: Column(
        children: [
          CustomAppBarContainer(
            child: Column(
              children: [
                CustomAppbarWidget(
                  title: AppText.equityProtector,
                ),
                SizedBox(height: ResponsiveHelper.height(8)),
                AccountAppbarRowWidget(
                ),
                SizedBox(height: ResponsiveHelper.height(12)),
              ],
            ),
          ),
          SizedBox(height: ResponsiveHelper.height(12)),

          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: ResponsiveHelper.width(12)),
                child: Column(
                  children: [
                    // === Equity Protection Section ===
                    _buildNotificationSection(
                      title: AppText.equityProtection,
                      tiles: [
                        NotificationTileWidget(
                          leadingIcon: AppAssets.notificationPrimary,
                          title: AppText.accountManagement,
                          subtitle: AppText.descriptionWillGoHere,
                          showSwitch: true,
                          switchValue: isSwitched,
                          onChanged: (value) => setState(() => isSwitched = value),
                        ),
                        NotificationTileWidget(
                          leadingIcon: AppAssets.notificationPrimary,
                          title: AppText.accountManagement,
                          subtitle: AppText.descriptionWillGoHere,
                          showSwitch: true,
                          switchValue: isSwitched,
                          onChanged: (value) => setState(() => isSwitched = value),
                        ),
                        NotificationTileWidget(
                          leadingIcon: AppAssets.notificationPrimary,
                          title: AppText.accountManagement,
                          subtitle: AppText.descriptionWillGoHere,
                          showSwitch: true,
                          switchValue: isSwitched,
                          onChanged: (value) => setState(() => isSwitched = value),
                        ),
                      ],
                    ),

                    SizedBox(height: ResponsiveHelper.height(16)),

                    // === Stop Loss Protection Section ===
                    _buildNotificationSection(
                      title: AppText.stopLoseProtection,
                      tiles: [
                        NotificationTileWidget(
                          leadingIcon: AppAssets.notificationPrimary,
                          title: AppText.accountManagement,
                          subtitle: AppText.descriptionWillGoHere,
                          showSwitch: true,
                          switchValue: isSwitched,
                          onChanged: (value) => setState(() => isSwitched = value),
                        ),
                        NotificationTileWidget(
                          leadingIcon: AppAssets.notificationPrimary,
                          title: AppText.accountManagement,
                          subtitle: AppText.descriptionWillGoHere,
                          showSwitch: true,
                          switchValue: isSwitched,
                          onChanged: (value) => setState(() => isSwitched = value),
                        ),
                        NotificationTileWidget(
                          leadingIcon: AppAssets.notificationPrimary,
                          title: AppText.accountManagement,
                          subtitle: AppText.descriptionWillGoHere,
                          showSwitch: true,
                          switchValue: isSwitched,
                          onChanged: (value) => setState(() => isSwitched = value),
                        ),
                      ],
                    ),

                    SizedBox(height: ResponsiveHelper.height(16)),

                    // === Take Profit Protection Section ===
                    _buildNotificationSection(
                      title: AppText.takeProfitProtection,
                      tiles: [
                        NotificationTileWidget(
                          leadingIcon: AppAssets.notificationPrimary,
                          title: "Another Tile",
                          subtitle: "Trailing as text",
                          showSwitch: false,
                          trailingText: "0.0%",
                        ),
                        NotificationTileWidget(
                          leadingIcon: AppAssets.notificationPrimary,
                          title: "Another Tile",
                          subtitle: "Trailing as text",
                          showSwitch: false,
                          trailingText: "0.0%",
                        ),
                        NotificationTileWidget(
                          leadingIcon: AppAssets.notificationPrimary,
                          title: "Another Tile",
                          subtitle: "Trailing as text",
                          showSwitch: false,
                          trailingText: "0.0%",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // === Helper method for building sections ===
  Widget _buildNotificationSection({
    required String title,
    required List<Widget> tiles,
  }) {
    return CustomContainerBorderParent(
      borderColor: AppColors.boarderColor,
      child: Padding(
        padding: EdgeInsets.all(ResponsiveHelper.width(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: context.bodySmall.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.greySwitch,
                fontSize: ResponsiveHelper.fontSize(14),
              ),
            ),
            SizedBox(height: ResponsiveHelper.height(8)),
            ...tiles
                .map((tile) => Column(
              children: [
                tile,
                CustomDivider(),
              ],
            ))
                .toList(),
          ],
        ),
      ),
    );
  }
}

class CustomAppbarWidget extends StatelessWidget {
  const CustomAppbarWidget({super.key, required this.title, this.action});

  final String title;
  final Widget? action;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Get.back();
          },
          child: CustomImage(imageSrc: AppAssets.arrowBack),
        ),
        Text(
          title,
          style: context.bodyLarge.copyWith(
            fontSize: ResponsiveHelper.fontSize(18),
          ),
        ),
        action ?? SizedBox(),
      ],
    );
  }
}
