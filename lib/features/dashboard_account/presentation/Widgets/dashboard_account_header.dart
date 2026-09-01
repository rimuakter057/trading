import 'package:flutter/material.dart';
import 'package:trading/core/routes/app_routes.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';
import 'package:trading/share/widgets/custom_appbar/custom_appbar_container.dart';
import 'package:trading/share/widgets/custom_image/custom_image.dart';
import 'package:trading/utils/app_assets/app_assets.dart';
import 'package:trading/utils/app_colors/app_colors.dart';
import 'package:trading/utils/app_text/app_strings.dart';
import 'package:trading/utils/extension/base_extension.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'account_appbar_row_widget.dart';

/// appbar header===============================================================

class DashboardAccountHeader extends StatelessWidget {
  const DashboardAccountHeader({super.key, required this.isDashboard});



  final bool isDashboard;
  @override
  Widget build(BuildContext context) {
    final double toolbarHeight = ResponsiveHelper.height(100);
    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: true,
      expandedHeight: ResponsiveHelper.height(136),
      toolbarHeight: toolbarHeight,
      backgroundColor: Colors.white,
      elevation: 0,
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          var top = constraints.biggest.height;

          bool isCollapsed =
              top <= (MediaQuery.of(context).padding.top + toolbarHeight);

          return FlexibleSpaceBar(
            centerTitle: true,
            titlePadding: EdgeInsets.zero,

            title: isCollapsed
                ? _buildSmallAppBar(context)
                : const SizedBox.shrink(),
            background: Padding(
              padding: EdgeInsets.only(
                left: ResponsiveHelper.width(16),
                right: ResponsiveHelper.width(16),
              ),
              child: isCollapsed
                  ? const SizedBox.shrink()
                  : _buildBigAppBar(context),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBigAppBar(BuildContext context) {
    return CustomAppBarContainer(
      child: Column(
        children: [
          Row(
            children: [
              CustomImage(imageSrc: AppAssets.logo),
              Spacer(),

              Text(isDashboard?AppText.dashboard:AppText.account, style: context.bodyMedium),

              Spacer(),

              CustomImage(imageSrc:isDashboard?AppAssets.notification:AppAssets.filter),
              SizedBox(width: ResponsiveHelper.width(16)),


              Builder(
                builder: (context) {
                  return GestureDetector(
                    onTap: () {
                      if (isDashboard) {
                        Scaffold.of(context).openDrawer();
                      } else {
                        Get.toNamed(AppRoutes.addAccountScreen);
                      }
                    },
                    child: CustomImage(
                      imageSrc: isDashboard ? AppAssets.menu : AppAssets.add,
                    ),
                  );
                },
              ),


            ],
          ),
          SizedBox(height: ResponsiveHelper.height(8)),
          AccountAppbarRowWidget(
              isDashboard:isDashboard
          ),
        ],
      ),
    );
  }

  Widget _buildSmallAppBar(BuildContext context) {
    return CustomAppBarContainer(
      child: Column(
        children: [
          Row(
            children: [
              Row(
                children: [
                  CustomImage(imageSrc: AppAssets.logo),

                  SizedBox(width: ResponsiveHelper.width(4)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppText.account,
                        style: context.titleSmall.copyWith(
                          fontWeight: FontWeight.w400,
                          color: AppColors.subPrimary,
                        ),
                      ),

                      SizedBox(
                        width: ResponsiveHelper.width(120),
                        child: Text(
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          AppText.mt4104392,
                          style: context.bodyLarge.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: ResponsiveHelper.width(4)),
                  CustomImage(imageSrc: AppAssets.dropdown),
                ],
              ),

              Spacer(),

              CustomImage(imageSrc:isDashboard?AppAssets.notification:AppAssets.filter),
              SizedBox(width: ResponsiveHelper.width(16)),

              Builder(
                builder: (context) {
                  return GestureDetector(
                    onTap: () {
                      if (isDashboard) {
                        Scaffold.of(context).openDrawer();
                      } else {
                        Get.toNamed(AppRoutes.addAccountScreen);
                      }
                    },
                    child: CustomImage(
                      imageSrc: isDashboard ? AppAssets.menu : AppAssets.add,
                    ),
                  );
                },
              ),

            ],
          ),
        ],
      ),
    );
  }
}