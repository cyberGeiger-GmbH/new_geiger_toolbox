import 'package:core_ui/molecules/bars/geiger_app_bar.dart';
import 'package:core_ui/tokens/spacing.dart';
import 'package:flutter/material.dart';

class GeigerScaffold extends StatelessWidget {
  const GeigerScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.floatingActionButton,
    this.isGradient = false,
  });
  final Widget body;
  final GeigerAppBar? appBar;
  final bool isGradient;
  //floating action button for testing purposes
  final Widget? floatingActionButton;
  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    return Scaffold(
      backgroundColor: appTheme.colorScheme.surface,

      appBar: appBar,
      body:
          isGradient
              ? GradientContainer(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Spacing.p16, vertical: Spacing.p8),
                  child: body,
                ),
              )
              : Padding(
                padding: const EdgeInsets.symmetric(horizontal: Spacing.p16, vertical: Spacing.p8),
                child: body,
              ),
      floatingActionButton: floatingActionButton,
    );
  }
}

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    final Color primary = appTheme.colorScheme.primary;
    final Color onPrimary = appTheme.colorScheme.onPrimary;

    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: const Alignment(0.0, -0.5), // Adjust as needed
          radius: 1.0,
          colors: [primary, onPrimary],
          stops: const [0.0, 1.0],
        ),
      ),
      child: child,
    );
  }
}
