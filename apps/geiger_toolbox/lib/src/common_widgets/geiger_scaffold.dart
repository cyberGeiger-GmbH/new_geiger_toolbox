import 'package:core_ui/tokens/spacing.dart';
import 'package:flutter/material.dart';
import 'package:geiger_toolbox/src/common_widgets/geiger_app_bar.dart';

class GeigerScaffold extends StatelessWidget {
  const GeigerScaffold({super.key, required this.body, this.appBar});
  final Widget body;
  final GeigerAppBar? appBar;
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: appBar, body: Padding(padding: EdgeInsets.symmetric(horizontal: Spacing.p12), child: body));
  }
}
