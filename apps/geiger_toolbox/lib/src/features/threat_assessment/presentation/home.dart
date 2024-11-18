import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/widgets/tab_bar_icons.dart';

import 'widgets/news_feeds.dart';
import 'widgets/tab_bar_view_contents.dart';

//home screen
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // mainAxisSize: MainAxisSize.min,
        children: [
          Spacing.gapH32,
          AppButton.scan(
            label: 'Scan',
            context: context,
            onPressed: () {},
          ),
          Spacing.gapH32,
          const CarouselWithIndicatorDemo(),
          Spacing.gapH16,
          const TabBarIcons(),
          const TabBarViewContents(),
        ],
      ),
    );
  }
}
