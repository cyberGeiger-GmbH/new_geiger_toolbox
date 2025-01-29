import 'package:geiger_toolbox/src/utils/shared_preference.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'profile_screen_controller.g.dart';

@riverpod
class ProfileScreenController extends _$ProfileScreenController {
  SharedPreferences get _sharedPreferences =>
      ref.watch(sharedPreferencesProvider).requireValue;

  @override
  bool build() {
    final skip = _sharedPreferences.getBool(SharedPreference.skipProfileKey);
    return skip ?? false;
  }

  void skip(bool value) {
    _sharedPreferences.setBool(SharedPreference.skipProfileKey, value);
    // invalidate to ensure listeners rebuild when the value changes
    ref.invalidateSelf();
  }
}
