// import 'package:flutter/material.dart';
// import 'package:trading/helper/responsive_helper/responsive_helper.dart';
// import 'package:trading/share/widgets/custom_divider/custom_divider.dart';
// import 'package:trading/share/widgets/custom_image/custom_image.dart';
// import 'package:trading/utils/app_assets/app_assets.dart';
// import 'package:trading/utils/app_colors/app_colors.dart';
// import 'package:trading/utils/extension/base_extension.dart';
//
// class TabWidgetCopier extends StatefulWidget {
//   const TabWidgetCopier({super.key});
//
//   @override
//   State<TabWidgetCopier> createState() => _TabWidgetCopierState();
// }
//
// class _TabWidgetCopierState extends State<TabWidgetCopier> {
//   String selectedPeriod = 'Account';
//
//   final Map<String, List<Map<String, dynamic>>> allTradersData = {
//     'Account': [
//       {
//         'rank': 1,
//         'name': 'John FX',
//         'followers': '120 Followers',
//         'profit': '+12.5%',
//         'color': Colors.orange,
//       },
//       {
//         'rank': 2,
//         'name': 'John FX',
//         'followers': '120 Followers',
//         'profit': '+9.8%',
//         'color': Colors.grey,
//       },
//       {
//         'rank': 3,
//         'name': 'John FX',
//         'followers': '120 Followers',
//         'profit': '+9.1%',
//         'color': Colors.brown,
//       },
//       {
//         'rank': 1,
//         'name': 'John FX',
//         'followers': '120 Followers',
//         'profit': '+12.5%',
//         'color': Colors.orange,
//       },
//       {
//         'rank': 2,
//         'name': 'John FX',
//         'followers': '120 Followers',
//         'profit': '+9.8%',
//         'color': Colors.grey,
//       },
//       {
//         'rank': 3,
//         'name': 'John FX',
//         'followers': '120 Followers',
//         'profit': '+9.1%',
//         'color': Colors.brown,
//       },
//     ],
//     'Templates': [
//       {
//         'rank': 1,
//         'name': 'Alex Trading',
//         'followers': '450 Followers',
//         'profit': '+45.2%',
//         'color': Colors.orange,
//       },
//       {
//         'rank': 2,
//         'name': 'Rahim FX',
//         'followers': '300 Followers',
//         'profit': '+38.5%',
//         'color': Colors.grey,
//       },
//       {
//         'rank': 3,
//         'name': 'Sabbir Pro',
//         'followers': '210 Followers',
//         'profit': '+22.1%',
//         'color': Colors.brown,
//       },
//     ],
//     'Logs': [
//       {
//         'rank': 1,
//         'name': 'Global Master',
//         'followers': '2.5k Followers',
//         'profit': '+120.5%',
//         'color': Colors.orange,
//       },
//       {
//         'rank': 2,
//         'name': 'John FX',
//         'followers': '1.8k Followers',
//         'profit': '+98.0%',
//         'color': Colors.grey,
//       },
//       {
//         'rank': 3,
//         'name': 'Profit King',
//         'followers': '1.2k Followers',
//         'profit': '+85.4%',
//         'color': Colors.brown,
//       },
//     ],
//   };
//
//   @override
//   Widget build(BuildContext context) {
//     final currentTraders = allTradersData[selectedPeriod]!;
//
//     return Padding(
//       padding: EdgeInsets.only(
//         top: ResponsiveHelper.height(16),
//         left: ResponsiveHelper.width(12),
//         right: ResponsiveHelper.width(12),
//       ),
//       child: Container(
//         decoration: BoxDecoration(
//           color: AppColors.greyShade,
//           borderRadius: BorderRadius.circular(
//             ResponsiveHelper.borderRadius(12),
//           ),
//           border: Border.all(color: AppColors.boarderColor),
//         ),
//         child: Padding(
//           padding: ResponsiveHelper.all(4),
//           child: Row(
//             children: [
//               'Account',
//               'Templates',
//               'Logs',
//             ].map((tab) => _buildTab(tab)).toList(),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTab(String title) {
//     bool isSelected = selectedPeriod == title;
//
//     return Expanded(
//       child: GestureDetector(
//         onTap: () {
//           setState(() {
//             selectedPeriod = title;
//           });
//         },
//         child: Container(
//           padding: ResponsiveHelper.symmetric(vertical: 6),
//           decoration: BoxDecoration(
//             color: isSelected ? AppColors.primary : Colors.transparent,
//             borderRadius: BorderRadius.circular(
//               ResponsiveHelper.borderRadius(10),
//             ),
//           ),
//           child: Center(
//             child: Text(
//               title,
//               style: TextStyle(
//                 color: isSelected ? AppColors.white : AppColors.greySwitch,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildTraderRow(
//     Map<String, dynamic> trader, {
//     bool showDivider = true,
//   }) {
//     return Column(
//       children: [
//         Padding(
//           padding: EdgeInsets.only(
//             top: ResponsiveHelper.height(16),
//             left: ResponsiveHelper.width(12),
//             right: ResponsiveHelper.width(12),
//           ),
//           child: Row(
//             children: [
//               CustomImage(imageSrc: AppAssets.topTraderDashboard),
//
//               SizedBox(width: ResponsiveHelper.width(12)),
//
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(trader['name'], style: context.bodyMedium),
//                     Text(trader['followers'], style: context.bodySmall),
//                   ],
//                 ),
//               ),
//
//               Row(
//                 children: [
//                   Text(trader['profit'], style: context.titleSmall),
//                   SizedBox(width: ResponsiveHelper.width(12)),
//                   CustomImage(imageSrc: AppAssets.topArrow),
//                 ],
//               ),
//             ],
//           ),
//         ),
//
//         if (showDivider) const CustomDivider(),
//       ],
//     );
//   }
// }









import 'package:flutter/material.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';
import 'package:trading/utils/app_colors/app_colors.dart';
import 'package:trading/features/copier/presentation/widgets/account_tab_widget.dart';
import 'package:trading/features/copier/presentation/widgets/template_tab_widget.dart';
import 'package:trading/features/copier/presentation/widgets/log_tab_widget.dart';

class TabWidgetCopier extends StatefulWidget {
  const TabWidgetCopier({super.key});

  @override
  State<TabWidgetCopier> createState() => _TabWidgetCopierState();
}

class _TabWidgetCopierState extends State<TabWidgetCopier> {
  String selectedTab = 'Account';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Tab Buttons Row
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ResponsiveHelper.width(12),
            vertical: ResponsiveHelper.height(16),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.greyShade,
              borderRadius: BorderRadius.circular(ResponsiveHelper.borderRadius(12)),
              border: Border.all(color: AppColors.boarderColor),
            ),
            child: Row(
              children: ['Account', 'Templates', 'Logs']
                  .map((tab) => _buildTab(tab))
                  .toList(),
            ),
          ),
        ),

        SizedBox(height: ResponsiveHelper.height(12)),

        /// Show only selected tab content
        if (selectedTab == 'Account') const AccountTabWidget(),
        if (selectedTab == 'Templates') const TemplateTabWidget(),
        if (selectedTab == 'Logs') const LogTabWidget(),
      ],
    );
  }

  /// Individual tab button
  Widget _buildTab(String title) {
    bool isSelected = selectedTab == title;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedTab = title; // update selected tab
          });
        },
        child: Container(
          padding: ResponsiveHelper.symmetric(vertical: 6),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(ResponsiveHelper.borderRadius(10)),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: isSelected ? AppColors.white : AppColors.greySwitch,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
