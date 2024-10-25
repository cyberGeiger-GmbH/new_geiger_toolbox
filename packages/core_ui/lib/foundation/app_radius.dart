library core_ui;

import 'package:core_ui/tokens/radius_sizes.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'app_radius.freezed.dart';

@freezed
class AppRadius with _$AppRadius {
  const AppRadius._();

  const factory AppRadius(
      {required Radius small,
      required Radius regular,
      required Radius big}) = _AppRadius;

  factory AppRadius.regular() => const AppRadius(
        small: Radius.circular(RadiusSize.sm),
        regular: Radius.circular(RadiusSize.md),
        big: Radius.circular(RadiusSize.lg),
      );

  AppBorderRadius get asBorderRadius => AppBorderRadius(radius: this);
}


@freezed
class AppBorderRadius with _$AppBorderRadius {
  const AppBorderRadius._();
  const factory AppBorderRadius({required AppRadius radius}) = _AppBorderRadius;

  BorderRadius get small => BorderRadius.all(radius.small);
  BorderRadius get regular => BorderRadius.all(radius.regular);
  BorderRadius get big => BorderRadius.all(radius.big);
}
