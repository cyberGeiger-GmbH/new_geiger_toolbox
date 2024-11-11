import 'package:core_ui/organisms/responsive_center.dart';
import 'package:core_ui/tokens/breakpoints.dart';
import 'package:flutter/material.dart';

import '../tokens/spacing.dart';

/// Scrollable widget that shows a responsive [Card] with a given child widget.
/// Useful for displaying forms and other widgets that need to be scrollable.
class ResponsiveScrollableCard extends StatelessWidget {
  const ResponsiveScrollableCard({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ResponsiveCenter(
        maxCententWidth: BreakPoints.tablet,
        child: Padding(
          padding: const EdgeInsets.all(Spacing.p16),
          child: Card(
              child: Padding(
            padding: const EdgeInsets.all(Spacing.p16),
            child: child,
          )),
        ),
      ),
    );
  }
}
