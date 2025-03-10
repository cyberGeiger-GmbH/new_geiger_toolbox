import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:geiger_toolbox/env/flavor.dart';
import 'package:geiger_toolbox/src/features/authentication/presentation/company/widgets/app_version_widget.dart';
import 'package:geiger_toolbox/src/features/authentication/presentation/company/delete/delete_profile_widget.dart';
import 'package:geiger_toolbox/src/features/authentication/presentation/company/widgets/company_profile_contents_widget.dart';
import 'package:geiger_toolbox/src/localization/string_hardcoded.dart';

/// Shows the form for creating profile of the user

class CreateProfileScreen extends StatelessWidget {
  const CreateProfileScreen({super.key, this.onCloseProfile});
  // * Keys for testing using find.byKey()
  static const companyKey = Key('companyName');
  static const locationKey = Key('location');
  final VoidCallback? onCloseProfile;

  @override
  Widget build(BuildContext context) {
    return GeigerScaffold(
      appBar: GeigerAppBar(title: "User Profile".hardcoded, closeDefaultProfile: onCloseProfile),
      floatingActionButton: getFlavor() == Flavor.dev ? DeleteUserProfileButton() : null,
      body: Column(
        children: [Expanded(child: SingleChildScrollView(child: CompanyProfileContentsWidget())), AppVersionWidget()],
      ),
    );
  }
}
