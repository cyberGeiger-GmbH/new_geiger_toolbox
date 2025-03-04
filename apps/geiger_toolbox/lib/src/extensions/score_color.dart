import 'package:flutter/material.dart';

extension ThemeColorExtension on ThemeData {
  Color getScoreColor(int score) {
    if (score < 0 || score > 100) {
      throw ArgumentError('Score must be between 0 and 100');
    }

    if (score <= 40) {
      return colorScheme.error;
      // Poor score
    } else if (score <= 60) {
      return Colors.orange;
      // Average score
    } else {
      return colorScheme.primary; // Good score
    }
  }
}
