import 'package:core_ui/foundation/themes/extension.dart';
import 'package:core_ui/molecules/cards/protection_tile.dart';
import 'package:flutter/material.dart';

class ProtectionTileList extends StatelessWidget {
  const ProtectionTileList({super.key, required this.data});
  final List<String> data;
  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).appColors.appColor;

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: appColors.onTertiaryContainer),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ListView.separated(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemBuilder: (context, index) => ProtectionTile.plain(
                title: data[index],
                onPressed: () {
                  debugPrint("using gorouter $index");
                },
              ),
          separatorBuilder: (_, __) => const Divider(),
          itemCount: data.length),
    );
  }
}
