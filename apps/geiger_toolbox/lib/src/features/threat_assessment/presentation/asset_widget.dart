import 'package:core_ui/organisms/list/app_assets_icons.dart';
import 'package:flutter/material.dart';
import 'package:geiger_toolbox/main.dart';
import 'package:geiger_toolbox/src/common_widgets/alert_dialogs.dart';
import 'package:geiger_toolbox/src/localization/string_hardcoded.dart';

class AssetWidget extends StatelessWidget {
  const AssetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppAssetsIcons.filledTonal(
      context: context,
      addDevices: () {
        showNotImplementedAlertDialog(
            context: context,
            title: "Devices",
            content: "No devices yet!".hardcoded);
      },
      addNetwork: () {
        showNotImplementedAlertDialog(
            context: context,
            title: "Network Monitoring",
            content: "No network yet!".hardcoded);
      },
      checkPhishing: () {
        showNotImplementedAlertDialog(
            context: context,
            title: "Detect Phishing",
            content: "Not active yet!".hardcoded);
      },
    );
  }
}
