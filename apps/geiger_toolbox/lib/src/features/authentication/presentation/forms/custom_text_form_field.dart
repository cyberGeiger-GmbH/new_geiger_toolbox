import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geiger_toolbox/src/features/authentication/presentation/validators/string_validators.dart';

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
