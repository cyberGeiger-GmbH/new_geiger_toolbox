import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/utils/shared_preference.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'skip_profile_creation_service.g.dart';

class SkipProfileCreation {
  final Ref ref;
  SharedPreferences get _sharedPreferences =>
      ref.watch(sharedPreferencesProvider).requireValue;

  SkipProfileCreation(this.ref);

  bool getValue() {
    final skip = _sharedPreferences.getBool(SharedPreference.skipProfileKey);
    return skip ?? false;
  }

  void skip(bool value) {
    _sharedPreferences.setBool(SharedPreference.skipProfileKey, value);
    // invalidate to ensure listeners rebuild when the value changes
    ref.invalidateSelf();
  }
}

@riverpod
SkipProfileCreation skipProfileCreation(Ref ref) {
  return SkipProfileCreation(ref);
}
