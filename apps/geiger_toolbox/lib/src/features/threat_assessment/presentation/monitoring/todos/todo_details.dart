import 'package:core_ui/core_ui.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/domain/todo_offering.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/monitoring/todos/todo_controller.dart';
import 'package:geiger_toolbox/src/utils/url_launcher_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class TodoDetails extends ConsumerWidget {
  const TodoDetails({super.key, required this.item});
  final TodoOffering item;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final textSpanStyle = theme.textTheme.bodyMedium?.copyWith(
      //fontSize: TypoSize.bodySmall,
      fontWeight: FontWeight.w700,
      color: Colors.blue,
    );
    return SingleChildScrollView(
      child: Column(
        children: [
          RichText(
            text: TextSpan(
              text: item.offering.summary,
              children: [
                TextSpan(text: "\nUse our cyberCoach on  "),
                TextSpan(
                  text: "Telegram ",
                  style: textSpanStyle,
                  recognizer: TapGestureRecognizer()..onTap = () => openTelegram(ref),
                ),
                TextSpan(text: "for more detailed instructions."),
              ],
              style: theme.textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }

  void openTelegram(WidgetRef ref) {
    ref
        .read(urlLauncherProvider)
        .launch(
          Uri.parse("https://t.me/TestCyberSecChatBot"),
          // * Open app store app directly (or fallback to browser)
          mode: LaunchMode.inAppBrowserView
        );
  }
}

class TodoActionBar extends ConsumerWidget {
  const TodoActionBar({super.key, required this.item});
  final TodoOffering item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    final done = item.status == Status.done;

    final state = ref.watch(todoControllerProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        AppButton.primarySmall(
          label: done ? "Undo" : "Done",
          context: context,
          color: done ? theme.colorScheme.tertiary : null,
          isLoading: state.isLoading,
          onPressed: () {
            ref
                .read(todoControllerProvider.notifier)
                .makeAsDone(id: item.id, status: done ? Status.planned : Status.done, onSuccess: context.pop);
          },
        ),
        Spacing.gapH12,
        AppButton.deleteSmall(
          label: "Remove",
          context: context,
          isLoading: state.isLoading,
          onPressed: () {
            ref.read(todoControllerProvider.notifier).removeTodo(item, onSuccess: context.pop);
          },
        ),
      ],
    );
  }
}
