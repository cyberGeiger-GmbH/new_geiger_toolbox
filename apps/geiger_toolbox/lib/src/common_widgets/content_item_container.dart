import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class ContentItemContainer extends StatelessWidget {
  const ContentItemContainer({super.key, required this.items, this.explanation, this.backgroundColor});
  final List<Widget> items;
  final String? explanation;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appColors = theme.colorScheme;
    return Column(
      children: [
        Card(
          color: backgroundColor ?? appColors.onInverseSurface,
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Spacing.p16)),
          margin: EdgeInsets.zero,
          child: Column(mainAxisSize: MainAxisSize.min, children: items),
        ),
        if (explanation != null) ContentItemContainerWithExplanation(explanation: explanation!),
      ],
    );
  }
}

class ContentItemContainerWithExplanation extends StatelessWidget {
  const ContentItemContainerWithExplanation({super.key, required this.explanation});
  final String explanation;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final hint = theme.hintColor;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Spacing.p8),
      child: Column(
        children: [
          Spacing.gapH16,
          AppText.bodySmall(
            text: explanation,
            context: context,
            color: hint,

            textStyle: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
