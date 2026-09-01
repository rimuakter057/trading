import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:trading/features/copier/presentation/widgets/custom_search_field.dart';
import 'package:trading/features/copier/presentation/widgets/master_account_card.dart';
import 'package:trading/features/common/presentation/widgets/title_text_widget.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';
import 'package:trading/share/widgets/custom_container/custom_container.dart';
import 'package:trading/utils/app_colors/app_colors.dart';
import 'package:trading/utils/app_text/app_strings.dart';
import 'package:get/get.dart';

class AccountTabWidget extends StatelessWidget {
  const AccountTabWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [


        CustomSearchField(),



        SizedBox(height: ResponsiveHelper.height(20)),

        /// Master Account Section
        TitleTextWidget(title: AppText.masterAccount),
        CustomContainer(
          backgroundColor: AppColors.white,
          borderColor: AppColors.boarderColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildSectionHeader("Enabled (03)"),
              GestureDetector(
                onTap: () {
                  Get.toNamed('/masterAccountScreen');
                },
                child: const MasterAccountCardAnalyzer(
                  title: "Master Account 1",
                  enabled: 7,
                  disabled: 3,
                ),
              ),
              SizedBox(height: ResponsiveHelper.height(12)),
              const MasterAccountCardAnalyzer(
                title: "Master Account 2",
                enabled: 7,
                disabled: 3,
              ),
            ],
          ),
        ),
        SizedBox(height: ResponsiveHelper.height(18)),



      ],
    );
  }



  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        style: const TextStyle(color: Colors.grey, fontSize: 12),
      ),
    );
  }
}

