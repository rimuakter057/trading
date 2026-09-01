import 'package:flutter/material.dart';
import 'package:trading/features/analyzer/presentation/widgets/instrument_heading_row_widget.dart';
import 'package:trading/features/analyzer/presentation/widgets/instrument_row_widget.dart';
import 'package:trading/features/common/presentation/widgets/status_outline_container.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';
import 'package:trading/share/widgets/custom_container/custom_container.dart';
import 'package:trading/share/widgets/custom_divider/custom_divider.dart';
import 'package:trading/utils/app_colors/app_colors.dart';
import 'package:trading/utils/app_text/app_strings.dart';
import 'package:trading/utils/extension/base_extension.dart';

class InstrumentRoiTabWidget extends StatelessWidget {
  const InstrumentRoiTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Widget gap =SizedBox(height: ResponsiveHelper.height(24));
    return CustomContainer(
      borderColor: AppColors.grey,

      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomContainer(
              backgroundColor: AppColors.backgroundColor,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InstrumentHeadingRow(
                    title: AppText.xauUsd,
                    subtitle: AppText.bestInstrument,
                  ),
                       SizedBox(height: ResponsiveHelper.height(16),),
                  InstrumentRowWidget(
                    title: AppText.roi,
                    number: "+18.2%",
                    color: AppColors.primary,
                  ),
                  CustomDivider(),
                  InstrumentRowWidget(title: AppText.trades, number: "+18.2%"),
                  CustomDivider(),
                  InstrumentRowWidget(title: AppText.winRate, number: "+18.2%"),
                  CustomDivider(),
                  InstrumentRowWidget(title: AppText.pl, number: "+18.2%"),
                  CustomDivider(),
                  InstrumentRowWidget(title: "Avg R", number: "+18.2%"),
                  CustomDivider(),
                  InstrumentRowWidget(
                    title: AppText.note,
                    number: AppText.stable,
                  ),
                ],
              ),
            ),

           gap,
            CustomContainer(
              backgroundColor: AppColors.backgroundColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InstrumentHeadingRow(
                    title: "EURUSD",
                    subtitle: "STABLE",
                  ),
                  SizedBox(height: ResponsiveHelper.height(16),),
                  InstrumentRowWidget(
                    title: AppText.roi,
                    number: "+18.2%",
                    color: AppColors.primary,
                  ),
                  CustomDivider(),
                  InstrumentRowWidget(title: AppText.trades, number: "+18.2%"),
                  CustomDivider(),
                  InstrumentRowWidget(title: AppText.winRate, number: "+18.2%"),
                  CustomDivider(),
                  InstrumentRowWidget(title: AppText.pl, number: "+18.2%"),
                  CustomDivider(),
                  InstrumentRowWidget(title: "Avg R", number: "+18.2%"),
                  CustomDivider(),
                  InstrumentRowWidget(
                    title: AppText.note,
                    number: AppText.stable,
                  ),
                ],
              ),
            ),

           gap,
            CustomContainer(
              backgroundColor: AppColors.backgroundColor,
              child: InstrumentHeadingRow(
                title: "NAS100",
                subtitle: "HIGHER VOLUME",
              ),
            ),
                 gap,
          ],
        ),
      ),
    );
  }
}


