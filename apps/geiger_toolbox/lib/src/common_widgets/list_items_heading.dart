import 'package:core_ui/tokens/spacing.dart';
import 'package:flutter/material.dart';
import 'package:geiger_toolbox/src/common_widgets/section_heading.dart';

class ListItemsHeading extends StatelessWidget {
  const ListItemsHeading({super.key, required this.title, required this.items});

  final String title;
  final Widget items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [SectionHeading(title: title), Spacing.gapH22, items],
    );
  }
}
