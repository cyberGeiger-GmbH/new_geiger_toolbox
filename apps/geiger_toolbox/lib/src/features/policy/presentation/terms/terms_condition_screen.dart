import 'package:core_ui/core_ui.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:geiger_toolbox/src/features/policy/presentation/terms/terms_condition_controller.dart';

import 'package:geiger_toolbox/src/localization/string_hardcoded.dart';
import 'package:geiger_toolbox/src/routing/app_routing.dart';
import 'package:go_router/go_router.dart';

class TermsAndConditionWidget extends ConsumerWidget {
  const TermsAndConditionWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return  Column(
        children: [
          GetStartedButton(
            onPressed: () {
              //accept terms and condition
              ref
                  .read(termsConditionControllerProvider.notifier)
                  .acceptTermsAndCondition(true);
              //navigate to main screen
              context.goNamed(AppRouter.main.name);
            },
          ),
          Spacing.gapH22,
          TermsPrivacyWidget(),
         
        ],
      
    );
  }
}

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key, required this.onPressed});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: AppButton.primary(
        label: "Get Started",
        context: context,
        onPressed: onPressed,
      ),
    );
  }
}

class TermsPrivacyWidget extends StatelessWidget {
  const TermsPrivacyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          style: TextStyle(fontSize: 14, color: Colors.black),
          children: [
            TextSpan(
                text: 'By continuing you agree to Geiger Toolbox '.hardcoded),
            TextSpan(
              text: 'Terms of Service',
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  // Handle Terms of Service tap
                },
            ),
            TextSpan(text: ' and '),
            TextSpan(
              text: 'Privacy Policy',
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  // Handle Privacy Policy tap
                },
            ),
          ],
        ),
      ),
    );
  }
}
