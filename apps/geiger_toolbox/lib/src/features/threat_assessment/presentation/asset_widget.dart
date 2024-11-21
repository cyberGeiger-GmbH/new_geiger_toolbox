import 'package:core_ui/organisms/list/app_assets_icons.dart';
import 'package:flutter/material.dart';

class AssetWidget extends StatelessWidget {
  const AssetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppAssetsIcons.filledTonal(
      context: context,
    );
  }
}
