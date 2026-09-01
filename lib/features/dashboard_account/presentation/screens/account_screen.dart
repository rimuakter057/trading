import 'package:flutter/material.dart';
import 'package:trading/features/dashboard_account/presentation/Widgets/account_tab_widget.dart';
import 'package:trading/features/dashboard_account/presentation/Widgets/dashboard_account_header.dart';
import 'package:trading/features/dashboard_account/presentation/Widgets/performance_card.dart';
import 'package:trading/features/dashboard_account/presentation/Widgets/state_card.dart';

import 'package:trading/helper/responsive_helper/responsive_helper.dart';
import 'package:trading/share/widgets/custom_container/custom_container.dart';
import 'package:trading/share/widgets/custom_image/custom_image.dart';
import 'package:trading/utils/app_assets/app_assets.dart';
import 'package:trading/utils/app_colors/app_colors.dart';
import 'package:trading/utils/app_text/app_strings.dart';
import 'package:trading/utils/extension/base_extension.dart';
import 'package:get/get.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  bool isSwitched = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: AppColors.backgroundColor,
      //bottomNavigationBar: _buildBottomNav(),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          ///appbar=======================================================================
          const DashboardAccountHeader(
            isDashboard: false,
          ),

          SliverToBoxAdapter(
            child: SizedBox(height: ResponsiveHelper.height(22)),
          ),

          ///account header section==================================================
          SliverToBoxAdapter(
            child: CustomContainer(
              margin: EdgeInsets.symmetric(
                horizontal: ResponsiveHelper.width(16),
              ),
              backgroundColor: AppColors.greyShade,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildAccountHeaderRow(
                        context,
                        imagePath: AppAssets.nameAccountDashboard,
                        title: AppText.name,
                        subTitle: AppText.mt4104392,
                      ),

                      _buildAccountHeaderRow(
                        context,
                        imagePath: AppAssets.typeAccountDashboard,
                        title: AppText.type,
                        subTitle: AppText.mt4104392,
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: CustomImage(imageSrc: AppAssets.arrowBack),
                  ),
                  SizedBox(height: ResponsiveHelper.height(16)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildAccountHeaderRow(
                        context,
                        imagePath: AppAssets.brokerAccountDashboard,
                        title: AppText.broker,
                        subTitle: AppText.mt4104392,
                      ),
                      _buildAccountHeaderRow(
                        context,
                        imagePath: AppAssets.platformAccountDashboard,
                        title: AppText.platform,
                        subTitle: AppText.mt4104392,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: ResponsiveHelper.all(16),
              child: AccountTabWidget(),
            ),
          ),

          /// 2. upgrade overview win p/l rate view===============================================
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ResponsiveHelper.width(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: ResponsiveHelper.height(18)),

                  /// graph chart===================================================================
                  PerformanceCard(),

                  SizedBox(height: ResponsiveHelper.height(16)),
                ],
              ),
            ),
          ),

          ///key matrics card gridview=======================================================================
          SliverToBoxAdapter(
            child: Card(
              color: AppColors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: AppColors.boarderColor, width: 1),
              ),
              child: Padding(
                padding: ResponsiveHelper.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppText.keyMetrics, style: context.bodyLarge),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 6,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        childAspectRatio: 1.2,
                      ),
                      itemBuilder: (context, index) {
                        return _buildKeyMatricsCard(context);
                      },
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

  ///account header row method===========================================
  Row _buildAccountHeaderRow(
    BuildContext context, {
    required String imagePath,
    required String title,
    required String subTitle,
  }) {
    return Row(
      children: [
        CustomImage(imageSrc: imagePath),
        SizedBox(width: ResponsiveHelper.width(4)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: context.bodySmall),

            Text(subTitle, style: context.titleSmall),
          ],
        ),
      ],
    );
  }

  ///key matrics card=======================================================================
  CustomContainer _buildKeyMatricsCard(BuildContext context) {
    return CustomContainer(
      backgroundColor: AppColors.primaryShade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "status", // ← fixed + %
            style: context.bodySmall.copyWith(fontWeight: FontWeight.w600),
          ),

          SizedBox(height: ResponsiveHelper.height(24)),
          Text(
            "\$32343", // ← fixed + %
            style: context.bodyLarge,
          ),

          SizedBox(height: ResponsiveHelper.height(4)),

          Row(
            children: [
              Text(
                "+2.1%", // ← fixed + %
                style: context.bodySmall.copyWith(color: AppColors.primary),
              ),
              CustomImage(imageSrc: AppAssets.topArrow),
            ],
          ),
        ],
      ),
    );
  }

  /// helper methode section===================================================================================
}



class SelectAccountTitleWidget extends StatelessWidget {
  const SelectAccountTitleWidget({
    super.key,
    required this.icon,
    required this.title,
    this.titleColor,
    this.iconColor,
  });

  final String icon;
  final String title;
  final Color? titleColor;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CustomImage(imageSrc: icon),
      title: Text(
        title,
        style: context.bodyMedium.copyWith(
          color: titleColor ?? AppColors.black,
        ),
      ),
      subtitle: Text(
        AppText.showingListOfAllAccounts,

        style: context.bodySmall,
      ),
      trailing: CustomImage(imageSrc: AppAssets.arrowFront),
    );
  }
}

///chart container=====================================================================================
class ChartContainer extends StatelessWidget {
  const ChartContainer({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: ResponsiveHelper.height(220),
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF0B1019),
        borderRadius: BorderRadius.circular(ResponsiveHelper.borderRadius(16)),
      ),
      child: Center(
        child: Text(
          "Line Graph Area",
          style: TextStyle(
            color: Colors.white24,
            fontSize: ResponsiveHelper.fontSize(12),
          ),
        ),
      ),
    );
  }
}

///insights state card==============================================================================================
class HorizontalStatsList extends StatelessWidget {
  const HorizontalStatsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ResponsiveHelper.height(140),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          return const StatCard(
            title: AppText.winRate,
            amount: '1844',
            percent: '2.1',
          );
        },
      ),
    );
  }
}
