import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/extensions/async_value_extension.dart';
import 'package:geiger_toolbox/src/features/authentication/data/user_profile_repository.dart';
import 'package:geiger_toolbox/src/features/authentication/domain/user.dart';
import 'package:geiger_toolbox/src/features/authentication/presentation/profile/company_description_widget.dart';
import 'package:geiger_toolbox/src/features/authentication/presentation/profile/company_profile_controller.dart';
import 'package:geiger_toolbox/src/features/authentication/presentation/profile/confirmation_button_widget.dart';

import 'package:geiger_toolbox/src/features/authentication/presentation/validators/company_name_location_validators.dart';
import 'package:geiger_toolbox/src/common_widgets/forms/custom_text_form_field.dart';
import 'package:geiger_toolbox/src/features/authentication/presentation/user_profile_controller.dart';
import 'package:geiger_toolbox/src/features/authentication/presentation/user_profile_screen.dart';

class UserProfileFormWidget extends ConsumerStatefulWidget {
  const UserProfileFormWidget({super.key, this.onSubmit, this.userData});
  final VoidCallback? onSubmit;
  final UserData? userData;

  @override
  ConsumerState<UserProfileFormWidget> createState() =>
      _UserProfileScreenState();
}

class _UserProfileScreenState extends ConsumerState<UserProfileFormWidget>
    with CompanyNameLocationValidators {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _node = FocusScopeNode();
  final TextEditingController _companyTextController = TextEditingController();
  final TextEditingController _locationTextController = TextEditingController();

  String get companyName => _companyTextController.text;
  String get location => _locationTextController.text;

  //local variable used to apply AutovalidateMode.onUserInteraction and show error hints only when the form has been submitted
  var _submitted = false;

  @override
  void initState() {
    super.initState();
    _preLoadField();
  }

  @override
  void dispose() {
    _node.dispose();
    _companyTextController.dispose();
    _locationTextController.dispose();
    super.dispose();
  }

  void _preLoadField() {
    final data = widget.userData;
    if (data != null) {
      _companyTextController.text = data.user.companyName;
      _locationTextController.text = data.user.location;
    }
  }

  bool _validateAndSaveForm() {
    final form = _formKey.currentState!;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  Future<void> createProfile() async {
    final controller = ref.read(userProfileControllerProvider.notifier);
    final description = await ref.read(getCompanyDescriptionProvider.future);
    final user = User(
        companyName: companyName,
        location: location,
        description: description!);
    final success = await controller.createProfile(user: user);
    if (success) {
      widget.onSubmit?.call();
    }
  }

  Future<void> updateProfile() async {
    final controller = ref.read(userProfileControllerProvider.notifier);
    if (widget.userData != null) {
      final user = User(
          companyName: companyName,
          location: location,
          description: widget.userData!.user.description);
      final userData = UserData(id: widget.userData!.id, user: user);
      final success = await controller.updateProfile(userData: userData);
      if (success) {
        widget.onSubmit?.call();
      }
    }
  }

  //update company description
  Future<void> _setCompanyDescription() async {
    final controller = ref.read(companyProfileControllerProvider.notifier);

    await controller.setCompanyDescription(
        companyName: companyName, location: location);
  }

  Future<void> _onSubmit() async {
    setState(() => _submitted = true);
    //only submit the form if validation passes
    if (_validateAndSaveForm()) {
      if (widget.userData != null) {
        //update profile
        await updateProfile();
      }
      //create profile
      else {
        await createProfile();
      }
    }
  }

  void _companyNameEditingComplete() {
    if (canSubmitCompanyName(companyName)) {
      _node.nextFocus();
    }
  }

  void _locationEditingComplete() {
    if (!canSubmitLocation(location)) {
      _node.previousFocus();
      return;
    }
    _setCompanyDescription();
  }

  @override
  Widget build(BuildContext context) {
    //listen for error in user controller
    ref.listen(userProfileControllerProvider,
        (_, newState) => newState.showAlertDialogOnError(context: context));

    ref.listen(userProfileControllerProvider, (_, nxt) {
      nxt.updateUserProfileSuccessSnackBar(context: context);
    });

//listen for error in company controller
    ref.listen(companyProfileControllerProvider,
        (_, newState) => newState.showAlertDialogOnError(context: context));

//* testing purpose
//update when form field when content is deleted
    ref.listen(watchUserProvider, (_, nxtVal) {
      final data = nxtVal.value;
      if (data == null) {
        _companyTextController.text = "";
        _locationTextController.text = "";
      }
    });

    final state = ref.watch(userProfileControllerProvider);

    return FocusScope(
      node: _node,
      child: Form(
        key: _formKey,
        autovalidateMode: _submitted
            ? AutovalidateMode.onUserInteraction
            : AutovalidateMode.disabled,
        child: Column(
          //mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextFormField(
              key: UserProfileScreen.companyKey,
              textEditingController: _companyTextController,
              label: "Comany Name",
              hint: 'for example "CyberGeiger"',
              enabled: !state.isLoading,
              validator: (companyName) =>
                  _submitted ? companyNameErrorText(companyName ?? "") : null,
              onEditingComplete: () => _companyNameEditingComplete(),
              autoComplete: true,
              isLastField: false,
            ),
            Spacing.gapH8,
            CustomTextFormField(
              key: UserProfileScreen.locationKey,
              textEditingController: _locationTextController,
              label: "Company Location",
              hint: 'for example "Freiburg, Germany"',
              enabled: !state.isLoading,
              validator: (location) =>
                  _submitted ? locationErrorText(location ?? "") : null,
              onEditingComplete: () => _locationEditingComplete(),
              isLastField: true,
              autoComplete: true,
            ),
            Spacing.gapH8,
            CompanyDescriptionWidget(),
            Spacing.gapH8,
            ConfirmationButtonWidget(state: state, onPressed: () => _onSubmit())
          ],
        ),
      ),
    );
  }
}
