import 'package:flutter/material.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';
import 'package:trading/share/widgets/custom_container/custom_container.dart';
import 'package:trading/share/widgets/custom_divider/custom_divider.dart';
import 'package:trading/share/widgets/custom_image/custom_image.dart';
import 'package:trading/utils/app_assets/app_assets.dart';
import 'package:trading/utils/app_colors/app_colors.dart';
import 'package:trading/utils/app_text/app_strings.dart';
import 'package:trading/utils/extension/base_extension.dart';

class CompareScreen extends StatelessWidget {
  const CompareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: Text(
          "Compare",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: ResponsiveHelper.fontSize(18),
          ),
        ),
        centerTitle: true,
        actions: [
          Icon(
            Icons.notifications_none_outlined,
            color: Colors.black,
            size: ResponsiveHelper.iconSize(24),
          ),
          Icon(
            Icons.menu,
            color: Colors.black,
            size: ResponsiveHelper.iconSize(24),
          ),
          SizedBox(width: ResponsiveHelper.width(15)),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(ResponsiveHelper.padding(16)),
        child: Column(
          children: [
            _buildToggleTabs(),
            SizedBox(height: ResponsiveHelper.height(20)),
            _buildCompareInputCard(context),
            SizedBox(height: ResponsiveHelper.height(25)),
            _buildLeaderboardHeader(context),
            SizedBox(height: ResponsiveHelper.height(25)),

            _buildLeaderboardList(context),
            // Leverage Section
            Text("leverage", textAlign: TextAlign.center),

            CustomContainer(
              backgroundColor: AppColors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppText.fx,
                    style: context.bodySmall.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: ResponsiveHelper.fontSize(14),
                    ),
                  ),
                  SizedBox(height: ResponsiveHelper.height(16)),
                  Row(
                    children: [
                      _buildLeverageColumn("Instant", "Buy"),
                      SizedBox(width: ResponsiveHelper.width(24)),
                      _buildLeverageColumn("1-Step", "\$1333"),
                      SizedBox(width: ResponsiveHelper.width(24)),
                      _buildLeverageColumn("2-Step", "\$1333"),
                      SizedBox(width: ResponsiveHelper.width(24)),
                      _buildLeverageColumn("3-Step", "\$1333"),
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: ResponsiveHelper.height(25)),

            // General Section
            Text("general", textAlign: TextAlign.center),

            CustomContainer(
              backgroundColor: AppColors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildGeneralRow(context, AppText.country),
                  SizedBox(height: ResponsiveHelper.height(16)),
                  _buildGeneralRowWithValue(
                    context,
                    "FoundingPips",
                    AppText.instant,
                  ),
                  SizedBox(height: ResponsiveHelper.height(16)),
                  CustomDivider(thickness: 1.2),
                  SizedBox(height: ResponsiveHelper.height(16)),
                  _buildGeneralRowWithValue(
                    context,
                    "FoundingPips",
                    AppText.instant,
                    hasIcon: true,
                  ),
                ],
              ),
            ),

            SizedBox(height: ResponsiveHelper.height(25)),

          ],
        ),
      ),
    );
  }

  Widget _buildLeverageColumn(String title, String value) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: ResponsiveHelper.fontSize(12),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: ResponsiveHelper.fontSize(12),
          ),
        ),
      ],
    );
  }

  Widget _buildCompareInputCard(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(ResponsiveHelper.padding(16)),
      decoration: BoxDecoration(
        color: const Color(0xFF0D1424),
        borderRadius: BorderRadius.circular(ResponsiveHelper.borderRadius(20)),
      ),
      child: Column(
        children: [
          CustomContainer(
            child: Column(
              children: [
                _dropdownField("FundingPips", context),
                CustomDivider(thickness: 1.1),
                _dropdownField("Select Prop Firm 2", context),
                Row(
                  children: [
                    CustomImage(imageSrc: AppAssets.addFirmCompare),
                    SizedBox(width: ResponsiveHelper.width(4)),
                    Text(AppText.addAnotherFirm, style: context.bodySmall),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: ResponsiveHelper.height(15)),
          ElevatedButton(onPressed: () {}, child: const Text("Compare")),
        ],
      ),
    );
  }

  Widget _dropdownField(String hint, BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveHelper.width(12),
        vertical: ResponsiveHelper.height(8),
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(ResponsiveHelper.borderRadius(8)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            hint,
            style: context.bodySmall.copyWith(
              color: AppColors.black,
              fontSize: ResponsiveHelper.fontSize(14),
            ),
          ),
          CustomImage(imageSrc: AppAssets.dropdown),
        ],
      ),
    );
  }

  Widget _buildLeaderboardList(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 2,
      itemBuilder: (context, index) => _firmTile(index + 1, context),
    );
  }

  Widget _firmTile(int rank, BuildContext context) {
    return CustomContainer(
      borderColor: AppColors.boarderColor,
      backgroundColor: AppColors.backgroundColor,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: ResponsiveHelper.width(30),
                height: ResponsiveHelper.height(30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    ResponsiveHelper.borderRadius(6),
                  ),
                  color: AppColors.white,
                  border: Border.all(color: AppColors.boarderColor),
                ),
              ),
              SizedBox(width: ResponsiveHelper.width(12)),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Prop Firm Name",
                    style: context.bodyMedium.copyWith(
                      fontSize: ResponsiveHelper.fontSize(14),
                    ),
                  ),
                  Text(
                    "AE • 2y • ★ 4.4",
                    style: context.bodySmall.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: ResponsiveHelper.fontSize(12),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Text(
                "#$rank",
                style: context.titleSmall.copyWith(
                  color: AppColors.subPrimary,
                  fontSize: ResponsiveHelper.fontSize(14),
                ),
              ),
            ],
          ),
          SizedBox(height: ResponsiveHelper.height(10)),
          Row(
            children: [
              _metric("Max Allocation", "\$300,000", context),
              SizedBox(width: ResponsiveHelper.width(36)),
              Row(
                children: [
                  SizedBox(
                    height: ResponsiveHelper.height(30),
                    child: VerticalDivider(color: AppColors.grey, thickness: 2),
                  ),
                  _metric("Leverage", "100x", context),
                ],
              ),
              SizedBox(width: ResponsiveHelper.width(36)),
              Row(
                children: [
                  SizedBox(
                    height: ResponsiveHelper.height(30),
                    child: VerticalDivider(color: AppColors.grey, thickness: 2),
                  ),
                  _metric("Daily DD", "5%", context),
                ],
              ),
            ],
          ),
          SizedBox(height: ResponsiveHelper.height(12)),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              minimumSize: Size(double.infinity, ResponsiveHelper.height(35)),
              foregroundColor: AppColors.primary,
              side: BorderSide(
                color: AppColors.primary,
                width: ResponsiveHelper.width(2),
              ),
            ),
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomImage(imageSrc: AppAssets.pinnedCompare),
                SizedBox(width: ResponsiveHelper.width(8)),
                Text("Select to Compare"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _metric(String label, String value, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.bodySmall.copyWith(
            fontSize: ResponsiveHelper.fontSize(12),
          ),
        ),
        Text(
          value,
          style: context.titleSmall.copyWith(
            fontSize: ResponsiveHelper.fontSize(14),
          ),
        ),
      ],
    );
  }

  Widget _buildToggleTabs() {
    return Container(
      padding: EdgeInsets.all(ResponsiveHelper.padding(4)),
      decoration: BoxDecoration(
        color: const Color(0xFFE0E4E7),
        borderRadius: BorderRadius.circular(ResponsiveHelper.borderRadius(10)),
      ),
      child: Row(
        children: [_tabItem("Prop Firms", true), _tabItem("Broker", false)],
      ),
    );
  }

  Widget _tabItem(String title, bool active) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: ResponsiveHelper.height(8)),
        decoration: BoxDecoration(
          color: active ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(ResponsiveHelper.borderRadius(8)),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: active ? Colors.white : Colors.black54,
              fontSize: ResponsiveHelper.fontSize(14),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLeaderboardHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Prop Firms Leaderboard",
          style: context.bodyMedium.copyWith(
            fontSize: ResponsiveHelper.fontSize(16),
          ),
        ),
        Container(
          padding: EdgeInsets.all(ResponsiveHelper.padding(8)),
          decoration: BoxDecoration(
            color: AppColors.greyShade,
            shape: BoxShape.circle,
          ),
          child: CustomImage(imageSrc: AppAssets.filter),
        ),
      ],
    );
  }

  Widget _buildGeneralRow(BuildContext context, String title) {
    return Row(
      children: [
        Container(
          width: ResponsiveHelper.width(24),
          height: ResponsiveHelper.height(24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              ResponsiveHelper.borderRadius(6),
            ),
            color: AppColors.white,
            border: Border.all(color: AppColors.boarderColor),
          ),
        ),
        SizedBox(width: ResponsiveHelper.width(4)),
        Text(
          title,
          style: context.bodySmall.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: ResponsiveHelper.fontSize(14),
          ),
        ),
      ],
    );
  }

  Widget _buildGeneralRowWithValue(
    BuildContext context,
    String title,
    String value, {
    bool hasIcon = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            if (hasIcon)
              Container(
                width: ResponsiveHelper.width(24),
                height: ResponsiveHelper.height(24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    ResponsiveHelper.borderRadius(6),
                  ),
                  color: AppColors.white,
                  border: Border.all(color: AppColors.boarderColor),
                ),
              ),
            if (hasIcon) SizedBox(width: ResponsiveHelper.width(4)),
            Text(
              title,
              style: context.bodySmall.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: ResponsiveHelper.fontSize(14),
              ),
            ),
          ],
        ),
        Text(
          value,
          style: context.bodySmall.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: ResponsiveHelper.fontSize(14),
          ),
        ),
      ],
    );
  }
}
