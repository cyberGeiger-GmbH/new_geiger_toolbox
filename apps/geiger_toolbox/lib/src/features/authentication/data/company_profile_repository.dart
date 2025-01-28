import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/exceptions/app_exception.dart';
import 'package:geiger_toolbox/src/features/authentication/domain/company.dart';
import 'package:geiger_toolbox/src/utils/drift_storage/database_table.dart';
import 'package:geiger_toolbox/src/features/authentication/domain/user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'company_profile_repository.g.dart';

class CompanyProfileRepository {
  final Ref ref;

  AppDatabase get _db => ref.read(appDatabaseProvider);

  CompanyProfileRepository(this.ref);

  // create company profile
  Future<void> createCompanyProfile(
      {required UserID userId, required Company companyInfo}) async {
    try {
      final companyProfile = CompanyProfilesCompanion(
        userId: Value(userId),
        companyName: Value(companyInfo.companyName),
        location: Value(companyInfo.location),
        description: Value(companyInfo.description),
      );
      await _db.into(_db.companyProfiles).insert(companyProfile);
    } catch (e) {
      rethrow;
    }
  }

  Future<bool?> updateCompanyProfile(
      {required UserID userId, required Company companyInfo}) async {
    try {
      final companyProfile = CompanyProfilesCompanion(
          userId: Value(userId),
          companyName: Value(companyInfo.companyName),
          location: Value(companyInfo.location),
          description: Value(companyInfo.description));
      return _db.update(_db.companyProfiles).replace(companyProfile);
    } catch (e) {
      rethrow;
    }
  }

  Future<Company?> fetchCompany() async {
    try {
      final query = _db.select(_db.companyProfiles).join([
        leftOuterJoin(_db.userProfiles,
            _db.userProfiles.userId.equalsExp(_db.companyProfiles.userId))
      ])
        ..where(
            _db.companyProfiles.userId.equalsExp(_db.companyProfiles.userId));

      final row = await query.getSingleOrNull();

      if (row != null) {
        final data = row.readTable(_db.companyProfiles);
        return Company(
            companyName: data.companyName,
            location: data.location,
            description: data.description);
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }

  Stream<Company?> watchCompany() {
    final query = _db.select(_db.companyProfiles).join([
      leftOuterJoin(_db.userProfiles,
          _db.userProfiles.userId.equalsExp(_db.companyProfiles.userId))
    ])
      ..where(_db.companyProfiles.userId.equalsExp(_db.companyProfiles.userId));
    final row = query.watchSingleOrNull();

    return row.map((value) {
      if (value != null) {
        final data = value.readTable(_db.companyProfiles);
        final company = Company(
            companyName: data.companyName,
            location: data.location,
            description: data.description);
        return company;
      } else {
        return null;
      }
    });
  }

  Future<void> deleteCompanyProfile() async {
    try {
      await _db.delete(_db.companyProfiles).go();
    } catch (e) {
      throw DataBaseException();
    }
  }
}

@riverpod
CompanyProfileRepository companyProfileRepository(Ref ref) {
  return CompanyProfileRepository(ref);
}

@riverpod
Stream<Company?> watchCompany(Ref ref) {
  final repo = ref.read(companyProfileRepositoryProvider);
  return repo.watchCompany();
}

@Riverpod(keepAlive: true)
Future<Company?> fetchCompany(Ref ref) async {
  final repo = ref.read(companyProfileRepositoryProvider);
  return repo.fetchCompany();
}
