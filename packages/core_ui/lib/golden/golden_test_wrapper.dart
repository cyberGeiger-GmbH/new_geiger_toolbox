import 'package:core_ui/foundation/themes/app_theme_data.dart';
import 'package:flutter/material.dart';

class GoldenTestWrapper extends StatelessWidget {
  const GoldenTestWrapper({super.key, required this.getChild});

  final Widget Function(BuildContext) getChild;

  @override
  Widget build(BuildContext context) {
    return Theme(data: AppThemeData.light, child: Builder(builder: getChild));
  }
}
