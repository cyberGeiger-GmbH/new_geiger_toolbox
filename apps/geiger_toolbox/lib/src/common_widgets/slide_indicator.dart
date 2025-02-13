import 'package:core_ui/tokens/spacing.dart';
import 'package:flutter/material.dart';

class SlideIndicator<T> extends StatelessWidget {
  const SlideIndicator({
    super.key,
    required this.data,
    required this.current,
  });

  final List<T> data;
  final int current;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: data.asMap().entries.map((entry) {
        return Dot(
          current: current,
          next: entry.key,
        );
      }).toList(),
    );
  }
}

class Dot extends StatelessWidget {
  const Dot({
    super.key,
    required this.current,
    required this.next,
  });

  final int current;
  final int next;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: Spacing.p12,
          height: Spacing.p12,
          margin: const EdgeInsets.symmetric(
              vertical: Spacing.p8, horizontal: Spacing.p4),
          decoration: botBoDecoration(context),
        ),
      ],
    );
  }

  BoxDecoration botBoDecoration(BuildContext context) {
    return BoxDecoration(
      shape: BoxShape.circle,
      color: (Theme.of(context).brightness == Brightness.dark
              ? Colors.white
              : Colors.black)
          // ignore: no-magic-number
          .withValues(alpha: current == next ? 0.9 : 0.4),
    );
  }
}
