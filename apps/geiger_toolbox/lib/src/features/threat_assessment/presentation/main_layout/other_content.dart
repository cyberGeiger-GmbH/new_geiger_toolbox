import 'package:core_ui/tokens/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/monitoring/news/all_news_widget.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/monitoring/todos/todo_list_widget.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/news_feeds/news_feeds_widget.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/scanning/scan_button_controller.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/main_layout/welcome_widget.dart';

class OtherContent extends ConsumerWidget {
  const OtherContent({super.key, required this.heightFraction, required this.isNewsFeedEmpty});
  final double heightFraction;
  final bool isNewsFeedEmpty;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isScanning = ref.watch(scanButtonControllerProvider);

    final height = heightFraction;

    return SizedBox(
      height: height,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          isNewsFeedEmpty ? WelcomeNoteWidget(isScanning: isScanning.isLoading) : const SizedBox.shrink(),
          NewsFeedsWidget(),
          Spacing.gapH12,
          const TodoListWidget(),
          Spacing.gapH12,
          const AllNewsWidget(),
          Spacing.gapH12,
        ],
      ),
    );
  }
}
