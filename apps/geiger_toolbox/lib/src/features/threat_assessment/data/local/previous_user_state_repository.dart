import 'package:conversational_agent_client/conversational_agent_client.dart';
import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/exceptions/app_exception.dart';
import 'package:geiger_toolbox/src/utils/drift_storage/database_table.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'previous_user_state_repository.g.dart';

class PreviousUserStateRepository {
  final Ref ref;

  Logger get _log => ref.read(logHandlerProvider("UserProfileModelRepository"));
  AppDatabase get _db => ref.read(appDatabaseProvider);

  PreviousUserStateRepository(this.ref);

  Future<void> storeUserProfileState({required Profile currentUserProfile}) async {
    try {
      final value = PreviousUserProfilesCompanion(id: Value(1), previousProfile: Value(currentUserProfile));
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

  // for testing purpose
  Future<void> deleteOldProfileSate() async {
    try {
      _log.i("deleting previous user profile...");
      await _db.delete(_db.previousUserProfiles).go();
      _log.i("previous user profile deleted");
    } catch (e) {
      _log.e(e);
      throw DataBaseException();
    }
  }
}

@riverpod
PreviousUserStateRepository previousUserStateRepo(Ref ref) {
  return PreviousUserStateRepository(ref);
}
