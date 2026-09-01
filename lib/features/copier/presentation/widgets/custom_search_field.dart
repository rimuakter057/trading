import 'package:flutter/material.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';
import 'package:trading/share/widgets/custom_image/custom_image.dart';
import 'package:trading/utils/app_assets/app_assets.dart';
import 'package:trading/utils/app_colors/app_colors.dart';

class CustomSearchField extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final void Function()? onMicTap;

  const CustomSearchField({
    super.key,
    this.hintText = "Search",
    this.controller,
    this.onChanged,
    this.onMicTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:  ResponsiveHelper.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.grey,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CustomImage(
            imageSrc: AppAssets.search,
            width: 20,
            height: 20,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              decoration: InputDecoration.collapsed(
                hintText: hintText,
              ),
            ),
          ),
          GestureDetector(
            onTap: onMicTap,
            child: const Icon(Icons.mic),
          ),
        ],
      ),
    );
  }
}