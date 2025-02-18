import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/exceptions/app_exception.dart';
import 'package:geiger_toolbox/src/features/authentication/domain/user.dart';
import 'package:geiger_toolbox/src/utils/drift_storage/database_table.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_profile_repository.g.dart';

class UserProfileRepository {
  final Ref ref;

  AppDatabase get _db => ref.read(appDatabaseProvider);

  UserProfileRepository(this.ref);

  //create user profile
  Future<int> createUserProfile({required User user}) async {
    try {
      final userProfile = UserProfilesCompanion(
        userId: Value(user.userId),
        name: Value(user.name),
        email: Value(user.email),
        owner: Value(user.owner),
      );
      return await _db.into(_db.userProfiles).insert(userProfile);
    } catch (e) {
      rethrow;
    }
  }

  Future<bool?> updateUserProfile({required UserID userId, required User user}) async {
    try {
      final userProfile = UserProfilesCompanion(
        name: Value(user.name),
        email: Value(user.email),
        owner: Value(user.owner),
        createdAt: Value(user.createdAt!),
      );
      return _db.update(_db.userProfiles).replace(userProfile);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteProfile() async {
    try {
      await _db.delete(_db.userProfiles).go();
    } catch (e) {
      throw DataBaseException();
    }
  }

  Future<User?> fetchUser() async {
    try {
      final query = _db.select(_db.userProfiles);
      final row = await query.getSingle();

      final user = User(
        userId: row.userId,
        name: row.name,
        email: row.email,
        owner: row.owner,
        createdAt: row.createdAt,
      );
      return user;
    } catch (e) {
      return null;
    }
  }

  Stream<User?> watchUser() {
    final query = _db.select(_db.userProfiles);
    final row = query.watchSingleOrNull();

    return row.map(
      (user) =>
          user != null
              ? User(
                userId: user.userId,
                name: user.name,
                email: user.email,
                owner: user.owner,
                createdAt: user.createdAt,
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
Stream<User?> watchUser(Ref ref) {
  final repo = ref.read(userProfileRepositoryProvider);

  return repo.watchUser();
}

@riverpod
Future<User?> fetchUser(Ref ref) async {
  final repo = ref.read(userProfileRepositoryProvider);
  return repo.fetchUser();
}
