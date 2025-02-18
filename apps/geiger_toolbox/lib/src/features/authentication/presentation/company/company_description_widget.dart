//* show company description
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/common_widgets/async_value_widget.dart';
import 'package:geiger_toolbox/src/features/authentication/presentation/company/company_description_controller.dart';

class CompanyDescriptionWidget extends ConsumerWidget {
  const CompanyDescriptionWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(getCompanyDescriptionProvider);

    return AsyncValueWidget(
      value: value,
      data: (desc) => desc == null ? const SizedBox.shrink() : AppText.bodyMedium(text: desc, context: context),
    );
  }
}
