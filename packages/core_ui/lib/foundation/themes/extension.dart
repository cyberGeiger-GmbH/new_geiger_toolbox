import 'package:core_ui/foundation/themes/app_colors_theme.dart';
import 'package:core_ui/foundation/themes/app_icons_theme.dart';
import 'package:core_ui/foundation/themes/app_images_theme.dart';
import 'package:core_ui/foundation/themes/app_text_style_theme.dart';
import 'package:core_ui/tokens/breakpoints.dart';
import 'package:flutter/material.dart';

extension ThemeDataExtended on ThemeData {
  AppColorsTheme get appColors => extension<AppColorsTheme>()!;
  AppTextStyleTheme get appTextStyles => extension<AppTextStyleTheme>()!;
  AppIconsTheme get appIcons => extension<AppIconsTheme>()!;
  AppImagesTheme get appImages => extension<AppImagesTheme>()!;
}

extension MediaQueryExtended on BoxConstraints {
  bool get isSmallDevice {
    return maxWidth <= BreakPoints.sm && maxWidth <= BreakPoints.md;
  }

  bool get isTablet {
    return maxWidth >= BreakPoints.md && maxWidth <= BreakPoints.lg;
  }

  bool get isDesktop {
    return maxWidth >= BreakPoints.lg && maxWidth <= BreakPoints.xlg;
  }

  bool get isLargerDisplay {
    return maxWidth >= BreakPoints.xlg;
  }
}
