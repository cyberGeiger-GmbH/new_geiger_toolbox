import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:geiger_toolbox/env/flavor.dart';
import 'package:geiger_toolbox/src/features/authentication/presentation/app_version_widget.dart';
import 'package:geiger_toolbox/src/features/authentication/presentation/company/delete/delete_profile_widget.dart';
import 'package:geiger_toolbox/src/features/authentication/presentation/company/widgets/company_profile_contents_widget.dart';


/// Shows the form for creating profile of the user

class CreateProfileScreen extends StatefulWidget {
  const CreateProfileScreen({super.key, this.onCloseProfile});
  // * Keys for testing using find.byKey()
  static const companyKey = Key('companyName');
  static const locationKey = Key('location');
  final VoidCallback? onCloseProfile;

  @override
  State<CreateProfileScreen> createState() => _CreateProfileScreenState();
}

class _CreateProfileScreenState extends State<CreateProfileScreen> {
  // * Use a [ScrollController] to register a listener that dismisses the
  // * on-screen keyboard when the user scrolls.
  // * This is needed because this screen has form fields that the user can
  // * type into.

  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() => _dismissOnScreenKeyboard());
  }

  @override
  void dispose() {
    super.dispose();

    _scrollController.removeListener(() => _dismissOnScreenKeyboard());
    _scrollController.dispose();
  }

  // When the form field gets the focus, the keyboard appears on mobile.
  // This method is used to dismiss the keyboard when the user scrolls.

  void _dismissOnScreenKeyboard() {
    if (FocusScope.of(context).hasFocus) {
      FocusScope.of(context).unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GeigerScaffold(
      appBar: GeigerAppBar(title: "User Profile", closeDefaultProfile: widget.onCloseProfile),
      floatingActionButton: getFlavor() == Flavor.prod ? null : DeleteUserProfileButton(),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(child: CompanyProfileContentsWidget()),
          SliverToBoxAdapter(child: AppVersionWidget()),
        ],
      ),
    );
  }
}
