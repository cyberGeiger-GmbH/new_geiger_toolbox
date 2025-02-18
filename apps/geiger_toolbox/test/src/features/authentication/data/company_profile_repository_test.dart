// ignore_for_file: avoid_print

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart' as tester;
import 'package:geiger_toolbox/src/features/authentication/data/company_profile_repository.dart';

import 'package:geiger_toolbox/src/features/authentication/data/user_profile_repository.dart';
import 'package:geiger_toolbox/src/features/authentication/domain/company.dart';
import 'package:geiger_toolbox/src/features/authentication/domain/user.dart';
import 'package:geiger_toolbox/src/utils/drift_storage/database_table.dart';
import 'package:geiger_toolbox/src/utils/uuid.dart';

void main() {
  late ProviderContainer container;

  DatabaseConnection testDatabaseConnection() {
    return DatabaseConnection(NativeDatabase.memory());
  }

  ProviderContainer getDataBaseContainer() {
    final container = ProviderContainer(
      overrides: [
        appDatabaseProvider.overrideWithValue(
          /// Replace the [QueryExecutor] parameter with a [DatabaseConnection]
          AppDatabase(testDatabaseConnection()),
        ),
      ],
    );

    return container;
  }

  tester.setUpAll(() async {
    container = getDataBaseContainer();
  });

  tester.tearDownAll(() {
    container.dispose();
  });

  tester.group('Test Case: watch company profile: ', () {
    final company = Company(companyName: "Cyber Geiger", location: "Freiburg", description: "start up");

    tester.test("'Stream emits null initially and then the company object after insertion", () async {
      final uuid = container.read(getUuidProvider);
      final userRepo = container.read(userProfileRepositoryProvider);
      final compRepo = container.read(companyProfileRepositoryProvider);

      final User user = User(userId: uuid, owner: true, name: "tester", email: "tester@gmail.com");
      //create user
      final userResult = await userRepo.createUserProfile(user: user);
      tester.expect(userResult, 1);

      //stream user
      final Stream<Company?> stream = compRepo.watchCompany();
      // lister to the stream
      final expectation = tester.expectLater(stream, tester.emitsInOrder([tester.isNull, tester.isA<Company>()]));
      //retrieve user
      final userObj = await userRepo.fetchUser();
      tester.expect(userObj, tester.isNotNull);

      //create company profile
      final userCompanyResult = await compRepo.createCompanyProfile(userId: userObj!.userId, companyInfo: company);
      tester.expect(userCompanyResult, 1);

      // wait for the stream to emit expected values
      await expectation;
    });
  });

  tester.group('Test Case: fetch a company profile: ', () {
    final company = Company(companyName: "Cyber Geiger", location: "Freiburg", description: "start up");

    tester.test("fetch company profile", () async {
      final compRepo = container.read(companyProfileRepositoryProvider);

      //create company profile
      final userCompanyResult = await compRepo.fetchCompany();

      tester.expect(userCompanyResult, tester.isNotNull);
      tester.expect(userCompanyResult!.companyName, company.companyName);
    });
  });
}
