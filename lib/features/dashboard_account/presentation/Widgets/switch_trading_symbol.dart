import 'package:flutter/material.dart';
import 'package:trading/utils/extension/base_extension.dart';

import 'custom_switch_button.dart';



class TradingSymbolWidget extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  const TradingSymbolWidget({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: context.titleSmall),
        CustomTealSwitch(
          value: value,
          onChanged: onChanged,
        ),
      ],
    );
  }
}