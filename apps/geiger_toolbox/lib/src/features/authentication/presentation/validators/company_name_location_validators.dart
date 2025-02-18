import 'package:geiger_toolbox/src/features/authentication/presentation/validators/string_validators.dart';
import 'package:geiger_toolbox/src/localization/string_hardcoded.dart';

mixin CompanyNameLocationValidators {
  final StringValidator companyNameNonEmptyValidator = NonEmptyStringValidator();
  final StringValidator companyNameMinValueValidator = MinLengthStringValidator(2);
  final StringValidator locationNonEmptyValidator = NonEmptyStringValidator();

  bool canSubmitCompanyName(String name) {
    return companyNameNonEmptyValidator.isValid(name) && companyNameMinValueValidator.isValid(name);
  }

  bool canSubmitLocation(String name) {
    return locationNonEmptyValidator.isValid(name);
  }

  String? companyNameErrorText(String name) {
    final bool showErrorText = canSubmitCompanyName(name);
    final String errrorText =
        name.isEmpty ? "Company name can't be empty".hardcoded : "Company name too short".hardcoded;
    return showErrorText ? null : errrorText;
  }

  String? locationErrorText(String name) {
    final bool showErrorText = canSubmitLocation(name);
    return showErrorText ? null : "Location can't be empty";
  }
}
