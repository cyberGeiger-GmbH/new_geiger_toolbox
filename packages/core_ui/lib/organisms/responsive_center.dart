import 'package:flutter/material.dart';

import '../tokens/breakpoints.dart';

/// Reusable widget for showing a child with a maximum content width constraint.
/// If available width is larger than the maximum width, the child will be
/// centered.
/// If available width is smaller than the maximum width, the child use all the
/// available width.
class ResponsiveCenter extends StatelessWidget {
  const ResponsiveCenter(
      {super.key,
      this.maxCententWidth = BreakPoints.desktop,
      this.padding = EdgeInsets.zero,
      required this.child});

  final double maxCententWidth;
  final EdgeInsetsGeometry padding;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    // Use Center as it has *unconstrained* width (loose constraints)
    // together with SizedBox to specify the max width (tight constraints)
    return Center(
      child: SizedBox(
        width: maxCententWidth,
        child: Padding(
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}

/// Sliver-equivalent of [ResponsiveCenter]
class ResponsiveSliveCenter extends StatelessWidget {
  const ResponsiveSliveCenter(
      {super.key,
      this.maxContentWidth = BreakPoints.desktop,
      this.padding = EdgeInsets.zero,
      required this.child});

  final double maxContentWidth;
  final EdgeInsetsGeometry padding;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ResponsiveCenter(
        maxCententWidth: maxContentWidth,
        padding: padding,
        child: child,
      ),
    );
  }
}
