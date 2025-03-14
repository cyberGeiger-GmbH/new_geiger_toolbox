import 'package:core_ui/tokens/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/common_widgets/async_value_widget.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/applications/news_feed_service.dart';

typedef WidgetBuilderLayout = Widget Function(BuildContext context, double height, bool isNewsFeedEmpty);

// layout of the main screen
class MainScreenLayout extends ConsumerWidget {
  final WidgetBuilderLayout topContent;
  final WidgetBuilderLayout otherContent;
  const MainScreenLayout({super.key, required this.topContent, required this.otherContent});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsFeedValue = ref.watch(watchRecentNewsFeedsProvider);
    final oneThirdHeight = MediaQuery.sizeOf(context).height / 3;
    double twoThirdHeight = MediaQuery.sizeOf(context).height * (2 / 3);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Spacing.p16, vertical: Spacing.p8),
      child: AsyncValueWidget(
        value: newsFeedValue,
        data:
            (data) => Column(
              children: [
                //for testing
                // Container(color: Colors.green, child: topContent(context, oneThirdHeight, data.isEmpty)),
                topContent(context, oneThirdHeight, data.isEmpty),
                // //for testing
                // Container(color: Colors.amber, child: otherContent(context, twoThirdHeight, data.isEmpty)),
                otherContent(context, twoThirdHeight, data.isEmpty),
              ],
            ),
      ),
    );
  }
}
