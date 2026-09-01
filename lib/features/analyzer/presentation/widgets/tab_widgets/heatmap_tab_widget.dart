import 'package:flutter/material.dart';
import 'package:trading/features/analyzer/presentation/widgets/heatmap_card_widget.dart';
import 'package:trading/features/analyzer/presentation/widgets/rio_heat_map.dart';
import 'package:trading/features/analyzer/presentation/widgets/roi_heat_map.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';
import 'package:trading/share/widgets/custom_container/custom_container.dart';
import 'package:trading/utils/app_colors/app_colors.dart';
import 'package:trading/utils/app_text/app_strings.dart';
import 'package:trading/utils/extension/base_extension.dart';



class HeatMapTabWidget extends StatelessWidget {
  const HeatMapTabWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Widget gap= SizedBox(height: ResponsiveHelper.height(8),);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [


        const ROIHeatmap(),

        SizedBox(height: ResponsiveHelper.height(24),),

        CustomContainer(
         borderColor: AppColors.boarderColor,
          child: Column(
            children: [
              HeatMapCardWidget(),
              gap,
              HeatMapCardWidget(),
              gap,
              HeatMapCardWidget(),
              gap,
              HeatMapCardWidget(),
            ],
          ),
        ),




      ],
    );
  }
}

