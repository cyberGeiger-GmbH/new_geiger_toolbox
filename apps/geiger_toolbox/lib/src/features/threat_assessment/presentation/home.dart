import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import 'widgets/news_feeds.dart';

//home screen
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Spacing.gapH32,
        AppButton.scan(
          label: 'Scan',
          context: context,
          onPressed: () {},
        ),
        Spacing.gapH16,
        const CarouselWithIndicatorDemo(),
        Spacing.gapH16,
        AppAssetsIcons.filledTonal(context: context,)
      ],
    );
  }
}
