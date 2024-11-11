import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class GoldenTestWrapper extends StatelessWidget {
  const GoldenTestWrapper({super.key, required this.getChild});

  final Widget Function(BuildContext) getChild;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        extensions: [
          AppColorsTheme.light(),
          AppTextStyleTheme.main(),
          AppImagesTheme.main(),
          AppIconsTheme.main()
        ],
      ),
      child: Builder(builder: getChild),
    );
  }
}
