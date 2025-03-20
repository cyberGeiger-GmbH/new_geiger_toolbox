import 'package:core_ui/tokens/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:geiger_toolbox/src/features/threat_assessment/presentation/monitoring/news/all_news_widget.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/monitoring/todos/todo_list_widget.dart';

import 'package:geiger_toolbox/src/features/threat_assessment/presentation/scanning/scan_button_controller.dart';
import 'package:geiger_toolbox/src/routing/layout/welcome_widget.dart';

class TodoLayout extends ConsumerWidget {
  const TodoLayout({super.key, required this.isNewsFeedEmpty});

  final bool isNewsFeedEmpty;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isScanning = ref.watch(scanButtonControllerProvider);
    final theme = Theme.of(context);
    final backgroundColor = theme.colorScheme.surface;
    return Column(
      children: [
        Spacing.gapH12,
        isNewsFeedEmpty
            ? WelcomeNoteWidget(isScanning: isScanning.isLoading, backgroundColor: backgroundColor)
            : TodoListWidget(backgroundColor: backgroundColor),
        Spacing.gapH12,
        const AllNewsWidget(),
        Spacing.gapH12,
      ],
    );
  }
}
