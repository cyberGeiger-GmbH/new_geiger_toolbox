import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/common_widgets/async_value_widget.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/applications/news_feed_service.dart';

typedef WidgetBuilderLayout = Widget Function(BuildContext context, double height, bool isNewsFeedEmpty);

// layout of the main screen
class MainLayout extends ConsumerWidget {
  final WidgetBuilderLayout topLayout;
  final WidgetBuilderLayout newsLayout;
  final WidgetBuilderLayout todoLayout;
  const MainLayout({super.key, required this.topLayout, required this.newsLayout, required this.todoLayout});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsFeedValue = ref.watch(watchRecentNewsFeedsProvider);
    final constraint = MediaQuery.sizeOf(context);
    final oneThirdHeight = constraint.height * (1 / 3);
    final oneFunfHeight = constraint.height * (1 / 3.6);
    double remainingHeight = constraint.height;
    return GradientContainer(
      child: AsyncValueWidget(
        value: newsFeedValue,
        data: (data) {
          final isNewsAvailable = data.isEmpty;
          return Column(
            children: [
              //for testing
              // Container(color: Colors.green, child: topLayout(context, oneThirdHeight, isNewsAvailable)),
              topLayout(context, oneThirdHeight, isNewsAvailable),
              // //for testing
              newsLayout(context, oneFunfHeight, isNewsAvailable),
              // Container(color: Colors.black12, child: newsLayout(context, oneFunfHeight, isNewsAvailable)),
              // Container(color: Colors.amber, child: todoLayout(context, remainingHeight, isNewsAvailable)),
              todoLayout(context, remainingHeight, isNewsAvailable),
            ],
          );
        },
      ),
    );
  }
}
