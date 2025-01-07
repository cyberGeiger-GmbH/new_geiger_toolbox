import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/utils/drift_storage/database_table.dart';
import 'package:geiger_toolbox/src/features/authentication/domain/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_profile_repository.g.dart';

class UserProfileRepository {
  final Ref ref;

  AppDatabase get db => ref.read(appDatabaseProvider);

  UserProfileRepository(this.ref);

  Future<void> createUserProfile({required User user}) async {
    try {
      final userProfile = UserProfileCompanion(
          companyName: Value(user.companyName),
          location: Value(user.companyName));
      db.into(db.userProfile).insertOnConflictUpdate(userProfile);
    } catch (e) {
      rethrow;
    }
  }

  Future<User?> getUser() async {
    final query = db.selectOnly(db.userProfile);
    final row = await query.getSingle();
    final userData = row.readTableOrNull(db.userProfile);

    if (userData != null) {
      return User(
          id: userData.id,
          companyName: userData.companyName,
          location: userData.location);
    }
    return null;
  }
}

@riverpod
UserProfileRepository userProfileRepository(Ref ref) {
  return UserProfileRepository(ref);
}

@riverpod
Future<User?> getUser(Ref ref) async {
  final repo = ref.read(userProfileRepositoryProvider);

  return repo.getUser();
}
