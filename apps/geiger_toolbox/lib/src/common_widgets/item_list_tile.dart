import 'package:core_ui/core_ui.dart';
import 'package:core_ui/molecules/texts/app_text.dart';
import 'package:flutter/material.dart';
import 'package:geiger_toolbox/src/common_widgets/list_title.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/domain/todo_offering.dart';

class ItemListTile extends StatelessWidget {
  const ItemListTile({super.key, required this.title, this.subtitle, this.status, required this.trailing});
  final String title;
  final String? subtitle;
  final Widget trailing;
  final Status? status;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      title: ListTitle(title: title, crossTitle: status == Status.done),
      subtitle:
          subtitle != null
              ? AppText.bodySmall(
                text: subtitle!,
                context: context,
                lintThrough: status == Status.done,
                color: status == Status.done ? theme.hintColor : null,
              )
              : null,
      trailing: trailing,
      contentPadding: EdgeInsets.symmetric(horizontal: Spacing.p8),
    );
  }
}
