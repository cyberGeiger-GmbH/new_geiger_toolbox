import 'package:flutter/material.dart';

import '../../tokens/spacing.dart';
import '../texts/app_text.dart';

class AppButton extends StatelessWidget {
  const AppButton._({super.key, required this.child, this.onPressed, this.style});

  static ColorScheme _appColor(BuildContext context) {
    return Theme.of(context).colorScheme;
  }

  //todo: wrap with Semantics for visual impair user
  factory AppButton.primary({
    Key? key,
    required String label,
    VoidCallback? onPressed,
    required BuildContext context,
    bool isLoading = false,
  }) {
    return AppButton._(
      key: key,
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: _appColor(context).primary,
        overlayColor: _appColor(context).onPrimary,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isLoading
              ? CircularProgressIndicator(color: _appColor(context).onPrimary)
              : AppText.labelLarge(text: label, context: context, color: _appColor(context).onPrimary),
        ],
      ),
    );
  }

  factory AppButton.secondary({
    Key? key,
    required String label,
    VoidCallback? onPressed,
    required BuildContext context,
  }) {
    return AppButton._(
      key: key,
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: _appColor(context).secondary,
        overlayColor: _appColor(context).onSecondary,
      ),
      child: AppText.labelLarge(text: label, context: context, color: _appColor(context).onSecondary),
    );
  }

  factory AppButton.tertiary({
    Key? key,
    required String label,
    VoidCallback? onPressed,
    bool isLoading = false,
    required BuildContext context,
  }) {
    return AppButton._(
      key: key,
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: _appColor(context).tertiary,
        overlayColor: _appColor(context).onTertiary,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isLoading
              ? const CircularProgressIndicator()
              : AppText.labelLarge(text: label, context: context, color: _appColor(context).onTertiary),
        ],
      ),
    );
  }

  factory AppButton.action({
    Key? key,
    required String label,
    VoidCallback? onPressed,
    bool isLoading = false,
    Color? backgroundColor,
    Color? fontgroundColor,
    bool centeredContent = false,
    bool isItemDeleted = false,
    required BuildContext context,
  }) {
    return AppButton._(
      key: key,
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(shape: const RoundedRectangleBorder(), backgroundColor: backgroundColor),
      child: Row(
        mainAxisAlignment: centeredContent ? MainAxisAlignment.center : MainAxisAlignment.start,
        children: [
          isLoading
              ? const CircularProgressIndicator()
              : AppText.labelLarge(text: label, context: context, color: fontgroundColor, textDeleted: isItemDeleted),
        ],
      ),
    );
  }

  factory AppButton.delete({Key? key, required String label, VoidCallback? onPressed, required BuildContext context}) {
    return AppButton._(
      key: key,
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: _appColor(context).error,
        overlayColor: _appColor(context).onError,
      ),
      child: AppText.labelLarge(text: label, context: context, color: _appColor(context).onTertiary),
    );
  }

  factory AppButton.newsCard({
    Key? key,
    required String title,
    VoidCallback? onPressed,
    required BuildContext context,
  }) {
    return AppButton._(
      key: key,
      style: ElevatedButton.styleFrom(
        backgroundColor: _appColor(context).onInverseSurface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Spacing.p16)),
        overlayColor: _appColor(context).tertiary,
      ),
      onPressed: onPressed,
      child: AppText.titleMedium(
        text: title,
        context: context,
        textAlign: TextAlign.center,

        textOverflow: TextOverflow.fade,
      ),
    );
  }

  factory AppButton.activeNewsCard({
    Key? key,
    required String title,
    VoidCallback? onPressed,
    required BuildContext context,
  }) {
    return AppButton._(
      key: key,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Spacing.p16)),
        backgroundColor: _appColor(context).onInverseSurface,
        overlayColor: _appColor(context).tertiary,
      ),
      onPressed: onPressed,
      child: AppText.titleMedium(
        text: title,
        context: context,
        textAlign: TextAlign.center,

        textOverflow: TextOverflow.fade,
      ),
    );
  }

  final VoidCallback? onPressed;

  final ButtonStyle? style;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(key: key, onPressed: onPressed, style: style, child: child);
  }
}
