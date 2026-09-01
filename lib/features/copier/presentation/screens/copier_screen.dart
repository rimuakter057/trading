import 'package:flutter/material.dart';
import 'package:trading/features/copier/presentation/widgets/custom_appbar_copier.dart';
import 'package:trading/features/copier/presentation/widgets/tab_widget.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';
import 'package:trading/share/widgets/custom_image/custom_image.dart';
import 'package:trading/utils/app_assets/app_assets.dart';
import 'package:trading/utils/app_colors/app_colors.dart';
import 'package:trading/utils/app_text/app_strings.dart';


class CopierScreen extends StatefulWidget {
  const CopierScreen({super.key});

  @override
  State<CopierScreen> createState() => _CopierScreenState();
}

class _CopierScreenState extends State<CopierScreen> {
  bool isSwitched = true;
  bool isSelected = true;
  @override
  Widget build(BuildContext context) {
    final Widget gap = SizedBox(height: ResponsiveHelper.height(16));
    return Scaffold(
      backgroundColor: AppColors.background,

      appBar: CustomAppBarCopier(
        title: AppText.copier,
        leading: CustomImage(imageSrc: AppAssets.logo),
        actionIcon: CustomImage(imageSrc: AppAssets.add),
        onAction: () {},
      ),

      body: SingleChildScrollView(
        padding: ResponsiveHelper.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TabWidgetCopier(),
            gap,

          ],
        ),
      ),
    );
  }

}
