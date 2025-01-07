import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/features/authentication/data/user_profile_repository.dart';
import 'package:geiger_toolbox/src/localization/string_hardcoded.dart';

class UserProfileScreen extends ConsumerStatefulWidget {
  const UserProfileScreen({super.key});

  @override
  ConsumerState<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends ConsumerState<UserProfileScreen> {
  final GlobalKey<FormState> _formKeyUserInfo = GlobalKey<FormState>();

  final TextEditingController companyTextController = TextEditingController();
  final TextEditingController locationTextController = TextEditingController();

  @override
  void initState() {
    final userRepo = ref.read(getUserProvider);

    if (!userRepo.isLoading && !userRepo.hasError) {
      final user = userRepo.value;
      if (user != null) {
        companyTextController.text = user.companyName;
        locationTextController.text = user.location;
      }
    }
    super.initState();
  }

  @override
  void dispose() {
    companyTextController.dispose();
    locationTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "User Profile".hardcoded,
      ),
      body: Column(
        children: [
          Form(
            autovalidateMode: AutovalidateMode.onUserInteraction,
            key: _formKeyUserInfo,
            child: Column(
              children: [
                CustomTextField(
                    label: "Company name",
                    textEditingController: companyTextController),
                CustomTextField(
                    label: "Location",
                    textEditingController: companyTextController)
              ],
            ),
          ),
          AppButton.wideTertiary(
              label: "Create",
              context: context,
              onPressed: () {
                if (_formKeyUserInfo.currentState!.validate()) {}
              })
        ],
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key,
      required this.label,
      this.hintText,
      this.onChanged,
      required this.textEditingController,
      //required this.initValue,
      this.validator,
      this.maxLength,
      this.obscureText = false,
      this.readOnly = false,
      this.email = false});

  final String label;
  final String? hintText;
  final void Function(String value)? onChanged;
  final String? Function(String? value)? validator;
  final TextEditingController textEditingController;
  final int? maxLength;
  final bool obscureText;
  final bool readOnly;
  final bool? email;

  //final String initValue;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      //mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 12),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 3.0),
          child: TextFormField(
            keyboardType:
                email! ? TextInputType.emailAddress : TextInputType.name,
            readOnly: readOnly,
            controller: textEditingController,
            onChanged: onChanged,
            validator: validator,
            style: TextStyle(color: readOnly ? Colors.grey : Colors.black),
            maxLength: maxLength ?? 50,
            obscureText: obscureText,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: readOnly == true
                        ? BorderSide.none
                        : BorderSide(color: Colors.black45)),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.green),
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                hintText: hintText,
                fillColor:
                    readOnly == true ? Colors.grey.shade200 : Colors.white70),
          ),
        ),
      ],
    );
  }
}
