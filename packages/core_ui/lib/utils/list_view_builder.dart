import 'package:core_ui/foundation/themes/theme_data_extended.dart';
import 'package:core_ui/utils/utils.dart';
import 'package:flutter/material.dart';

import 'typedef.dart';

class ListViewBuilder<T> extends StatelessWidget {
  const ListViewBuilder._(
      {super.key,
      required this.itemBuilder,
      required this.length,
      this.decoration});

  factory ListViewBuilder.plain(
      {required ItemBuilder itemBuilder, required int length}) {
    return ListViewBuilder._(itemBuilder: itemBuilder, length: length);
  }
  factory ListViewBuilder.outlined(
      {required ItemBuilder itemBuilder,
      required int length,
      required BuildContext context}) {
    final appColors = Theme.of(context).appColors.appColor;

    return ListViewBuilder._(
      itemBuilder: itemBuilder,
      length: length,
      decoration: Utils.getDecoration(appColors),
    );
  }

  final int length;
  final ItemBuilder itemBuilder;
  final BoxDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 100,
      decoration: decoration,
      child: ListView.separated(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemBuilder: (context, index) => itemBuilder(context, index),
          separatorBuilder: (_, __) => const Divider(),
          itemCount: length),
    );
  }
}
