import 'package:core_ui/foundation/themes/app_colors_theme.dart';
import 'package:core_ui/foundation/themes/app_dimensions_theme.dart';
import 'package:core_ui/foundation/themes/app_icons_theme.dart';
import 'package:core_ui/foundation/themes/app_images_theme.dart';
import 'package:core_ui/foundation/themes/app_text_style_theme.dart';
import 'package:flutter/material.dart';

extension ThemeDataExtended on ThemeData {
  AppColorsTheme get appColors => extension<AppColorsTheme>()!;
  AppTextStyleTheme get appTextStyles => extension<AppTextStyleTheme>()!;
  AppDimensionsTheme get appDimensions => extension<AppDimensionsTheme>()!;
  AppIconsTheme get appIcons => extension<AppIconsTheme>()!;
  AppImagesTheme get appImages => extension<AppImagesTheme>()!;
}
