import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/features/policy/presentation/terms_condition_controller.dart';
import 'package:geiger_toolbox/src/localization/string_hardcoded.dart';
import 'package:geiger_toolbox/src/routing/app_routing.dart';
import 'package:go_router/go_router.dart';

class TermsConditionScreen extends ConsumerWidget {
  const TermsConditionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(termsConditionControllerProvider);

    return TermsAndConditionScreen(
      value: value,
      acceptCondition: (value) {
        ref
            .read(termsConditionControllerProvider.notifier)
            .acceptTermsAndCondition(value ?? false);
      },
      getStarted: value
          ? () {
              context.goNamed(AppRouter.main.name);
            }
          : null,
      allSizePadding: Spacing.p12,
      getStartedLabel: "Get Started".hardcoded,
    );
  }
}
