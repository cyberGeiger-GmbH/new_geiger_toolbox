import 'package:core_ui/atoms/app_asset_image_data.dart';
import 'package:core_ui/core_ui.dart';
import 'package:core_ui/molecules/background_with_image.dart';
import 'package:flutter/material.dart';

class TermsAndConditionScreen extends StatelessWidget {
  const TermsAndConditionScreen(
      {super.key,
      this.title,
      this.subtitle,
      this.policyStatement,
      this.allSizePadding,
      this.getStartedLabel,
      required this.acceptCondition,
      this.value = false,
      this.getStarted});
  final String? title;
  final String? subtitle;
  final String? policyStatement;
  final ValueChanged<bool?> acceptCondition;
  final VoidCallback? getStarted;
  final String? getStartedLabel;
  final double? allSizePadding;
  final bool value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: EdgeInsets.all(allSizePadding ?? Spacing.p8),
        child: BackgroundWithImage(
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AppAssetImageData.geigerLogo().image,
                    AppText.headlineLarge(
                        text: title ?? "Welcome to the GEIGER Toolbox",
                        context: context),
                    Spacing.gapH12,
                    AppText.bodyMedium(
                      text: subtitle ??
                          "An AI power cyber risks assesement, guidance and awareness application for  improving your company's cybersecurity.",
                      context: context,
                      textAlign: TextAlign.justify,
                    )
                  ],
                ),
              ),
              ListTile(
                leading: Checkbox(value: value, onChanged: acceptCondition),
                trailing: AppText.bodyMedium(
                    text: policyStatement ??
                        "Privacy policy for the handling of data",
                    context: context),
              ),
              SizedBox(
                width: double.infinity,
                child: AppButton.tertiary(
                  label: getStartedLabel ?? "Get Started",
                  context: context,
                  onPressed: getStarted,
                ),
              ),
              Spacing.gapH12,
            ],
          ),
        ),
      ),
    );
  }
}
