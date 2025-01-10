import 'package:flutter/material.dart';

import '../../foundation/app_radius.dart';
import '../../tokens/spacing.dart';
import '../texts/app_text.dart';

class AppButton extends StatelessWidget {
  const AppButton._({
    super.key,
    required this.child,
    this.onPressed,
    this.style,
  });

//todo: wrap with Semantics for visual impair user
  factory AppButton.primary(
      {Key? key,
      required String label,
      VoidCallback? onPressed,
      required BuildContext context}) {
    return AppButton._(
      key: key,
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: _appColor(context).primary,
          overlayColor: _appColor(context).onPrimary),
      child: AppText.labelLarge(
        text: label,
        context: context,
        color: _appColor(context).onPrimary,
      ),
    );
  }

  factory AppButton.secondary(
      {Key? key,
      required String label,
      VoidCallback? onPressed,
      required BuildContext context}) {
    return AppButton._(
      key: key,
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: _appColor(context).secondary,
          overlayColor: _appColor(context).onSecondary),
      child: AppText.labelLarge(
          text: label, context: context, color: _appColor(context).onSecondary),
    );
  }

  factory AppButton.tertiary(
      {Key? key,
      required String label,
      VoidCallback? onPressed,
      bool isloading = false,
      required BuildContext context}) {
    return AppButton._(
      key: key,
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: _appColor(context).tertiary,
          overlayColor: _appColor(context).onTertiary),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isloading
              ? const CircularProgressIndicator()
              : AppText.labelLarge(
                  text: label,
                  context: context,
                  color: _appColor(context).onTertiary)
        ],
      ),
    );
  }

  factory AppButton.action(
      {Key? key,
      required String label,
      VoidCallback? onPressed,
      bool isLoading = false,
      Color? backgroundColor,
      Color? fontgroundColor,
      bool centeredContent = false,
      required BuildContext context}) {
    return AppButton._(
      key: key,
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          shape: const RoundedRectangleBorder(),
          backgroundColor: backgroundColor),
      child: Row(
          mainAxisAlignment: centeredContent
              ? MainAxisAlignment.center
              : MainAxisAlignment.start,
          children: [
            isLoading
                ? const CircularProgressIndicator()
                : AppText.labelLarge(
                    text: label,
                    context: context,
                    color: fontgroundColor,
                  ),
          ]),
    );
  }

  factory AppButton.delete(
      {Key? key,
      required String label,
      VoidCallback? onPressed,
      required BuildContext context}) {
    return AppButton._(
      key: key,
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: _appColor(context).error,
          overlayColor: _appColor(context).onError),
      child: AppText.labelLarge(
          text: label, context: context, color: _appColor(context).onTertiary),
    );
  }

  factory AppButton.scan(
      {Key? key,
      required String label,
      VoidCallback? onPressed,
      Color? color,
      required BuildContext context}) {
    return AppButton._(
      key: key,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        backgroundColor: color ?? _appColor(context).primary,
        minimumSize: const Size(150, 150),
        overlayColor: _appColor(context).onPrimary,
      ),
      onPressed: onPressed,
      child: AppText.titleLarge(
        text: label,
        context: context,
        color: color ?? _appColor(context).onPrimary,
      ),
    );
  }
  factory AppButton.news(
      {Key? key,
      required String title,
      VoidCallback? onPressed,
      Color? color,
      required BuildContext context}) {
    return AppButton._(
      key: key,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
            borderRadius: AppRadius.main().asBorderRadius.regular),
        maximumSize: const Size(130, 100),
        minimumSize: const Size(130, 100),
        backgroundColor: color ?? _appColor(context).surface,
        padding: const EdgeInsets.all(Spacing.p12),
        overlayColor: _appColor(context).onSurface,
      ),
      onPressed: onPressed,
      child: AppText.titleSmall(
        text: title,
        context: context,
        color: color,
        textAlign: TextAlign.justify,
        textOverflow: TextOverflow.fade,
      ),
    );
  }

  factory AppButton.activeNews(
      {Key? key,
      required String title,
      VoidCallback? onPressed,
      Color? color,
      required BuildContext context}) {
    return AppButton._(
      key: key,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: AppRadius.main().asBorderRadius.regular,
          side: BorderSide(color: _appColor(context).primary),
        ),
        maximumSize: const Size(100, 100),
        minimumSize: const Size(90, 90),
        backgroundColor: color ?? _appColor(context).surface,
        padding: const EdgeInsets.all(Spacing.p12),
        overlayColor: _appColor(context).onSurface,
      ),
      onPressed: onPressed,
      child: AppText.titleMedium(
        text: title,
        context: context,
        color: color,
        textAlign: TextAlign.center,
        textOverflow: TextOverflow.fade,
      ),
    );
  }

  static ColorScheme _appColor(BuildContext context) {
    return Theme.of(context).colorScheme;
  }

  final VoidCallback? onPressed;

  final ButtonStyle? style;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: key,
      onPressed: onPressed,
      style: style,
      child: child,
    );
  }
}
