library core_ui;

import 'package:core_ui/tokens/spacing.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'app_spacing.freezed.dart';

@freezed
class AppSpacing with _$AppSpacing {
  const AppSpacing._();

  const factory AppSpacing(
      {required double xsmall,
      required double small,
      required double medium,
      required double big,
      required double large}) = _AppSpacing;

  factory AppSpacing.reqular() => const AppSpacing(
      xsmall: Spacing.xs,
      small: Spacing.sm,
      medium: Spacing.md,
      big: Spacing.xmd,
      large: Spacing.lg);

  AppEdgeInsetsSpacing get asInsets => AppEdgeInsetsSpacing(spacing: this);
}

@freezed
class AppEdgeInsetsSpacing with _$AppEdgeInsetsSpacing {
  const AppEdgeInsetsSpacing._();
  const factory AppEdgeInsetsSpacing({required AppSpacing spacing}) =
      _AppEdgeInsetsSpacing;

  EdgeInsets get xsmall => EdgeInsets.all(spacing.xsmall);
  EdgeInsets get small => EdgeInsets.all(spacing.small);
  EdgeInsets get medium => EdgeInsets.all(spacing.medium);
  EdgeInsets get big => EdgeInsets.all(spacing.big);
  EdgeInsets get large => EdgeInsets.all(spacing.large);
}
