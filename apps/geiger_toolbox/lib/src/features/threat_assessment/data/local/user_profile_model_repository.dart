import 'package:conversational_agent_client/conversational_agent_client.dart';
import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/utils/drift_storage/database_table.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_profile_model_repository.g.dart';

class UserProfileModelRepository {
  final Ref ref;

  Logger get _log => ref.read(logHandlerProvider("UserProfileModelRepository"));
  AppDatabase get _db => ref.read(appDatabaseProvider);

  UserProfileModelRepository(this.ref);

  Future<void> storeUserProfile({required Profile currentUserProfile}) async {
    try {
      final value = PreviousUserProfilesCompanion(
        id: Value(1),
        previousProfile: Value(currentUserProfile),
      );
      await _db.into(_db.previousUserProfiles).insertOnConflictUpdate(value);
    } catch (e, s) {
      _log.e("$e, $s");
      rethrow;
    }
  }

  Future<Profile?> fetchPreviousUserProfile() async {
    final query = _db.select(_db.previousUserProfiles);
    final row = await query.getSingleOrNull();
    return row?.previousProfile;
  }
}

@riverpod
UserProfileModelRepository userProfileModelRepository(Ref ref) {
  return UserProfileModelRepository(ref);
}
