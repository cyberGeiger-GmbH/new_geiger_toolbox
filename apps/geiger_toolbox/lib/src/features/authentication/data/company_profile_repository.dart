import 'package:conversational_agent_client/conversational_agent_client.dart';
import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/src/exceptions/app_exception.dart';
import 'package:geiger_toolbox/src/features/authentication/domain/company.dart';
import 'package:geiger_toolbox/src/features/authentication/domain/user.dart';
import 'package:geiger_toolbox/src/utils/drift_storage/database_table.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'company_profile_repository.g.dart';

class CompanyProfileRepository {
  final Ref ref;

  AppDatabase get _db => ref.read(appDatabaseProvider);

  Logger get _log => ref.read(logHandlerProvider("CompanyProfileRepository"));

  CompanyProfileRepository(this.ref);

  // create company profile
  Future<int> createCompanyProfile({required UserID userId, required Company companyInfo}) async {
    try {
      final companyProfile = CompanyProfilesCompanion(
        userId: Value(userId),
        companyName: Value(companyInfo.companyName),
        location: Value(companyInfo.location),
        description: Value(companyInfo.description),
      );
      return await _db.into(_db.companyProfiles).insert(companyProfile);
    } catch (e) {
      rethrow;
    }
  }

  Future<bool?> updateCompanyProfile({required UserID userId, required Company companyInfo}) async {
    try {
      final companyProfile = CompanyProfilesCompanion(
        userId: Value(userId),
        companyName: Value(companyInfo.companyName),
        location: Value(companyInfo.location),
        description: Value(companyInfo.description),
      );
      return _db.update(_db.companyProfiles).replace(companyProfile);
    } catch (e) {
      rethrow;
    }
  }

  Future<Company?> fetchCompany() async {
    try {
      final query =
          await (_db.select(_db.companyProfiles).join([
                  leftOuterJoin(_db.userProfiles, _db.userProfiles.userId.equalsExp(_db.companyProfiles.userId)),
                ])
                ..where(_db.companyProfiles.userId.equalsExp(_db.companyProfiles.userId))
                ..orderBy([OrderingTerm.desc(_db.userProfiles.createdAt)]))
              .getSingleOrNull();

      if (query != null) {
        final data = query.readTable(_db.companyProfiles);
        return Company(companyName: data.companyName, location: data.location, description: data.description);
      }
    } catch (e) {
      rethrow;
    }
    return null;
  }

  Stream<Company?> watchCompany() {
    try {
      final company = _db.select(_db.companyProfiles);

      final query = company.join([
        leftOuterJoin(_db.userProfiles, _db.userProfiles.userId.equalsExp(_db.companyProfiles.userId)),
      ])..where(_db.companyProfiles.userId.equalsExp(_db.companyProfiles.userId));
      final row = query.watchSingleOrNull();

      return row.map((value) {
        if (value != null) {
          final data = value.readTable(_db.companyProfiles);
          final company = Company(
            companyName: data.companyName,
            location: data.location,
            description: data.description,
          );
          return company;
        } else {
          return null;
        }
      });
    } catch (e, s) {
      _log.i("error=>$e, stack => $s");
      rethrow;
    }
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
