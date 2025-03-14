import 'package:core_ui/tokens/spacing.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingAnimation extends StatelessWidget {
  const LoadingAnimation({super.key, this.color, this.size});
  final Color? color;
  final double? size;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return LoadingAnimationWidget.staggeredDotsWave(color: color ?? colorScheme.primary, size: size ?? Spacing.p32);
  }
}
