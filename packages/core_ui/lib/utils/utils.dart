import 'package:flutter/material.dart';

import '../foundation/app_colors.dart';
import '../tokens/spacing.dart';

class Utils {
  const Utils._();

  static BoxDecoration getDecoration(AppColors appColors) {
    return BoxDecoration(
      color: appColors.surface,
      borderRadius: BorderRadius.circular(Spacing.p8),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          blurRadius: 6,
          offset: const Offset(0, 3), // Shadow position
        ),
      ],
      border: Border.all(color: appColors.tertiary), // Optional border
    );
  }
}
