import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/common_widgets/async_value_widget.dart';
import 'package:geiger_toolbox/src/extensions/async_value_extension.dart';
import 'package:geiger_toolbox/src/features/authentication/data/user_profile_repository.dart';
import 'package:geiger_toolbox/src/features/authentication/presentation/profile/delete/delete_profile_controller.dart';

//for deleting user profile while testing in stg|dev

class DeleteUserProfileButton extends ConsumerWidget {
  const DeleteUserProfileButton({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

     //for error in user controller
    ref.listen(deleteProfileControllerProvider,
        (_, newState) => newState.showAlertDialogOnError(context: context));

    ref.listen(
        deleteProfileControllerProvider,
        (_, newState) =>
            newState.deleteUserProfileSuccessSnackBar(context: context));
            
    final streamUser = ref.watch(watchUserProvider);
    final theme = Theme.of(context);
    return AsyncValueWidget(
      value: streamUser,
      data: (value) => value == null
          ? SizedBox.shrink()
          : FloatingActionButton(
              onPressed: () async {
                final controller =
                    ref.read(deleteProfileControllerProvider.notifier);
                controller.deleteProfile();
              },
              backgroundColor: theme.colorScheme.errorContainer,
              child: Icon(
                Icons.delete,
                color: theme.colorScheme.onErrorContainer,
              ),
            ),
    );
  }
}