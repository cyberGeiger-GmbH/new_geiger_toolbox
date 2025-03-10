// this Widget is for testing only
import 'package:core_ui/molecules/buttons/app_icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/common_widgets/alert_dialogs.dart';
import 'package:geiger_toolbox/src/extensions/async_value_extension.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/presentation/clear_data/clear_data_controller.dart';

import 'package:geiger_toolbox/src/localization/string_hardcoded.dart';
import 'package:go_router/go_router.dart';

class ClearDataButtonWidget extends ConsumerWidget {
  const ClearDataButtonWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(cleanDataControllerProvider, (_, nxt) => nxt.showAlertDialogOnError(context: context));
    final state = ref.watch(cleanDataControllerProvider);
    final colors = Theme.of(context).colorScheme;
    return AppIconButton.filled(
      context: context,
      backgroundColor: colors.error,
      iconData: state.isLoading ? Icons.timer : Icons.delete_forever,
      onPressed:
          state.isLoading
              ? null
              : () async {
                showAlertDialog(
                  context: context,
                  title: "Deletion Alert".hardcoded,
                  content: "Are you sure you want to delete data? \n Note: This action can't be undone.",
                  cancelActionText: 'Cancel'.hardcoded,
                  trigger: () {
                    ref.read(cleanDataControllerProvider.notifier).deleteNewsData();
                    //pop alert
                    context.pop(true);
                  },
                );
              },
    );
  }
}
