import 'package:flutter/material.dart';
import 'package:trading/features/analyzer/presentation/widgets/roi_heat_map.dart';
import 'package:trading/features/analyzer/presentation/widgets/trade_log_title.dart';
import 'package:trading/utils/app_colors/app_colors.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';

class AnalyzerHeatmapScreen extends StatelessWidget {
  const AnalyzerHeatmapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: Icon(Icons.grid_view_rounded, color: AppColors.primary),
        title: Text(
          "Analyzer",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: ResponsiveHelper.fontSize(16),
          ),
        ),
        centerTitle: true,
        actions: [
          Icon(Icons.notifications_none_outlined, color: Colors.black),
          Icon(Icons.tune, color: Colors.black),
          SizedBox(width: ResponsiveHelper.width(15)),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(ResponsiveHelper.width(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTopTabs(),
            SizedBox(height: ResponsiveHelper.height(20)),
            _buildSubTabs(),
            SizedBox(height: ResponsiveHelper.height(15)),
            const ROIHeatmap(),
            SizedBox(height: ResponsiveHelper.height(25)),
            Text(
              "Last 10 Trades",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: ResponsiveHelper.fontSize(15),
              ),
            ),
            SizedBox(height: ResponsiveHelper.height(15)),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 4,
              itemBuilder: (context, index) => const TradeLogTile(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopTabs() {
    return Container(
      padding: EdgeInsets.all(ResponsiveHelper.width(4)),
      decoration: BoxDecoration(
        color: const Color(0xFFE0E4E7),
        borderRadius: BorderRadius.circular(ResponsiveHelper.width(10)),
      ),
      child: Row(
        children: [
          _tab("Performance", false),
          _tab("Analysis Hub", true),
        ],
      ),
    );
  }

  Widget _tab(String label, bool active) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: ResponsiveHelper.height(8)),
        decoration: BoxDecoration(
          color: active ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(ResponsiveHelper.width(8)),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              color: active ? Colors.white : Colors.black54,
              fontSize: ResponsiveHelper.fontSize(14),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSubTabs() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: ["ROI Heatmap & Trades", "Risk Monitors", "Other"].map((e) {
          bool active = e == "ROI Heatmap & Trades";
          return Container(
            margin: EdgeInsets.only(right: ResponsiveHelper.width(8)),
            padding: EdgeInsets.symmetric(
              horizontal: ResponsiveHelper.width(16),
              vertical: ResponsiveHelper.height(8),
            ),
            decoration: BoxDecoration(
              color: active ? AppColors.primary.withOpacity(0.1) : Colors.white,
              borderRadius: BorderRadius.circular(ResponsiveHelper.width(20)),
              border: Border.all(color: active ? AppColors.primary : AppColors.black),
            ),
            child: Text(
              e,
              style: TextStyle(
                color: active ? AppColors.primary : Colors.black54,
                fontSize: ResponsiveHelper.fontSize(11),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
