import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:geiger_toolbox/src/common_widgets/list_title.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/domain/todo_offering.dart';

class ItemListTile extends StatelessWidget {
  const ItemListTile({
    super.key,
    required this.title,
    this.subtitle,
    this.status,
    required this.trailing,
    this.leading,
  });
  final String title;
  final Widget? subtitle;
  final Widget trailing;
  final Widget? leading;
  final Status? status;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: Spacing.p4,

      leading: leading,
      title: ListTitle(title: title, crossTitle: status == Status.done),
      subtitle: subtitle,
      trailing: trailing,
      contentPadding: EdgeInsets.symmetric(horizontal: Spacing.p12),
    );
  }
}
