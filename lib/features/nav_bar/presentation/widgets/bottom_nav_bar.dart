import 'package:flutter/material.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';

class CustomBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ResponsiveHelper.height(60),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          navItem(icon: Icons.home, index: 0),
          navItem(icon: Icons.search, index: 1),
          navItem(icon: Icons.add, index: 2),
          navItem(icon: Icons.favorite, index: 3),
          navItem(icon: Icons.person, index: 4),
        ],
      ),
    );
  }

  Widget navItem({required IconData icon, required int index}) {
    bool isSelected = currentIndex == index;

    return GestureDetector(
      onTap: () => onTap(index),
      child: Icon(
        icon,
        size:  ResponsiveHelper.fontSize(28),
        color: isSelected ? Colors.blue : Colors.grey,
      ),
    );
  }
}
