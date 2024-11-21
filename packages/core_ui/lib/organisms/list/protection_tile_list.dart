import 'package:core_ui/core_ui.dart';
import 'package:core_ui/molecules/cards/protection_tile.dart';

import 'package:flutter/material.dart';

class ProtectionTileListView extends StatelessWidget {
  const ProtectionTileListView({super.key, required this.data});
  final List<String> data;
  @override
  Widget build(BuildContext context) {
    return ListViewBuilder.outlined(
      context: context,
      length: data.length,
      itemBuilder: (context, index) => ProtectionTile.plain(
        title: data[index],
        onPressed: () {
          debugPrint("use goRouter $index");
        },
      ),
    );
  }
}

class ProtectionTileList extends StatelessWidget {
  const ProtectionTileList({super.key, required this.data});
  final List<String> data;
  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).appColors.appColor;
    return Container(
      decoration: Utils.getDecoration(appColors),
      child: Column(
          children: ListTile.divideTiles(
                  context: context,
                  tiles:
                      data.map((value) => ProtectionTile.plain(title: value)))
              .toList()),
    );
  }
}

class ProtectionTileListWithTitle extends StatelessWidget {
  const ProtectionTileListWithTitle(
      {super.key, required this.title, required this.widget});

  final String title;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).appColors.appColor;
    final appTextStyle = Theme.of(context).appTextStyles.appTextStyle;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: appTextStyle.titleMedium.copyWith(
                color: appColors.defaultColor, fontWeight: FontWeight.bold)),
        Spacing.gapH8,
        widget
      ],
    );
  }
}
