import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:geiger_toolbox/src/common_widgets/geiger_card.dart';
import 'package:geiger_toolbox/src/features/authentication/presentation/company/widgets/company_profile_form_widget.dart';

class ContentItemContainer extends StatelessWidget {
  const ContentItemContainer({super.key, required this.items, this.explanation, this.backgroundColor});
  final List<Widget> items;
  final String? explanation;
  final Color? backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (explanation != null) ContentItemContainerWithExplanation(explanation: explanation!),
        
        SectionTitle(label: "Recommended Todos"),
        GeigerCard(child: Column(mainAxisSize: MainAxisSize.min, children: items)),
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
