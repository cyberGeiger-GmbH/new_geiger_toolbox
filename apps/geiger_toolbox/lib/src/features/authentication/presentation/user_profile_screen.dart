import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/env/flavor.dart';
import 'package:geiger_toolbox/src/features/authentication/presentation/profile/delete/delete_profile_widget.dart';
import 'package:geiger_toolbox/src/features/authentication/presentation/profile/user_profile_contents_widget.dart';

class UserProfileScreen extends ConsumerWidget {
  const UserProfileScreen({super.key});
  // * Keys for testing using find.byKey()
  static const companyKey = Key('companyName');
  static const locationKey = Key('location');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "User Profile",
      ),
      floatingActionButton:
          getFlavor() == Flavor.prod ? null : DeleteUserProfileButton(),
      body: UserProfileContentsWidget(),
    );
  }
}
