import 'package:core_ui/molecules/bars/geiger_app_bar.dart';
import 'package:core_ui/tokens/spacing.dart';
import 'package:flutter/material.dart';

class GeigerScaffold extends StatelessWidget {
  const GeigerScaffold({super.key, required this.body, this.appBar, this.floatingActionButton});
  final Widget body;
  final GeigerAppBar? appBar;
  //floating action button for testing purposes
  final Widget? floatingActionButton;
  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    return Scaffold(
      backgroundColor: appTheme.colorScheme.surface,
      appBar: appBar,
      body: Padding(padding: const EdgeInsets.symmetric(horizontal: Spacing.p16, vertical: Spacing.p16), child: body),
      floatingActionButton: floatingActionButton,
    );
  }
}
