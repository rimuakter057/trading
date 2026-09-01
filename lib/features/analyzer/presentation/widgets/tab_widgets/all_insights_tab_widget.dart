import 'package:flutter/material.dart';
import 'package:trading/features/analyzer/presentation/widgets/all_insights_card_widget.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';
import 'package:trading/share/widgets/custom_container/custom_container.dart';
import 'package:trading/utils/app_colors/app_colors.dart';



class AllInsightsTabWidget extends StatelessWidget {
  const AllInsightsTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Widget gap=SizedBox(height: ResponsiveHelper.height(12),);
    return Column(
      children: [
        CustomContainer(
            borderColor: AppColors.boarderColor,
            child: Column(
              children: [
                AllInsightsCardWidget(),
                gap,
                AllInsightsCardWidget(),
                gap,
                AllInsightsCardWidget(),


              ],
            )),
      ],
    );
  }
}


