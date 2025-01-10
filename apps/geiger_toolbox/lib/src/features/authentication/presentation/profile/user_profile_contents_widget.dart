import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/common_widgets/async_value_widget.dart';

import 'package:geiger_toolbox/src/features/authentication/data/user_profile_repository.dart';
import 'package:geiger_toolbox/src/features/authentication/domain/user.dart';

import 'package:geiger_toolbox/src/features/authentication/presentation/profile/user_profile_form_widget.dart';

class UserProfileContentsWidget extends ConsumerWidget {
  const UserProfileContentsWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streamUser = ref.watch(watchUserProvider);

    return AsyncValueWidget<UserData?>(
      value: streamUser,
      data: (userData) => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: UserProfileFormWidget(
            userData: userData,
          ),
        ),
      ),
    );
  }
}
