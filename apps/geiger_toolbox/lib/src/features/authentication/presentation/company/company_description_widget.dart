//* show company description
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/common_widgets/async_value_widget.dart';
import 'package:geiger_toolbox/src/features/authentication/presentation/company/company_description_controller.dart';
import 'package:geiger_toolbox/src/features/authentication/presentation/company/widgets/company_profile_form_widget.dart';
import 'package:geiger_toolbox/src/localization/string_hardcoded.dart';

class CompanyDescriptionWidget extends ConsumerWidget {
  const CompanyDescriptionWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(getCompanyDescriptionProvider);
    final appTheme = Theme.of(context);
    return AsyncValueWidget(
      value: value,
      data:
          (desc) =>
              desc == null
                  ? const SizedBox.shrink()
                  : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SectionTitle(label: "Company Description".hardcoded),
                      Card(
                        color: appTheme.colorScheme.onInverseSurface,
                        margin: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: Spacing.p16, vertical: Spacing.p12),
                          child: AppText.bodySmall(text: desc, context: context),
                        ),
                      ),
                    ],
                  ),
    );
  }
}
