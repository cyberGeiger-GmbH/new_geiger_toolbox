import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/common_widgets/section_heading.dart';
import 'package:geiger_toolbox/src/extensions/async_value_extension.dart';
import 'package:geiger_toolbox/src/features/authentication/data/company_profile_repository.dart';
import 'package:geiger_toolbox/src/features/authentication/domain/company.dart';

import 'package:geiger_toolbox/src/features/authentication/presentation/company/company_description_controller.dart';
import 'package:geiger_toolbox/src/features/authentication/presentation/company/widgets/company_description_widget.dart';
import 'package:geiger_toolbox/src/features/authentication/presentation/company/company_profile_controller.dart';
import 'package:geiger_toolbox/src/features/authentication/presentation/company/widgets/confirmation_button_widget.dart';
import 'package:geiger_toolbox/src/features/authentication/presentation/profile_screen_controller.dart';

import 'package:geiger_toolbox/src/features/authentication/presentation/validators/company_name_location_validators.dart';
import 'package:geiger_toolbox/src/common_widgets/forms/custom_text_form_field.dart';

import 'package:geiger_toolbox/src/features/authentication/presentation/user_profile_screen.dart';
import 'package:geiger_toolbox/src/localization/string_hardcoded.dart';
import 'package:geiger_toolbox/src/routing/app_routing.dart';
import 'package:go_router/go_router.dart';

class CompanyProfileFormWidget extends ConsumerStatefulWidget {
  const CompanyProfileFormWidget({super.key, this.onSubmit, this.companyData});
  final VoidCallback? onSubmit;
  final Company? companyData;

  @override
  ConsumerState<CompanyProfileFormWidget> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends ConsumerState<CompanyProfileFormWidget> with CompanyNameLocationValidators {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final _node = FocusScopeNode();
  final TextEditingController _companyTextController = TextEditingController();
  final TextEditingController _locationTextController = TextEditingController();

  final TextEditingController _companyDescriptionController = TextEditingController();

  String get companyName => _companyTextController.text;
  String get location => _locationTextController.text;
  String get companyDescription => _companyDescriptionController.text;

  //local variable used to apply AutovalidateMode.onUserInteraction and show error hints only when the form has been submitted
  var _submitted = false;

  @override
  void initState() {
    _preLoadField();
    super.initState();
  }

  @override
  void dispose() {
    _node.dispose();
    _companyTextController.dispose();
    _locationTextController.dispose();
    _companyDescriptionController.dispose();
    super.dispose();
  }

  bool _validateAndSaveForm() {
    final form = _formKey.currentState!;
    debugPrint("form.validate() => ${form.validate()}");
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void _preLoadField() {
    final data = widget.companyData;
    if (data != null) {
      _companyTextController.text = data.companyName;
      _locationTextController.text = data.location;
    }
  }

  //* on success, if the user has skipped the profile screen, we need to pop the current screen
  void _onSuccess() {
    final skip = ref.read(profileScreenControllerProvider);
    if (!skip) {
      ref.read(profileScreenControllerProvider.notifier).skip(true);
      context.goNamed(AppRouter.mainRouter.name);
    } else {
      context.pop();
    }
  }

  Future<void> _createProfile() async {
    final controller = ref.read(companyProfileControllerProvider.notifier);
    final description = await ref.read(getCompanyDescriptionProvider.future);
    final company = Company(companyName: companyName, location: location, description: description!);
    await controller.createCompanyProfile(company: company, onSuccess: _onSuccess);
  }

  Future<void> _updateProfile() async {
    final controller = ref.read(companyProfileControllerProvider.notifier);
    final description = await ref.read(getCompanyDescriptionProvider.future);

    final data = Company(companyName: companyName, location: location, description: description!);
    await controller.updateCompanyProfile(company: data, onSuccess: _onSuccess);
  }

  //update company description
  Future<void> _setCompanyDescription() async {
    final controller = ref.read(companyDescriptionControllerProvider.notifier);

    await controller.setCompanyDescription(companyName: companyName, location: location);
  }

  Future<void> _onSubmit() async {
    setState(() => _submitted = true);
    //only submit the form if validation passes

    if (_validateAndSaveForm()) {
      if (widget.companyData != null) {
        //update profile
        await _updateProfile();
      }
      //create profile
      else {
        await _createProfile();
      }
    }
  }

  void _generateCompanyProfile() {
    setState(() => _submitted = true);
    if (!canSubmitCompanyName(companyName) || !canSubmitLocation(location)) {
      return;
    }
    //if the company description is empty or not, generate the company description
    // if (_validateAndSaveForm()) {
    _setCompanyDescription();
    _node.unfocus();
    // }
  }

  void _companyNameEditingComplete() {
    if (canSubmitCompanyName(companyName)) {
      _node.nextFocus();
    }
  }

  void _locationEditingComplete() {
    //check if the company name is valid
    if (!canSubmitCompanyName(companyName)) {
      //move focus to the company name field
      _node.previousFocus();
      return;
    }
    //check if the location is valid
    if (!canSubmitLocation(location)) {
      return;
    }
    //finish autofill context to avoid autofill suggestions to be shown when the form is submitted
    TextInput.finishAutofillContext();
    //update the company description
    _setCompanyDescription();
    _node.unfocus();
  }

  void _companyDescriptionEditingComplete() async {
    final controller = ref.read(companyDescriptionControllerProvider.notifier);
    if (companyDescription.isNotEmpty) {
      await controller.updateCompanyDescription(description: companyDescription);
      _node.unfocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    //listen for error in user controller
    ref.listen(companyProfileControllerProvider, (_, newState) => newState.showAlertDialogOnError(context: context));

    ref.listen(companyProfileControllerProvider, (_, nxt) {
      nxt.updateUserProfileSuccessSnackBar(context: context);
    });

    //listen for error in company controller
    ref.listen(companyProfileControllerProvider, (_, newState) => newState.showAlertDialogOnError(context: context));

    //* testing purpose
    //update when form field when content is deleted
    ref.listen(watchCompanyProvider, (_, nxtVal) {
      final data = nxtVal.value;
      if (data == null) {
        _companyTextController.text = "";
        _locationTextController.text = "";
      }
    });

    final state = ref.watch(companyProfileControllerProvider);
    final companyDescriptionState = ref.watch(getCompanyDescriptionProvider);

    return FocusScope(
      node: _node,
      child: Form(
        key: _formKey,
        autovalidateMode: _submitted ? AutovalidateMode.onUserInteraction : AutovalidateMode.disabled,
        child: AutofillGroup(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CompanyProfileForm(
                companyData: widget.companyData,
                companyKey: CreateProfileScreen.companyKey,
                locationKey: CreateProfileScreen.locationKey,
                companyTextController: _companyTextController,
                locationTextController: _locationTextController,
                enabled: !state.isLoading,
                submitted: _submitted,
                validateCompanyName: (companyName) => companyNameErrorText(companyName ?? ""),
                validateLocation: (location) => locationErrorText(location ?? ""),
                onEditCompanyNameComplete: _companyNameEditingComplete,
                onEditLocationComplete: _locationEditingComplete,
              ),
              Spacing.gapH12,
              companyDescriptionState.isLoading
                  ? const SizedBox.shrink()
                  : GenerateCompanyProfileButton(
                    isLoading: companyDescriptionState.isLoading,
                    onPressed: () => _generateCompanyProfile(),
                    label:
                        widget.companyData == null
                            ? "Generate Company Description".hardcoded
                            : "Regenerate Company Description".hardcoded,
                  ),
              Spacing.gapH32,

              CompanyDescriptionWidget(
                controller: _companyDescriptionController,
                onEditingComplete: _companyDescriptionEditingComplete,
              ),
              Spacing.gapH12,
              ConfirmationButtonWidget(
                state: state,
                label: widget.companyData == null ? "Save Profile".hardcoded : "Update Profile".hardcoded,
                onPressed: () => _onSubmit(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CompanyProfileForm extends StatelessWidget {
  const CompanyProfileForm({
    super.key,
    required this.companyTextController,
    required this.locationTextController,
    required this.enabled,
    required this.submitted,
    required this.onEditLocationComplete,
    required this.onEditCompanyNameComplete,
    required this.validateCompanyName,
    required this.validateLocation,
    required this.companyKey,
    required this.locationKey,
    this.companyData,
  });
  final TextEditingController companyTextController;
  final TextEditingController locationTextController;
  final bool enabled;
  final bool submitted;
  final VoidCallback onEditLocationComplete;
  final VoidCallback onEditCompanyNameComplete;
  final String? Function(String? value) validateCompanyName;
  final String? Function(String? value) validateLocation;
  final Key? companyKey;
  final Key? locationKey;
  final Company? companyData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeading(
          title: companyData == null ? "Create your company profile".hardcoded : "Edit your profile".hardcoded,
        ),
        Spacing.gapH22,
        CustomTextFormField(
          key: companyKey,
          textEditingController: companyTextController,
          label: "Comany Name".hardcoded,
          autofillHints: [AutofillHints.organizationName],
          keyboardType: TextInputType.name,
          enabled: enabled,
          validator: (companyName) => submitted ? validateCompanyName(companyName) : null,
          onEditingComplete: onEditCompanyNameComplete,
          autoComplete: true,
          textInputAction: TextInputAction.next,
          maxLength: 50,
        ),
        Spacing.gapH4,
        CustomTextFormField(
          key: locationKey,
          textEditingController: locationTextController,
          label: "Company Location",
          keyboardType: TextInputType.streetAddress,
          autofillHints: [AutofillHints.addressCityAndState, AutofillHints.countryName],
          hint: 'for example "Freiburg, Germany"',
          enabled: enabled,
          validator: (location) => submitted ? validateLocation(location ?? "") : null,
          onEditingComplete: onEditLocationComplete,
          textInputAction: TextInputAction.done,
          autoComplete: true,
          maxLength: 50,
        ),
      ],
    );
  }
}
