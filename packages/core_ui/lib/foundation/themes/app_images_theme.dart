import 'package:core_ui/atoms/app_images_data.dart';
import 'package:flutter/material.dart';

class AppImagesTheme extends ThemeExtension<AppImagesTheme> {
  final AppImagesData imagesData;

  const AppImagesTheme._({required this.imagesData});

  factory AppImagesTheme.geigerLogo() =>
      AppImagesTheme._(imagesData: AppImagesData.geigerLogo());

  @override
  ThemeExtension<AppImagesTheme> copyWith() {
    return AppImagesTheme._(imagesData: imagesData);
  }

  @override
  ThemeExtension<AppImagesTheme> lerp(
      covariant ThemeExtension<AppImagesTheme>? other, double t) {
    return this;
  }
}
