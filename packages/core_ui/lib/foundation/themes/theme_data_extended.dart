// ignore_for_file: avoid-non-null-assertion
import 'package:core_ui/tokens/breakpoints.dart';
import 'package:flutter/material.dart';


extension MediaQueryExtended on BoxConstraints {
  bool get isSmallDevice {
    return maxWidth <= BreakPoints.mobile && maxWidth <= BreakPoints.tablet;
  }

  bool get isTablet {
    return maxWidth >= BreakPoints.tablet && maxWidth <= BreakPoints.desktop;
  }

  bool get isDesktop {
    return maxWidth >= BreakPoints.desktop &&
        maxWidth <= BreakPoints.largeScreen;
  }

  bool get isLargerDisplay {
    return maxWidth >= BreakPoints.largeScreen;
  }
}
