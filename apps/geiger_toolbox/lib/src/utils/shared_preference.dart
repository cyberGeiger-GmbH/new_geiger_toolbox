import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_preference.g.dart';

class SharedPreference {
  static const termsConditionKey = 'app_terms_condition';
  static const skipProfileKey = "skip_profile_creation";
  static const closeScoreMessage = "close_score_message";

  SharedPreference._();
}

@Riverpod(keepAlive: true)
Future<SharedPreferences> sharedPreferences(Ref ref) async {
  return SharedPreferences.getInstance();
}
