// ignore_for_file: unused_local_variable, unused_import
import 'package:drift/drift.dart';
import 'package:drift_dev/api/migrations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geiger_toolbox/src/utils/drift_storage/database_table.dart';
import 'generated/schema.dart';

import 'generated/schema_v1.dart' as v1;
import 'generated/schema_v2.dart' as v2;
import 'package:geiger_toolbox/src/utils/drift_storage/connection/connection.dart' as impl;
void main() {
  driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;
  late SchemaVerifier verifier;

  setUpAll(() {
    verifier = SchemaVerifier(GeneratedHelper());
  });

  group('simple database migrations', () {
    // These simple tests verify all possible schema updates with a simple (no
    // data) migration. This is a quick way to ensure that written database
    // migrations properly alter the schema.
    final versions = GeneratedHelper.versions;
    for (final (i, fromVersion) in versions.indexed) {
      group('from $fromVersion', () {
        for (final toVersion in versions.skip(i + 1)) {
          test('to $toVersion', () async {
            final schema = await verifier.schemaAt(fromVersion);
            final db = AppDatabase(schema.newConnection());
            await verifier.migrateAndValidate(db, toVersion);
            await db.close();
          });
        }
      });
    }
  });

  // Simple tests ensure the schema is transformed correctly, but some
  // migrations benefit from a test verifying that data is transformed correctly
  // too. This is particularly true for migrations that change existing columns
  // (e.g. altering their type or constraints). Migrations that only add tables
  // or columns typically don't need these advanced tests.
  // TODO: Check whether you have migrations that could benefit from these tests
  // and adapt this example to your database if necessary:
  test("migration from v1 to v2 does not corrupt data", () async {
    // Add data to insert into the old database, and the expected rows after the
    // migration.
    final oldUserProfilesData = <v1.UserProfilesData>[];
    final expectedNewUserProfilesData = <v2.UserProfilesData>[];

    final oldCompanyProfilesData = <v1.CompanyProfilesData>[];
    final expectedNewCompanyProfilesData = <v2.CompanyProfilesData>[];

    final oldGeigerScoresData = <v1.GeigerScoresData>[];
    final expectedNewGeigerScoresData = <v2.GeigerScoresData>[];

    final oldReasonsData = <v1.ReasonsData>[];
    final expectedNewReasonsData = <v2.ReasonsData>[];

    final oldNewsInfoData = <v1.NewsInfoData>[];
    final expectedNewNewsInfoData = <v2.NewsInfoData>[];

    final oldRecommendationsData = <v1.RecommendationsData>[];
    final expectedNewRecommendationsData = <v2.RecommendationsData>[];

    final oldOfferingsData = <v1.OfferingsData>[];
    final expectedNewOfferingsData = <v2.OfferingsData>[];

    final oldTodoOfferingStatusesData = <v1.TodoOfferingStatusesData>[];
    final expectedNewTodoOfferingStatusesData = <v2.TodoOfferingStatusesData>[];

    await verifier.testWithDataIntegrity(
      oldVersion: 1,
      newVersion: 2,
      createOld: v1.DatabaseAtV1.new,
      createNew: v2.DatabaseAtV2.new,
      openTestedDatabase: AppDatabase.new,
      createItems: (batch, oldDb) {
        batch.insertAll(oldDb.userProfiles, oldUserProfilesData);
        batch.insertAll(oldDb.companyProfiles, oldCompanyProfilesData);
        batch.insertAll(oldDb.geigerScores, oldGeigerScoresData);
        batch.insertAll(oldDb.reasons, oldReasonsData);
        batch.insertAll(oldDb.newsInfo, oldNewsInfoData);
        batch.insertAll(oldDb.recommendations, oldRecommendationsData);
        batch.insertAll(oldDb.offerings, oldOfferingsData);
        batch.insertAll(
            oldDb.todoOfferingStatuses, oldTodoOfferingStatusesData);
      },
      validateItems: (newDb) async {
        expect(expectedNewUserProfilesData,
            await newDb.select(newDb.userProfiles).get());
        expect(expectedNewCompanyProfilesData,
            await newDb.select(newDb.companyProfiles).get());
        expect(expectedNewGeigerScoresData,
            await newDb.select(newDb.geigerScores).get());
        expect(expectedNewReasonsData, await newDb.select(newDb.reasons).get());
        expect(
            expectedNewNewsInfoData, await newDb.select(newDb.newsInfo).get());
        expect(expectedNewRecommendationsData,
            await newDb.select(newDb.recommendations).get());
        expect(expectedNewOfferingsData,
            await newDb.select(newDb.offerings).get());
        expect(expectedNewTodoOfferingStatusesData,
            await newDb.select(newDb.todoOfferingStatuses).get());
      },
    );
  });
}
