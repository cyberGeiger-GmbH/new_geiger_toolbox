//* this widget will only be show when company description has been fetched.
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/common_widgets/async_value_widget.dart';
import 'package:geiger_toolbox/src/features/authentication/presentation/company/company_description_controller.dart';

class GenerateCompanyProfileButton extends ConsumerWidget {
  const GenerateCompanyProfileButton({
    super.key,
    required this.isLoading,
    required this.onPressed,
    required this.label,
  });
  final bool isLoading;
  final String label;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppButton.tertiary(label: label, context: context, isLoading: isLoading, onPressed: onPressed);
  }
}

class ConfirmationButtonWidget extends ConsumerWidget {
  const ConfirmationButtonWidget({super.key, required this.state, required this.onPressed, required this.label});
  final AsyncValue<void> state;
  final VoidCallback onPressed;
  final String label;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final companyDescriptionValue = ref.watch(getCompanyDescriptionProvider);

    return AsyncValueWidget(
      value: companyDescriptionValue,
      //hide loading of confirmation button
      loadingWidget: SizedBox.shrink(),
      data:
          (value) =>
              value == null
                  ? SizedBox.shrink()
                  : AppButton.primary(
                    label: label,
                    context: context,
                    isLoading: state.isLoading,
                    onPressed: state.isLoading ? null : onPressed,
                  ),
    );
  }
}
