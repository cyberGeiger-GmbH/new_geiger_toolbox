import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/common_widgets/async_value_widget.dart';
import 'package:geiger_toolbox/src/extensions/async_value_extension.dart';
import 'package:geiger_toolbox/src/features/authentication/data/user_profile_repository.dart';

import 'package:geiger_toolbox/src/features/authentication/domain/user.dart';
import 'package:geiger_toolbox/src/features/authentication/presentation/company_name_location_validators.dart';
import 'package:geiger_toolbox/src/features/authentication/presentation/string_validators.dart';
import 'package:geiger_toolbox/src/features/authentication/presentation/user_profile_controller.dart';
import 'package:geiger_toolbox/src/localization/string_hardcoded.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});
  // * Keys for testing using find.byKey()
  static const companyKey = Key('companyName');
  static const locationKey = Key('location');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "User Profile",
      ),
      body: Consumer(builder: (context, ref, _) {
        final userDataValue = ref.watch(watchUserProvider);
        return AsyncValueWidget<UserData?>(
          value: userDataValue,
          data: (userData) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: UserProfileContents(
              user: userData,
            ),
          ),
        );
      }),
    );
  }
}

///A widget for company name and location, supporting the following
///- preload user info if exist
/// - update/create user info
///
class UserProfileContents extends ConsumerStatefulWidget {
  const UserProfileContents({super.key, this.onSubmit, this.user});
  final VoidCallback? onSubmit;
  final UserData? user;

  @override
  ConsumerState<UserProfileContents> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends ConsumerState<UserProfileContents>
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
    final data = widget.user;
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

    final user = User(companyName: companyName, location: location);
    final success = await controller.createProfile(user: user);
    if (success) {
      widget.onSubmit?.call();
    }
  }

  Future<void> updateProfile() async {
    final controller = ref.read(userProfileControllerProvider.notifier);
    if (widget.user != null) {
      final user = User(companyName: companyName, location: location);
      final userData = UserData(id: widget.user!.id, user: user);
      final success = await controller.updateProfile(userData: userData);
      if (success) {
        widget.onSubmit?.call();
      }
    }
  }

  Future<void> _submit() async {
    setState(() => _submitted = true);
    //only submit the form if validation passes
    if (_validateAndSaveForm()) {
      if (widget.user != null) {
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
    if (canSubmitLocation(location)) {
      _node.previousFocus();
      return;
    }
    _submit();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(userProfileControllerProvider,
        (_, newState) => newState.showAlertDialogOnError(context: context));
    ref.listen(userProfileControllerProvider,
        (_, nxt) => nxt.userProfileSuccessSnackBar(context: context));

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
              hint: "CyberGeiger GbmH",
              enabled: !state.isLoading,
              validator: (companyName) =>
                  _submitted ? companyNameErrorText(companyName ?? "") : null,
              onEditingComplete: () => _companyNameEditingComplete(),
              autoComplete: true,
            ),
            Spacing.gapH8,
            CustomTextFormField(
              key: UserProfileScreen.locationKey,
              textEditingController: _locationTextController,
              label: "Company Location",
              hint: "Freiburg",
              enabled: !state.isLoading,
              validator: (location) =>
                  _submitted ? locationErrorText(location ?? "") : null,
              onEditingComplete: () => _locationEditingComplete(),
              isLastField: true,
              autoComplete: true,
            ),
            Spacing.gapH8,
            AppButton.tertiary(
              label: widget.user != null
                  ? "Update Profile".hardcoded
                  : "Create Profile".hardcoded,
              context: context,
              isloading: state.isLoading,
              onPressed: state.isLoading ? null : () => _submit(),
            )
          ],
        ),
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.textEditingController,
    required this.label,
    required this.hint,
    required this.enabled,
    required this.validator,
    this.isLastField = false,
    this.isEmail = false,
    this.isPassword = false,
    this.autoComplete = false,
    this.onEditingComplete,
    this.maxLength,
  });

  final TextEditingController textEditingController;
  final String label;
  final String hint;
  final bool enabled;
  final String? Function(String? value)? validator;
  final bool isLastField;
  final bool autoComplete;
  final VoidCallback? onEditingComplete;

  final int? maxLength;
  final bool isEmail;
  final bool isPassword;

  //final String initValue;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: key,
      controller: textEditingController,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        enabled: enabled,
        //filled: true,
        // fillColor: readOnly == true ? Colors.grey.shade200 : Colors.white70,
        // border: OutlineInputBorder(
        //     borderRadius: BorderRadius.circular(10),
        //     borderSide: readOnly == true
        //         ? BorderSide.none
        //         : BorderSide(color: Colors.black45)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      autocorrect: autoComplete,
      obscureText: isPassword,
      textInputAction:
          isLastField ? TextInputAction.done : TextInputAction.next,
      keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.name,
      keyboardAppearance: Brightness.light,
      onEditingComplete: onEditingComplete,
      inputFormatters: <TextInputFormatter>[
        if (isEmail)
          ValidatorInputFormatter(
            editingValidator: EmailEditingRegexValidator(),
          )
      ],
      maxLength: maxLength ?? 50,
    );
  }
}
