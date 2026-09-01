import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trading/helper/responsive_helper/responsive_helper.dart';
import 'package:trading/share/widgets/custom_image/custom_image.dart' show CustomImage;
import 'package:trading/utils/app_assets/app_assets.dart';
import 'package:trading/utils/extension/base_extension.dart';


class ProfileTileWidget extends StatelessWidget {
  const ProfileTileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CustomImage(imageSrc: AppAssets.securityProfile),
            SizedBox(width:  ResponsiveHelper.width(12),),
            Text("Security",style: context.bodyMedium.copyWith(fontWeight: FontWeight.w500),),
          ],
        ),

        CustomImage(imageSrc: AppAssets.arrowFront),

      ],);
  }
}