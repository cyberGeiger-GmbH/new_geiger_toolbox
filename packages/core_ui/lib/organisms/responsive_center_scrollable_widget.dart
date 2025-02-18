import 'package:core_ui/tokens/breakpoints.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// A responsive centered scrollable layout that solves the problem described here:
/// https://rydmike.com/blog_layout_and_theming
/// Note that if a non-null ScrollController is given, it must be passed as a
/// controller to the child widget otherwise you will get this error:
/// "ScrollController not attached to any scroll views."
/// Example usage:
///
/// ```dart
/// final controller = ScrollController();
/// return ResponsiveCenterScrollable(
///   controller: controller,
///   child: ListView.builder(
///     controller: controller,
///     ...
///   ),
/// )
/// ```
///
class ResponsiveCenterScrollableWidget extends StatelessWidget {
  const ResponsiveCenterScrollableWidget({
    super.key,
    this.maxContentWidth = BreakPoints.tablet,
    this.padding = EdgeInsets.zero,
    this.controller,
    required this.child,
  });
  final double maxContentWidth;
  final EdgeInsetsGeometry padding;
  final ScrollController? controller;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerSignal: (pointerSignal) {
        final c = controller;
        if (pointerSignal is PointerScrollEvent && c != null) {
          final newOffset = c.offset + pointerSignal.scrollDelta.dy;
          if (newOffset < c.position.minScrollExtent) {
            c.jumpTo(c.position.minScrollExtent);
          } else if (newOffset > c.position.maxScrollExtent) {
            c.jumpTo(c.position.maxScrollExtent);
          } else {
            c.jumpTo(newOffset);
          }
        }
      },
      child: Scrollbar(
        controller: controller,
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: maxContentWidth),
            child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: Padding(padding: padding, child: child),
            ),
          ),
        ),
      ),
    );
  }
}
