import 'package:flutter/material.dart';
import 'package:trading/utils/extension/base_extension.dart';

class TitleTextWidget extends StatelessWidget {
  const TitleTextWidget({
    super.key, required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
        title,
        style: context.bodyMedium
    );
  }
}