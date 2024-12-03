import 'package:flutter/material.dart';

import '../foundation/app_colors.dart';
import '../tokens/spacing.dart';

class Utils {
  const Utils._();
  static BoxDecoration getDecoration(AppColors appColors) {

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

  static BoxShadow getBoxShadow(AppColors appColors) {
    return BoxShadow(
      // ignore: no-magic-number
      color: Colors.grey.withOpacity(0.2),
      // ignore: no-magic-number
      blurRadius: 6,
      offset: const Offset(0, 3), // Shadow position
    );
  }
}
