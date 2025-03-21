import 'package:core_ui/molecules/texts/app_text.dart';
import 'package:core_ui/tokens/spacing.dart';
import 'package:flutter/material.dart';

class ItemListTile extends StatelessWidget {
  const ItemListTile({super.key, required this.title, this.subtitle, this.status = false, this.trailing, this.leading});
  final String title;
  final Widget? subtitle;
  final Widget? trailing;
  final Widget? leading;
  final bool status;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: Spacing.p4,

      leading: leading,
      title: ListTitle(title: title, crossTitle: status),
      subtitle: subtitle,
      trailing: trailing,
      contentPadding: const EdgeInsets.symmetric(horizontal: Spacing.p12),
    );
  }
}

class ListTitle extends StatelessWidget {
  const ListTitle({super.key, required this.title, required this.crossTitle});
  final String title;
  final bool crossTitle;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appColorScheme = theme.colorScheme;
    return AppText.bodyMedium(
      text: title,
      context: context,
      textAlign: TextAlign.start,
      color: crossTitle ? theme.hintColor : appColorScheme.onSurface,
      textRemoved: crossTitle,
      fontWeight: FontWeight.bold,
    );
  }
}
