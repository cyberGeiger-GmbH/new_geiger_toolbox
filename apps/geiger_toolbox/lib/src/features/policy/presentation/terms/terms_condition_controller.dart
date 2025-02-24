import 'package:flutter/material.dart';
import 'package:geiger_toolbox/src/utils/shared_preference.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'terms_condition_controller.g.dart';

@riverpod
class TermsConditionController extends _$TermsConditionController {
  SharedPreferences get _sharedPreferences => ref.watch(sharedPreferencesProvider).requireValue;

  @override
  bool build() {
    final terms = _sharedPreferences.getBool(SharedPreference.termsConditionKey);

    return terms ?? false;
  }

  void acceptTermsAndCondition() {
    _sharedPreferences.setBool(SharedPreference.termsConditionKey, state);
  }

  void onChanged(bool value) {
    debugPrint("onChanged: $value");
    state = value;
  }
}
