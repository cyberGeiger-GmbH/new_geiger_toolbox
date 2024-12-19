import 'package:core_ui/molecules/buttons/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/extensions/async_value_extension.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/clear_data/clear_data_controller.dart';

import 'package:geiger_toolbox/src/localization/string_hardcoded.dart';

class ClearDataButton extends ConsumerWidget {
  const ClearDataButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(cleanDataControllerProvider,
        (_, nxt) => nxt.showAlertDialogOnError(context: context));
    final state = ref.watch(cleanDataControllerProvider);

    return AppButton.delete(
      context: context,
      label: state.isLoading ? 'deleting' : "Clear Cache".hardcoded,
      onPressed: state.isLoading
          ? null
          : () async {
              await ref
                  .read(cleanDataControllerProvider.notifier)
                  .deleteNewsData();
              await ref.read(cleanDataControllerProvider.notifier).deleteTask();
            },
    );
  }
}
