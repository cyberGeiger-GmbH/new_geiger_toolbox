import 'package:core_ui/core_ui.dart';
import 'package:core_ui/molecules/buttons/custom_checkbox.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/features/policy/presentation/terms/get_started_button.dart';

import 'package:geiger_toolbox/src/features/policy/presentation/terms/terms_condition_controller.dart';

import 'package:geiger_toolbox/src/localization/string_hardcoded.dart';
import 'package:geiger_toolbox/src/routing/app_routing.dart';
import 'package:geiger_toolbox/src/utils/url_launcher_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

class TermsAndConditionWidget extends ConsumerWidget {
  const TermsAndConditionWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(termsConditionControllerProvider);
    return ResponsiveCenterWidget(
      child: Column(
        children: [
          GetStartedButton(
            onPressed:
                !state
                    ? null
                    : () {
                      ref.read(termsConditionControllerProvider.notifier).acceptTermsAndCondition();
                      //navigate to main screen
                      context.goNamed(AppRouter.mainRouter.name);
                    },
          ),
          Spacing.gapH8,
          TermsPrivacyRow(
            onChanged: (value) {
              ref.read(termsConditionControllerProvider.notifier).onChanged(value ?? false);
            },
            value: ref.watch(termsConditionControllerProvider),
          ),
        ],
      ),
    );
  }
}

class TermsPrivacyRow extends StatelessWidget {
  const TermsPrivacyRow({super.key, required this.value, required this.onChanged});
  final bool value;
  final ValueChanged<bool?> onChanged;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomCheckbox(value: value, onChanged: onChanged, activeColor: theme.colorScheme.tertiary),
        Spacing.gapW4,
        TermsPrivacySpanText(),
      ],
    );
  }
}

class TermsPrivacySpanText extends ConsumerWidget {
  const TermsPrivacySpanText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final textSpanStyle = theme.textTheme.bodySmall?.copyWith(
      //fontSize: TypoSize.bodySmall,
      fontWeight: FontWeight.w700,
      color: Colors.blue,
    );
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: theme.textTheme.bodySmall,
        children: [
          TextSpan(
            text: 'I have read and agreed to Geiger Toolbox '.hardcoded,
            style: theme.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w400),
          ),
          TextSpan(text: ' \n'),
          TextSpan(
            text: 'Terms of Service',
            style: textSpanStyle,
            recognizer:
                TapGestureRecognizer()
                  ..onTap = () {
                    ref
                        .read(urlLauncherProvider)
                        .launch(
                          Uri.parse("https://www.cyber-geiger.com/app/terms-of-service/"),
                          // * Open app store app directly (or fallback to browser)
                          mode: LaunchMode.inAppBrowserView,
                        );
                  },
          ),
          TextSpan(text: ' and '),
          TextSpan(
            text: 'Privacy Policy',
            style: textSpanStyle,
            recognizer:
                TapGestureRecognizer()
                  ..onTap = () {
                    // Handle  ref
                    ref
                        .read(urlLauncherProvider)
                        .launch(
                          Uri.parse("https://www.cyber-geiger.com/app/privacy-policy/"),
                          // * Open app store app directly (or fallback to browser)
                          mode: LaunchMode.inAppBrowserView,
                        );
                  },
          ),
        ],
      ),
    );
  }
}
