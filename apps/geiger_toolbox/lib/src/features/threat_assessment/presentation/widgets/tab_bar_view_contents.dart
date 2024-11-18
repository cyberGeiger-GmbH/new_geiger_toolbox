import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class TabBarViewContents extends StatelessWidget {
  const TabBarViewContents({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).appColors.appColor;
    return Expanded(
      child: TabBarView(
        children: [
          EmptyContent(color: color.primary),
          EmptyContent(color: color.primary),
          EmptyContent(color: color.primary),
          EmptyContent(color: color.primary),
        ],
      ),
    );
  }
}
