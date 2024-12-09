import 'package:flutter/material.dart';
import '../tokens/spacing.dart';

class Utils {
  const Utils._();
  static BoxDecoration getDecoration(ColorScheme appColors) {
    return BoxDecoration(
      color: appColors.surface,
      borderRadius: const BorderRadius.all(Radius.circular(Spacing.p8)),
      boxShadow: [
        BoxShadow(
          // ignore: no-magic-number
          color: Colors.grey.withOpacity(0.2),
          // ignore: no-magic-number
          blurRadius: 6,
          offset: const Offset(0, 3), // Shadow position
        ),
      ],
      border: Border.all(color: appColors.tertiary), // Optional border
    );
  }

  static BoxShadow getBoxShadow(ColorScheme appColors) {
    return BoxShadow(
      // ignore: no-magic-number
      color: Colors.grey.withOpacity(0.2),
      // ignore: no-magic-number
      blurRadius: 6,
      offset: const Offset(0, 3), // Shadow position
    );
  }
}
