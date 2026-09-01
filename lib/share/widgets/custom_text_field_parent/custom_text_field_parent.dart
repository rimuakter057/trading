import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trading/share/widgets/custom_container/custom_container.dart';
import 'package:trading/utils/app_colors/app_colors.dart';


class CustomContainerBorderParent extends StatelessWidget {
  const CustomContainerBorderParent({
    super.key, required this.child, this.horizontal, this.vertical, this.borderColor, this.marginTop, this.marginBottom, this.marginLeft, this.marginRight,
  });

  final Widget child;
  final double? horizontal;
  final double? vertical;
  final Color?borderColor;
  final double? marginTop;
  final double? marginBottom;
  final double? marginLeft;
  final double? marginRight;



  @override
  Widget build(BuildContext context) {
    return CustomContainer(

          horizontal:horizontal?? 0,
          vertical:vertical?? 0,

        margin:EdgeInsets.only(
          left: marginLeft??0,
          right: marginRight??0,
          top: marginTop??0,
          bottom: marginBottom??0
        ) ,
        radius: 8.r,
        borderColor:borderColor?? AppColors.boarderTextField,
        width: double.infinity,

        child: child
    );
  }
}