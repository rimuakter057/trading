import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';
import 'package:trading/share/widgets/custom_image/custom_image.dart';
import 'package:trading/share/widgets/custom_text_field_parent/custom_text_field_parent.dart';
import 'package:trading/utils/app_assets/app_assets.dart';
import 'package:trading/utils/extension/base_extension.dart';


class PaymentMethodeWidget extends StatelessWidget {
  const PaymentMethodeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomContainerBorderParent(
      vertical: ResponsiveHelper.height(15),
      horizontal:  ResponsiveHelper.width(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  "Visa ending in 1234",
                  style: context.titleSmall.copyWith(
                      fontSize:  ResponsiveHelper.fontSize(15),
                  )
              ),
              Text("Expiry 06/2027", style: context.bodySmall),
            ],
          ),

          Row(
            children: [
              CustomImage(imageSrc: AppAssets.checkProfile,
                height:  ResponsiveHelper.height(24),
                width:  ResponsiveHelper.width(24),
              ),
              SizedBox(width:  ResponsiveHelper.width(12),),
              CustomImage(imageSrc: AppAssets.deleteProfile),


            ],
          ),
        ],
      ),
    );
  }
}