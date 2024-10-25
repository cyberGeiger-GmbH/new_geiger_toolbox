library core_ui;

import 'package:core_ui/tokens/core_color.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'app_colors.freezed.dart';

//part 'app_colors.g.dart';

@freezed
class AppColors with _$AppColors {
  const factory AppColors(
      {required Color foreground, required Color background}) = _AppColors;

  factory AppColors.light() => const AppColors(
      foreground: CoreColor.onPrimary, background: CoreColor.primary);

  factory AppColors.dark() => const AppColors(
      foreground: CoreColor.onPrimaryDm, background: CoreColor.primaryDm);
}
