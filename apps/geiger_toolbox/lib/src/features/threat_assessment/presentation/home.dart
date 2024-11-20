import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import 'widgets/news_feeds.dart';

//home screen
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).appColors.appColor;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Spacing.gapH32,
        AppButton.scan(
          label: 'Scan',
          context: context,
          onPressed: () {},
        ),
        Spacing.gapH16,
        const CarouselWithIndicatorDemo(),
        Spacing.gapH16,
        AppAssetsIcons.filledTonal(
          context: context,
        ),
        Spacing.gapH16,
        Padding(
          padding: const EdgeInsets.all(Spacing.p12),
          child: EmptyContent(
            message:
                "Press the Geiger Scan Botton to get your protection score",
            color: appColors.defaultColor,
          ),
        )
      ],
    );
  }
}
