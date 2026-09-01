import 'package:flutter/material.dart';
import 'package:trading/core/routes/app_routes.dart';
import 'package:trading/features/common/presentation/widgets/custom_upgrade_button.dart';
import 'package:trading/features/common/presentation/widgets/high_insights_container.dart';
import 'package:trading/features/common/presentation/widgets/status_outline_container.dart';
import 'package:trading/features/dashboard_account/presentation/Widgets/account_appbar_row_widget.dart';
import 'package:trading/features/dashboard_account/presentation/Widgets/account_title.dart';
import 'package:trading/features/dashboard_account/presentation/Widgets/dashboard_account_header.dart';
import 'package:trading/features/dashboard_account/presentation/Widgets/performance_card.dart';
import 'package:trading/features/dashboard_account/presentation/Widgets/top_trader_widget.dart';


import 'package:trading/helper/responsive_helper/responsive_helper.dart';
import 'package:trading/share/widgets/custom_appbar/custom_appbar_container.dart';
import 'package:trading/share/widgets/custom_container/custom_container.dart';
import 'package:trading/share/widgets/custom_divider/custom_divider.dart';
import 'package:trading/share/widgets/custom_image/custom_image.dart';
import 'package:trading/utils/app_assets/app_assets.dart';
import 'package:trading/utils/app_colors/app_colors.dart';
import 'package:trading/utils/app_text/app_strings.dart';
import 'package:trading/utils/extension/base_extension.dart';
import 'package:get/get.dart';

import 'account_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool isSwitched = true;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      key: _scaffoldKey,
      drawer: Drawer(),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          /// AppBar
          const DashboardAccountHeader(
            isDashboard: true,
          ),

          /// Upgrade Overview & P/L Rate
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ResponsiveHelper.width(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: ResponsiveHelper.height(12)),

                  /// Upgrade Container
                  CustomContainer(
                    horizontal: ResponsiveHelper.width(8),
                    vertical: ResponsiveHelper.height(8),
                    backgroundColor: AppColors.primaryShade100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppText.unlockProTrader,
                              style: TextStyle(
                                fontSize: ResponsiveHelper.fontSize(16),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: ResponsiveHelper.height(4)),
                            SizedBox(
                              height: ResponsiveHelper.height(40),
                              width: ResponsiveHelper.width(180),
                              child: Text(
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                AppText.advancedAnalyticsAndCopiers,
                                style: TextStyle(
                                  fontSize: ResponsiveHelper.fontSize(14),
                                ),
                              ),
                            ),
                          ],
                        ),
                        CustomUpgradeButton(),
                      ],
                    ),
                  ),

                  SizedBox(height: ResponsiveHelper.height(24)),
                  _buildSectionHeader("Overview", context),
                  SizedBox(height: ResponsiveHelper.height(12)),

                  /// Graph Chart
                  PerformanceCard(),
                  SizedBox(height: ResponsiveHelper.height(16)),

                  /// Insights Horizontal List
                  const HorizontalStatsList(),

                  /// Linked Account Navigation
                  SizedBox(height: ResponsiveHelper.height(24)),
                  GestureDetector(
                    onTap: () {
                      Get.bottomSheet(
                        Container(
                          height: ResponsiveHelper.height(
                            MediaQuery.of(context).size.height * 0.8,
                          ),
                          padding: EdgeInsets.all(ResponsiveHelper.width(16)),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(
                                ResponsiveHelper.borderRadius(20),
                              ),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppText.selectAccount,
                                style: TextStyle(
                                  fontSize: ResponsiveHelper.fontSize(16),
                                ),
                              ),
                              SizedBox(height: ResponsiveHelper.height(4)),
                              Text(
                                AppText.showingListOfAllAccounts,
                                style: TextStyle(
                                  fontSize: ResponsiveHelper.fontSize(14),
                                ),
                              ),
                              SizedBox(height: ResponsiveHelper.height(12)),
                              TextField(
                                decoration: InputDecoration(
                                  hintText: "Search...",
                                  prefixIcon: const Icon(Icons.search),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      ResponsiveHelper.borderRadius(12),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: ResponsiveHelper.height(12)),
                              Expanded(
                                child: ListView.builder(
                                  itemCount: 10,
                                  itemBuilder: (context, index) {
                                    return CustomContainer(
                                      margin: EdgeInsets.only(
                                        bottom: ResponsiveHelper.height(12),
                                      ),
                                      borderColor: AppColors.boarderColor,
                                      child: AccountTile(
                                        id: "MT5-104392",
                                        broker: "IC Markets",
                                        amount: "\$1,624",
                                        status: AppText.active,
                                        statusTextColor: AppColors.primary,
                                        statusBgColor:
                                            AppColors.primaryShade100,
                                        statusBorderColor: AppColors.primary,
                                      ),
                                    );
                                  },
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: const Text(AppText.addAccount),
                              ),
                            ],
                          ),
                        ),
                        isScrollControlled: true,
                      );
                    },
                    child: _buildSectionHeader("Linked Accounts", context),
                  ),
                  SizedBox(height: ResponsiveHelper.height(8)),
                ],
              ),
            ),
          ),

          /// Linked Accounts List
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: ResponsiveHelper.width(16),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  ResponsiveHelper.borderRadius(12),
                ),
                border: Border.all(color: AppColors.boarderColor),
              ),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      SizedBox(height: ResponsiveHelper.height(4)),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: ResponsiveHelper.width(16),
                          vertical: ResponsiveHelper.height(8),
                        ),
                        child: const AccountTile(
                          id: "MT5-104392",
                          broker: "IC Markets",
                          amount: "\$1,624",
                          status: "Pending",
                          statusTextColor: AppColors.primary,
                          statusBgColor: AppColors.primaryShade100,
                          statusBorderColor: AppColors.primary,
                        ),
                      ),
                      if (index != 2) CustomDivider(),
                    ],
                  );
                },
              ),
            ),
          ),

          /// Copiers Section
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(ResponsiveHelper.width(16)),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.accountScreen);
                    },
                    child: _buildSectionHeader(
                      AppText.copiersAccounts,
                      context,
                    ),
                  ),
                  SizedBox(height: ResponsiveHelper.height(12)),
                  SizedBox(
                    height: ResponsiveHelper.height(190),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        return CustomContainer(
                          width: ResponsiveHelper.width(150),
                          margin: EdgeInsets.only(
                            right: ResponsiveHelper.width(16),
                          ),
                          borderColor: AppColors.boarderColor,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Master\nAccount 2",
                                style: TextStyle(
                                  fontSize: ResponsiveHelper.fontSize(14),
                                  color: AppColors.textBlack,
                                ),
                              ),
                              SizedBox(height: ResponsiveHelper.height(6)),
                              Row(
                                children: [
                                  StatusOutlineContainer(
                                    statusBgColor: AppColors.primaryShade100,
                                    statusBorderColor: AppColors.primary,
                                    status: AppText.active,
                                    statusTextColor: AppColors.primary,
                                  ),
                                  SizedBox(),
                                ],
                              ),
                              SizedBox(height: ResponsiveHelper.height(32)),
                              CustomContainer(
                                width: ResponsiveHelper.width(64),
                                horizontal: ResponsiveHelper.width(2),
                                vertical: ResponsiveHelper.height(2),
                                radius: ResponsiveHelper.borderRadius(50),
                                backgroundColor: AppColors.orange,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomImage(
                                      imageSrc: AppAssets.masterAccountShare,
                                    ),
                                    SizedBox(width: ResponsiveHelper.width(4)),
                                    Text(
                                      "10",
                                      style: TextStyle(
                                        fontSize: ResponsiveHelper.fontSize(14),
                                        color: AppColors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: ResponsiveHelper.height(8)),
                  HighInsightsContainerWidget(),
                ],
              ),
            ),
          ),
          /// Top Traders
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: ResponsiveHelper.width(16),
              ),
              child: Column(
                children: [
                  _buildSectionHeader("Top Traders", context),
                  SizedBox(height: ResponsiveHelper.height(8)),
                ],
              ),
            ),
          ),

          // /// Top Traders
          SliverToBoxAdapter(
            child: Padding(
              padding:  ResponsiveHelper.symmetric(horizontal: 16.0, vertical: 8.0),
              child: TopTradersWidget(),
            ),
          ),

        ],
      ),
    );
  }



  /// Section Header
  Widget _buildSectionHeader(String title, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(fontSize: ResponsiveHelper.fontSize(16))),
        Container(
          height: ResponsiveHelper.height(30),
          width: ResponsiveHelper.width(30),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.greyShade,
          ),
          child: CustomImage(imageSrc: AppAssets.arrowFront),
        ),
      ],
    );
  }

  /// Bottom Navigation
  Widget _buildBottomNav() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color(0xFF00796B),
      unselectedItemColor: Colors.grey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.add_box_outlined), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.copy_outlined), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.show_chart), label: ""),
      ],
    );
  }
}


