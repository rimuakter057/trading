import 'package:flutter/material.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';
import 'package:trading/share/widgets/custom_divider/custom_divider.dart';
import 'package:trading/share/widgets/custom_image/custom_image.dart';
import 'package:trading/utils/app_assets/app_assets.dart';
import 'package:trading/utils/app_colors/app_colors.dart';
import 'package:trading/utils/extension/base_extension.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountTabWidget extends StatefulWidget {
  const AccountTabWidget({super.key});

  @override
  State<AccountTabWidget> createState() => _AccountTabWidgetState();
}

class _AccountTabWidgetState extends State<AccountTabWidget> {
  String selectedPeriod = 'Week';

  final Map<String, List<Map<String, dynamic>>> allTradersData = {
    'Week': [
      {
        'rank': 1,
        'name': 'John FX',
        'followers': '120 Followers',
        'profit': '+12.5%',
        'color': Colors.orange,
      },
      {
        'rank': 2,
        'name': 'John FX',
        'followers': '120 Followers',
        'profit': '+9.8%',
        'color': Colors.grey,
      },
      {
        'rank': 3,
        'name': 'John FX',
        'followers': '120 Followers',
        'profit': '+9.1%',
        'color': Colors.brown,
      },
      {
        'rank': 1,
        'name': 'John FX',
        'followers': '120 Followers',
        'profit': '+12.5%',
        'color': Colors.orange,
      },
      {
        'rank': 2,
        'name': 'John FX',
        'followers': '120 Followers',
        'profit': '+9.8%',
        'color': Colors.grey,
      },
      {
        'rank': 3,
        'name': 'John FX',
        'followers': '120 Followers',
        'profit': '+9.1%',
        'color': Colors.brown,
      },
    ],
    'Month': [
      {
        'rank': 1,
        'name': 'Alex Trading',
        'followers': '450 Followers',
        'profit': '+45.2%',
        'color': Colors.orange,
      },
      {
        'rank': 2,
        'name': 'Rahim FX',
        'followers': '300 Followers',
        'profit': '+38.5%',
        'color': Colors.grey,
      },
      {
        'rank': 3,
        'name': 'Sabbir Pro',
        'followers': '210 Followers',
        'profit': '+22.1%',
        'color': Colors.brown,
      },
    ],
    'Year': [
      {
        'rank': 1,
        'name': 'Global Master',
        'followers': '2.5k Followers',
        'profit': '+120.5%',
        'color': Colors.orange,
      },
      {
        'rank': 2,
        'name': 'John FX',
        'followers': '1.8k Followers',
        'profit': '+98.0%',
        'color': Colors.grey,
      },
      {
        'rank': 3,
        'name': 'Profit King',
        'followers': '1.2k Followers',
        'profit': '+85.4%',
        'color': Colors.brown,
      },
    ],
  };

  @override
  Widget build(BuildContext context) {


    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(ResponsiveHelper.borderRadius(16)),
        border: Border.all(color: AppColors.boarderColor),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.all(6),
            child: Row(
              children: [
                'Week',
                'Month',
                'Year',
              ].map((tab) => _buildTab(tab)).toList(),
            ),
          ),


          //
          // AnimatedSwitcher(
          //   duration: const Duration(milliseconds: 300),
          //   child: Column(
          //     key: ValueKey<String>(selectedPeriod),
          //     children: currentTraders.asMap().entries.map((entry) {
          //       final index = entry.key;
          //       final trader = entry.value;
          //
          //       return _buildTraderRow(
          //         trader,
          //         showDivider: index != currentTraders.length - 1,
          //       );
          //     }).toList(),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _buildTab(String title) {
    bool isSelected = selectedPeriod == title;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedPeriod = title;
          });
        },
        child: Container(
          padding:  ResponsiveHelper.symmetric(vertical: 6),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(
              ResponsiveHelper.borderRadius(10),
            ),
          ),
          child: Center(
            child: Text(
              title,
              style: GoogleFonts.inter(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color:isSelected?AppColors.white: AppColors.textBlack

              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTraderRow(
      Map<String, dynamic> trader, {
        bool showDivider = true,
      }) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: ResponsiveHelper.height(16),
            left: ResponsiveHelper.width(12),
            right: ResponsiveHelper.width(12),
          ),
          child: Row(
            children: [
              CustomImage(imageSrc: AppAssets.topTraderDashboard),

              SizedBox(width: ResponsiveHelper.width(12)),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(trader['name'], style: context.bodyMedium),
                    Text(trader['followers'], style: context.bodySmall),
                  ],
                ),
              ),

              Row(
                children: [
                  Text(trader['profit'], style: context.titleSmall),
                  SizedBox(width: ResponsiveHelper.width(12)),
                  CustomImage(imageSrc: AppAssets.topArrow),
                ],
              ),
            ],
          ),
        ),

        if (showDivider) const CustomDivider(),
      ],
    );
  }
}
