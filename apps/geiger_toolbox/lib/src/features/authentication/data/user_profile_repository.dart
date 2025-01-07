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
          companyName: Value(user.companyName), location: Value(user.location));
      await db.into(db.userProfile).insert(userProfile);
    } catch (e) {
      rethrow;
    }
  }

  Future<bool?> updateUserProfile(
      {required int userId, required User user}) async {
    final userData = UserData(id: userId, user: user);
    try {
      final userProfile = UserProfileCompanion(
          id: Value(userData.id),
          companyName: Value(userData.user.companyName),
          location: Value(userData.user.location));
      return db.update(db.userProfile).replace(userProfile);
    } catch (e) {
      rethrow;
    }
  }

  Future<User?> fetchUser() async {
    try {
      final query = db.select(db.userProfile);
      final row = await query.getSingle();

      final user = User(companyName: row.companyName, location: row.location);
      return user;
    } catch (e) {
      return null;
    }
  }

  Stream<UserData?> watchUser() {
    final query = db.select(db.userProfile);
    final row = query.watchSingleOrNull();

    return row.map(
      (userData) => userData != null
          ? UserData(
              id: userData.id,
              user: User(
                  companyName: userData.companyName,
                  location: userData.location),
            )
          : null,
    );
  }
}

@riverpod
UserProfileRepository userProfileRepository(Ref ref) {
  return UserProfileRepository(ref);
}

@riverpod
Stream<UserData?> watchUser(Ref ref) {
  final repo = ref.read(userProfileRepositoryProvider);

  return repo.watchUser();
}

@riverpod
Future<User?> fetchUser(Ref ref) async {
  final repo = ref.read(userProfileRepositoryProvider);
  return repo.fetchUser();
}
