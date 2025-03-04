//* show company description
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/common_widgets/async_value_widget.dart';
import 'package:geiger_toolbox/src/common_widgets/forms/custom_text_form_field.dart';

import 'package:geiger_toolbox/src/features/authentication/presentation/company/company_description_controller.dart';
import 'package:geiger_toolbox/src/features/authentication/presentation/company/widgets/company_profile_form_widget.dart';
import 'package:geiger_toolbox/src/localization/string_hardcoded.dart';

class CompanyDescriptionWidget extends ConsumerWidget {
  const CompanyDescriptionWidget({super.key, required this.controller, required this.onEditingComplete});
  final TextEditingController controller;
  final VoidCallback onEditingComplete;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(getCompanyDescriptionProvider);
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
                      CompanyDescription(
                        description: desc,
                        controller: controller,
                        onEditingComplete: onEditingComplete,
                      ),
                    ],
                  ),
    );
  }
}

class CompanyDescription extends ConsumerWidget {
  const CompanyDescription({
    super.key,
    required this.description,
    required this.controller,
    required this.onEditingComplete,
  });
  final String description;
  final TextEditingController controller;
  final VoidCallback onEditingComplete;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final editState = ref.watch(editCompanyDescriptionControllerProvider);
    final appTheme = Theme.of(context);
    return Card(
      elevation: 0,
      color: appTheme.colorScheme.onInverseSurface,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: CustomTextFormField(
        textEditingController: controller,
        autoComplete: true,
        textInputAction: TextInputAction.done,
        keyboardType: TextInputType.multiline,

        enabled: true,
        onEditingComplete: onEditingComplete,

        validator: (text) => text == null || text.isEmpty ? "Company description is required".hardcoded : null,
        maxLength: 500,
      ),
    );
  }
}
