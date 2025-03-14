import 'package:core_ui/tokens/spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geiger_toolbox/src/features/authentication/presentation/validators/string_validators.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.textEditingController,
    this.label,
    this.hint = 'For example "CyberGEIGER"',
    required this.enabled,
    required this.validator,
    this.textInputAction = TextInputAction.none,
    this.isEmail = false,
    this.isPassword = false,
    this.autoComplete = false,
    this.onEditingComplete,
    this.maxLength,
    this.autofillHints,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.maxLines,
  });

  final TextEditingController textEditingController;
  final String? label;
  final String? hint;
  final bool enabled;
  final String? Function(String? value)? validator;
  final TextInputAction? textInputAction;
  final bool autoComplete;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onChanged;
  final List<String>? autofillHints;
  final TextInputType keyboardType;
  final int? maxLength;
  final bool isPassword;
  final bool isEmail;

  final int? maxLines;

  // Regex pattern to match emojis
  static final RegExp emojiRegex = RegExp(
    r'[\u{1F300}-\u{1F9FF}]|[\u{2600}-\u{26FF}]|[\u{2700}-\u{27BF}]|[\u{1F000}-\u{1F02F}]|[\u{1F0A0}-\u{1F0FF}]|[\u{1F100}-\u{1F64F}]|[\u{1F680}-\u{1F6FF}]|[\u{1F900}-\u{1F9FF}]|[\u{2190}-\u{21FF}]|[\u{2300}-\u{23FF}]|[\u{1F170}-\u{1F251}]',
    unicode: true,
  );

  @override
  Widget build(BuildContext context) {
    final appTheme = Theme.of(context);
    return TextFormField(
      key: key,
      controller: textEditingController,
      style: appTheme.textTheme.bodySmall,
      enabled: enabled,
      decoration: getInputDecoration(appTheme),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textCapitalization: TextCapitalization.sentences,
      autofillHints: autofillHints,
      validator: validator,
      autocorrect: autoComplete,
      obscureText: isPassword,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      keyboardAppearance: Brightness.light,
      onEditingComplete: onEditingComplete,
      onChanged: onChanged,

      inputFormatters: <TextInputFormatter>[
        if (isEmail) ValidatorInputFormatter(editingValidator: EmailEditingRegexValidator()),
        FilteringTextInputFormatter.deny(emojiRegex),
      ],
      maxLength: maxLength,
      maxLines: maxLines,
    );
  }

  InputDecoration getInputDecoration(ThemeData appTheme) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      enabled: enabled,
      labelStyle: appTheme.textTheme.bodySmall,
      hintStyle: appTheme.textTheme.bodySmall,
      helperStyle: appTheme.textTheme.bodySmall,
      filled: true,
      fillColor: appTheme.colorScheme.onInverseSurface,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: appTheme.colorScheme.primary),
        borderRadius: BorderRadius.circular(15),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide(color: appTheme.colorScheme.error),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: Spacing.p16, vertical: Spacing.p12),
    );
  }
}
