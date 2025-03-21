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
              : PaddedContainer(child: body),
      floatingActionButton: floatingActionButton,
    );
  }
}

class PaddedContainer extends StatelessWidget {
  const PaddedContainer({super.key, required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.symmetric(horizontal: Spacing.p16, vertical: Spacing.p8), child: child);
  }
}

class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    //final Color primary = appTheme.colorScheme.primary;
    final Color onPrimary = appTheme.colorScheme.onPrimary;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            appTheme.colorScheme.primaryContainer,

            // const Color(0xFFBAE8BF), // light green
            onPrimary, // white at the bottom
          ],
          stops: const [0.7, 1.0], // adjust for smoother fade
        ),
      ),
      child: PaddedContainer(child: child),
    );
  }
}
