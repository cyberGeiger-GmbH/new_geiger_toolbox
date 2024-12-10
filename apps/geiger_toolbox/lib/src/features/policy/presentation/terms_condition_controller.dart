import 'package:geiger_toolbox/src/utils/shared_preference_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'terms_condition_controller.g.dart';

@riverpod
class TermsConditionController extends _$TermsConditionController {
  static const _termsConditionKey = 'app_terms_condition';

  SharedPreferences get _sharedPreferences =>
      ref.watch(sharedPreferencesProvider).requireValue;

  @override
  bool build() {
    final terms = _sharedPreferences.getBool(_termsConditionKey);

    return terms ?? false;
  }

  void acceptTermsAndCondition(bool value) {
    _sharedPreferences.setBool(_termsConditionKey, value);
    state = value;
  }
}
