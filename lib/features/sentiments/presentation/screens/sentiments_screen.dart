import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trading/core/routes/app_routes.dart';
import 'package:trading/features/common/presentation/widgets/status_outline_container.dart';
import 'package:trading/features/sentiments/presentation/widgets/custom_sentiments_sheet.dart';
import 'package:trading/features/sentiments/presentation/widgets/day_widget.dart';
import 'package:trading/features/sentiments/presentation/widgets/market_news_widget.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';
import 'package:trading/share/widgets/custom_container/custom_container.dart';
import 'package:trading/share/widgets/custom_divider/custom_divider.dart';
import 'package:trading/share/widgets/custom_image/custom_image.dart';
import 'package:trading/utils/app_assets/app_assets.dart';
import 'package:trading/utils/app_colors/app_colors.dart';
import 'package:trading/utils/app_text/app_strings.dart';
import 'package:trading/utils/extension/base_extension.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SentimentsScreen extends StatelessWidget {
  SentimentsScreen({super.key});
  int selectedParentTabIndex = 0;
  int selectedSubTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        children: [
          CustomContainer(
            horizontal: ResponsiveHelper.height(16),
            vertical: ResponsiveHelper.width(16),
            height: ResponsiveHelper.height(160),
            allSides: false,
            borderColor: AppColors.boarderColor,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(ResponsiveHelper.borderRadius(8)),
              bottomRight: Radius.circular(ResponsiveHelper.borderRadius(8))
            ),
            child: Column(
              children: [
                SizedBox(height: ResponsiveHelper.height(24)),
                Row(
                  children: [
                    CustomImage(imageSrc: AppAssets.logo),
                    Spacer(),

                    Text(AppText.sentiments, style: context.bodyMedium),

                    Spacer(),

                    CustomImage(imageSrc: AppAssets.notification),
                    SizedBox(width: ResponsiveHelper.width(16)),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.addAccountScreen);
                      },
                      child: CustomImage(imageSrc: AppAssets.menu),
                    ),
                  ],
                ),
                SizedBox(height: ResponsiveHelper.height(16)),
                CustomContainer(
                  backgroundColor: AppColors.grey,
                  borderColor: AppColors.tabBoarderColor,
                  horizontal: ResponsiveHelper.width(4),
                  vertical: ResponsiveHelper.height(4),
                  radius: ResponsiveHelper.width(10),
                  child: Row(
                    children: List.generate(2, (index) {
                      bool isSelected = selectedParentTabIndex == index;
                      return Expanded(
                        child: GestureDetector(
                          onTap: () {},
                          child: CustomContainer(
                            horizontal: ResponsiveHelper.width(4),
                            vertical: ResponsiveHelper.height(4),
                            backgroundColor: isSelected
                                ? AppColors.primary
                                : AppColors.grey,
                            child: Text(
                              "Prop Firms",
                              textAlign: TextAlign.center,
                              style: context.bodySmall.copyWith(
                                fontWeight: FontWeight.w600,
                                color: isSelected
                                    ? AppColors.white
                                    : AppColors.black,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),

          // _buildToggleTabs(), // All Instruments / Watchlist
          Expanded(
            child: SingleChildScrollView(
              padding: ResponsiveHelper.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: ResponsiveHelper.height(8)),
                  _buildSearchBar(),
                  SizedBox(height: ResponsiveHelper.height(15)),
                  _buildCategoryChips(), // All, Forex, Indices etc.
                  SizedBox(height: ResponsiveHelper.height(20)),

                  _sectionTitle("Extreme Watchlist"),

                  ///sentiment card with bottom sheet=======================================
                  GestureDetector(

                    onTap: (){
                      Get.bottomSheet(
                          CustomSentimentsSheet(),



                      );
                    },



                    child: _sentimentCard(
                      pair: "XAUUSD",
                      cat: "Forex",
                      buy: 6,
                      sell: 68,
                      risk: "HIGH",
                      change: "+6% vs 24h",
                      context: context,
                    ),
                  ),

                  SizedBox(height: ResponsiveHelper.height(20)),

                  _sectionTitle("Other Instruments"),

                  ///sentiment card=======================================
                  GestureDetector(

                    child: _sentimentCard(
                      pair: "XAUUSD",
                      cat: "Forex",
                      buy: 6,
                      sell: 68,
                      risk: "HIGH",
                      change: "+6% vs 24h",
                      context: context,
                    ),
                  ),




                  ///market news card=========================================================================
                  MarketNewsWidget(
                    isSheet: false,
                  ),

                  CustomContainer(
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Reuters - 12 minutes ago",
                              style: GoogleFonts.inter(
                                fontSize: ResponsiveHelper.fontSize(15),
                                fontWeight: FontWeight.w400,
                                color: AppColors.textBlack,
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              "Dollar eases as traders eye FOMC minutes; focus on inflation path",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.inter(
                                fontSize: ResponsiveHelper.fontSize(18),
                                fontWeight: FontWeight.w600,
                                color: AppColors.textBlack,
                              ),
                            ),

                            SizedBox(height: ResponsiveHelper.height(8)),
                            Row(
                              children: [
                                StatusOutlineContainer(
                                  statusBgColor: AppColors.orangeShadeBg,
                                  statusBorderColor: AppColors.orange,
                                  status: AppText.mediumCapital,
                                  statusTextColor: AppColors.orange,

                                  fontSize: ResponsiveHelper.fontSize(10),
                                ),
                                SizedBox(),
                              ],
                            ),

                            SizedBox(height: ResponsiveHelper.height(8)),

                            Text(
                              "USD slips ahead of minutes; market expects softer tone on inflation risks.",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.inter(
                                fontSize: ResponsiveHelper.fontSize(15),
                                fontWeight: FontWeight.w400,
                                color: AppColors.textBlack,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: ResponsiveHelper.height(15)),

                        SizedBox(height: ResponsiveHelper.height(15)),
                        Row(
                          children: [
                            Expanded(
                              child: StatusOutlineContainer(
                                statusBgColor: AppColors.white,
                                statusBorderColor: AppColors.boarderColor,
                                status: "Save",
                                statusTextColor: AppColors.subPrimary,
                                verticalPadding: ResponsiveHelper.height(8),
                                fontSize: ResponsiveHelper.fontSize(14),
                              ),
                            ),
                            SizedBox(width: ResponsiveHelper.width(10)),
                            Expanded(
                              child: StatusOutlineContainer(
                                statusBgColor: AppColors.primary,
                                statusBorderColor: AppColors.primary,
                                status: "Read",
                                statusTextColor: AppColors.white,
                                verticalPadding: ResponsiveHelper.height(8),
                                fontSize: ResponsiveHelper.fontSize(14),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: ResponsiveHelper.height(100),
                  ), // Bottom navigation space
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _sentimentCard({
    required String pair,
    required String cat,
    required String change,
    required int buy,
    required int sell,
    required String risk,
    required BuildContext context,
  }) {
    return CustomContainer(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(pair, style: context.bodyMedium),
                  Text(
                    "$cat • $change",
                    style: TextStyle(
                      fontSize: ResponsiveHelper.fontSize(10),
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              _riskBadge(risk),
            ],
          ),
          SizedBox(height: ResponsiveHelper.height(15)),
          Row(
            children: [
              Text("34%", style: context.bodySmall),
              SizedBox(width: ResponsiveHelper.width(4)),
              Expanded(
                child: CustomContainer(
                  horizontal: ResponsiveHelper.width(2),
                  vertical: ResponsiveHelper.height(2),
                  backgroundColor: AppColors.greyShade,
                  child: _sentimentBar(),
                ),
              ),
              SizedBox(width: ResponsiveHelper.width(4)),
              Text("32%", style: context.bodySmall),
            ],
          ),
          SizedBox(height: ResponsiveHelper.height(15)),
          Row(
            children: [
              Expanded(
                child: StatusOutlineContainer(
                  statusBgColor: AppColors.white,
                  statusBorderColor: AppColors.boarderColor,
                  status: AppText.analyze,
                  statusTextColor: AppColors.subPrimary,
                  verticalPadding: ResponsiveHelper.height(8),
                  fontSize: ResponsiveHelper.fontSize(14),
                ),
              ),
              SizedBox(width: ResponsiveHelper.width(10)),
              Expanded(
                child: StatusOutlineContainer(
                  statusBgColor: AppColors.primary,
                  statusBorderColor: AppColors.primary,
                  status: AppText.details,
                  statusTextColor: AppColors.white,
                  verticalPadding: ResponsiveHelper.height(8),
                  fontSize: ResponsiveHelper.fontSize(14),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Buy/Sell Sentiment Bar (Red & Green Dashed style)
  Widget _sentimentBar() {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ResponsiveHelper.width(8),
            ),
            child: Row(
              children: List.generate(20, (index) {
                // Splits the 20 segments based on buy percentage
                //   bool isBuy = index < (buy / 5);
                return Expanded(
                  child: Container(
                    height: ResponsiveHelper.height(4),
                    margin: EdgeInsets.symmetric(
                      horizontal: ResponsiveHelper.width(1),
                    ),

                    decoration: BoxDecoration(
                      // color: isBuy ? Colors.redAccent : Colors.greenAccent,
                      color: Colors.redAccent,
                      borderRadius: BorderRadius.circular(
                        ResponsiveHelper.borderRadius(5),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ],
    );
  }

  Widget _riskBadge(String label) {
    Color color;

    switch (label) {
      case "HIGH":
        color = AppColors.primary;
        break;
      case "LOW":
        color = AppColors.red;
        break;
      case "MEDIUM":
        color = AppColors.orange;
        break;
      default:
        color = AppColors.primary;
    }

    return StatusOutlineContainer(
      statusBgColor: AppColors.primaryShade100,
      statusBorderColor: AppColors.primary,
      status: label,
      statusTextColor: color,
    );
  }

  Widget _actionButton(String label, {required bool isOutlined}) {
    return Container(
      height: ResponsiveHelper.height(35),
      decoration: BoxDecoration(
        color: isOutlined ? Colors.transparent : const Color(0xFF00A693),
        borderRadius: BorderRadius.circular(ResponsiveHelper.borderRadius(8)),
        border: isOutlined ? Border.all(color: Colors.grey.shade300) : null,
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: isOutlined ? Colors.black : Colors.white,
            fontSize: ResponsiveHelper.fontSize(12),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  // Common Header/UI Elements
  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Text(
        "Sentiments",
        style: TextStyle(
          color: Colors.black,
          fontSize: ResponsiveHelper.fontSize(16),
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: Icon(Icons.grid_view_rounded, color: const Color(0xFF00A693)),
      actions: [
        Icon(Icons.notifications_none, color: Colors.black),
        Icon(Icons.tune, color: Colors.black),
        SizedBox(width: ResponsiveHelper.width(15)),
      ],
    );
  }

  Widget _buildToggleTabs() {
    return Container(
      margin: ResponsiveHelper.all(16),
      padding: ResponsiveHelper.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFFE0E4E7),
        borderRadius: BorderRadius.circular(ResponsiveHelper.borderRadius(10)),
      ),
      child: Row(
        children: [_tab("All Instruments", true), _tab("Watchlist", false)],
      ),
    );
  }

  Widget _tab(String label, bool active) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: ResponsiveHelper.height(8)),
        decoration: BoxDecoration(
          color: active ? const Color(0xFF00A693) : Colors.transparent,
          borderRadius: BorderRadius.circular(ResponsiveHelper.borderRadius(8)),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: active ? Colors.white : Colors.black54,
              fontSize: ResponsiveHelper.fontSize(12),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search",
        prefixIcon: const Icon(Icons.search, color: Colors.grey),
        suffixIcon: const Icon(Icons.mic, color: Colors.grey),
        filled: true,
        fillColor: AppColors.greyShade,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            ResponsiveHelper.borderRadius(12),
          ),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildCategoryChips() {
    List<String> cats = ["All", "Forex", "Indices", "Crypto", "Commodities"];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: cats
            .map(
              (e) => Container(
                margin: EdgeInsets.only(right: ResponsiveHelper.width(8)),
                padding: ResponsiveHelper.symmetric(
                  horizontal: 16,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: e == "All"
                      ? AppColors.primaryShade100
                      : AppColors.white,
                  borderRadius: BorderRadius.circular(
                    ResponsiveHelper.borderRadius(20),
                  ),
                  border: Border.all(
                    color: e == "All" ? AppColors.primary : Colors.transparent,
                  ),
                ),
                child: Text(
                  e,
                  style: GoogleFonts.instrumentSans(
                    color: e == "All"
                        ? AppColors.primary
                        : AppColors.outlineBorder,
                    fontSize: ResponsiveHelper.fontSize(16),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: ResponsiveHelper.height(12)),
      child: Text(
        title,
        style: TextStyle(
          fontSize: ResponsiveHelper.fontSize(14),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
