import 'package:core_ui/organisms/list/app_assets_icons.dart';
import 'package:flutter/material.dart';
import 'package:geiger_toolbox/src/common_widgets/alert_dialogs.dart';

class AssetWidget extends StatelessWidget {
  const AssetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppAssetsIcons.filledTonal(
      context: context,
      devices: () {
        showNotImplementedAlertDialog(context: context);
      },
      desktop: () {
        showNotImplementedAlertDialog(context: context);
      },
      wifi: () {
        showNotImplementedAlertDialog(context: context);
      },
      todos: () {
        showNotImplementedAlertDialog(context: context);
      },
    );
  }
}
