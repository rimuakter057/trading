import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trading/features/copier/presentation/widgets/custom_appbar_copier.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';
import 'package:trading/share/widgets/custom_divider/custom_divider.dart';
import 'package:trading/share/widgets/custom_image/custom_image.dart';
import 'package:trading/share/widgets/custom_svg_icon/custom_svg_icon.dart';
import 'package:trading/share/widgets/custom_text_field/custom_text_field.dart';
import 'package:trading/share/widgets/custom_text_field_parent/custom_text_field_parent.dart';
import 'package:trading/utils/app_assets/app_assets.dart';
import 'package:trading/utils/app_text/app_strings.dart';

class FilterPropScreen extends StatelessWidget {
   FilterPropScreen({super.key});
  final TextEditingController nameController =TextEditingController();
  final TextEditingController phoneController =TextEditingController();
  final TextEditingController countryController =TextEditingController();
  final TextEditingController referController =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarCopier(title: AppText.filterPropFirms),

      body: SingleChildScrollView(
        child: Padding(
          padding:  ResponsiveHelper.all(16),
          child: Column(
            children: [
        
              CustomContainerBorderParent(
                child: Column(
                  children: [
                    // full name===============================
                    CustomTextField(
                      labelText: AppText.fullName,
                      suffixWidget: CustomImage(
                        imageSrc: AppAssets.dropdown,
        
                      ),
        
                      controller: nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "This field cannot be empty";
                        }
                        return null;
                      },
                    ),
                    CustomDivider(),
                    // phone number===============================
                    CustomTextField(
                      labelText: AppText.phoneNumber,
                      suffixWidget: CustomImage(
                        imageSrc: AppAssets.dropdown,
                      ),
                      controller: phoneController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "This field cannot be empty";
                        }
                        return null;
                      },
                    ),
                    CustomDivider(),
                    // country===============================
                    CustomTextField(
                      labelText: AppText.countryRegion,
        
                      controller: countryController,
                      suffixWidget: CustomImage(
                        imageSrc: AppAssets.dropdown,
        
                      ),
        
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "This field cannot be empty";
                        }
                        return null;
                      },
        
                      ),
        
        
                    CustomDivider(),
                    // referral code===============================
                    CustomTextField(
                      labelText: AppText.referralCode,
                      suffixWidget: CustomImage(
                        imageSrc: AppAssets.dropdown,
        
                      ),
                      controller: referController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "This field cannot be empty";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              
              SizedBox(height: ResponsiveHelper.height(120),),
              ElevatedButton(onPressed: (){}, child: Text(AppText.applyFilter)),
        
            ],
        
          ),
        ),
      ),

    );
  }
}
