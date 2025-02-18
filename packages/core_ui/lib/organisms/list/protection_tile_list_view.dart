import 'package:core_ui/core_ui.dart';

import 'package:flutter/material.dart';

class ProtectionTileListView extends StatelessWidget {
  const ProtectionTileListView({super.key, required this.protectionTile});
  final List<ProtectionTile> protectionTile;
  @override
  Widget build(BuildContext context) {
    return ListViewBuilder.outlined(
      context: context,
      length: protectionTile.length,
      itemBuilder: (context, index) => protectionTile[index],
    );
  }
}

class ProtectionTileList extends StatelessWidget {
  const ProtectionTileList({super.key, required this.protectionTile});
  final List<ProtectionTile> protectionTile;
  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;

    return Container(
      decoration: Utils.getDecoration(appColors),
      child: Column(
        children: ListTile.divideTiles(context: context, tiles: protectionTile.map((widget) => widget)).toList(),
      ),
    );
  }
}

class ProtectionTileListWithTitle extends StatelessWidget {
  const ProtectionTileListWithTitle({super.key, required this.title, required this.protectionTileList});

  final String title;
  final Widget protectionTileList;

  @override
  Widget build(BuildContext context) {
    final appTextStyle = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [Text(title, style: appTextStyle.titleMedium!.copyWith()), Spacing.gapH8, protectionTileList],
    );
  }
}
