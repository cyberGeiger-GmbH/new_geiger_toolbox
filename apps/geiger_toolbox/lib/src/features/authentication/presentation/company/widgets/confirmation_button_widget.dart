//* this widget will only be show when company description has been fetched.
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/common_widgets/async_value_widget.dart';
import 'package:geiger_toolbox/src/features/authentication/presentation/company/company_description_controller.dart';
import 'package:geiger_toolbox/src/localization/string_hardcoded.dart';

class ConfirmationButtonWidget extends ConsumerWidget {
  const ConfirmationButtonWidget({super.key, required this.state, required this.onPressed});
  final AsyncValue<void> state;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final companyDescriptionValue = ref.watch(getCompanyDescriptionProvider);

    return AsyncValueWidget(
      value: companyDescriptionValue,
      //hide loading button
      loadingWidget: SizedBox.shrink(),
      data:
          (value) =>
              value == null
                  ? SizedBox.shrink()
                  : AppButton.tertiary(
                    label: "Confirm info".hardcoded,
                    context: context,
                    isloading: state.isLoading,
                    onPressed: state.isLoading ? null : onPressed,
                  ),
    );
  }
}
