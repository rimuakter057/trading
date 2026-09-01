import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trading/features/analyzer/presentation/screens/analyzer_screen.dart';
import 'package:trading/features/analyzer/presentation/screens/analyzer_test_screen.dart';
import 'package:trading/features/compare/presentation/screens/compare_screens.dart';
import 'package:trading/features/copier/presentation/screens/copier_screen.dart';
import 'package:trading/features/dashboard_account/presentation/screens/dashboard_screen.dart';
import 'package:trading/features/sentiments/presentation/screens/sentiments_screen.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';
import 'package:trading/share/widgets/custom_image/custom_image.dart';
import 'package:trading/utils/app_assets/app_assets.dart';
import 'package:trading/utils/app_colors/app_colors.dart';

class MainNavScreen extends StatefulWidget {
  const MainNavScreen({super.key});

  @override
  State<MainNavScreen> createState() => _MainNavScreenState();
}

class _MainNavScreenState extends State<MainNavScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const DashboardScreen(),
    const CopierScreen(),
    const AnalyzerScreen(),
    const CompareScreen(),
    SentimentsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.grey,

        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },

        items: [
          _navItem(AppAssets.navOne, "dashboard", 0),
          _navItem(AppAssets.navTwo, "copier", 1),
          _navItem(AppAssets.navThree, "analyzer", 2),
          _navItem(AppAssets.navFour, "compare", 3),
          _navItem(AppAssets.navFive, "sentiments", 4),
        ],
      ),
    );
  }

  BottomNavigationBarItem _navItem(String icon, String label, int index) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
         icon,
        color: _currentIndex == index
            ? AppColors.primary
            : AppColors.black,
        height: ResponsiveHelper.iconSize(20),
        width: ResponsiveHelper.iconSize(20),
      ),
      label: label,
    );
  }
}

