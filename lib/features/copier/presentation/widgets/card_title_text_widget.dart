import 'package:flutter/material.dart';
import 'package:trading/utils/extension/base_extension.dart';


class CardTitleTextWidget extends StatelessWidget {
  final String title;
  const CardTitleTextWidget({
    super.key, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(title, style: context.bodySmall.copyWith(fontWeight: FontWeight.w600));
  }
}
