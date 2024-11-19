import 'package:core_ui/molecules/cards/protection_tile.dart';
import 'package:core_ui/utils/list_view_builder.dart';

import 'package:flutter/material.dart';

class ProtectionTileList extends StatelessWidget {
  const ProtectionTileList({super.key, required this.data});
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
