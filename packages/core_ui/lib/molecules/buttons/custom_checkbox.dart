import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({super.key, required this.onChanged, required this.value});
  final bool value;
  final ValueChanged<bool?> onChanged;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Platform.isIOS
        ? CupertinoButton(
          sizeStyle: CupertinoButtonSize.small,
          padding: EdgeInsets.zero,
          child: Icon(
            value ? CupertinoIcons.checkmark_square_fill : CupertinoIcons.square,
            color: value ? colorScheme.primary : colorScheme.surfaceDim,

            size: 28,
          ),
          onPressed: () => onChanged(!value),
        )
        : Padding(padding: EdgeInsets.zero, child: Checkbox(onChanged: (value) => onChanged(value), value: value));
  }
}
