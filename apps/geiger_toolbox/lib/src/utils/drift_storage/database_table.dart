// ignore_for_file: prefer-match-file-name, no-magic-number

import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

// Conditional import implementation based on the Drift Flutter web example:
// https://github.com/simolus3/drift/tree/develop/examples/app
import 'connection/connection.dart' as impl;

part 'database_table.g.dart';

@DataClassName('UserProfileData')
class UserProfiles extends Table {
  TextColumn get userId => text().withLength(min: 36, max: 36)();
  TextColumn get name => text().nullable()();
  TextColumn get email => text().nullable()();
  BoolColumn get owner => boolean().withDefault(const Constant(true))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {userId};
}

@DataClassName("CompanyProfileData")
class CompanyProfiles extends Table {
  TextColumn get companyName => text()();
  TextColumn get userId => text().references(UserProfiles, #userId)();
  TextColumn get location => text().withLength(min: 1, max: 255)();
  TextColumn get description => text()();

  @override
  Set<Column> get primaryKey => {companyName};
}

@DataClassName("GeigerScoreData")
class GeigerScores extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get userId => text().references(UserProfiles, #userId)();
  TextColumn get reason => text()();
  IntColumn get score => integer()();

  DateTimeColumn get lastUpdated =>
      dateTime().withDefault(currentDateAndTime)();
}

// class ReasonData extends TypeConverter<List<String>, String> {
//   const ReasonData();
//   @override
//   List<String> fromSql(String fromDb) {
//     return List<String>.from(json.decode(fromDb));
//   }

//   @override
//   String toSql(List<String> value) {
//     return json.encode(value); // Use json.encode
//   }
// }

@DataClassName('NewsData')
class NewsInfo extends Table {
  TextColumn get id => text().customConstraint('UNIQUE NOT NULL')();

  TextColumn get title => text().withLength(min: 1, max: 255)();
  TextColumn get summary => text()();
  TextColumn get imageUrl => text()();
  DateTimeColumn get dateCreated => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('RecommendationData')
class Recommendations extends Table {
  TextColumn get id => text().customConstraint('UNIQUE NOT NULL')();
  TextColumn get newsId => text().references(NewsInfo, #id)(); // Foreign key
  TextColumn get name => text().withLength(min: 1, max: 255)();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('OfferingData')
class Offerings extends Table {
  TextColumn get id => text().customConstraint('UNIQUE NOT NULL')();
  TextColumn get recommendationId =>
      text().references(Recommendations, #id)(); // Foreign key

  TextColumn get name => text().withLength(min: 1, max: 255)();
  TextColumn get summary => text()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('TodoOfferingStatusData')
class TodoOfferingStatuses extends Table {
  TextColumn get offeringId => text().references(Offerings, #id)();
// Foreign key
  BoolColumn get added => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {offeringId};
}

// TextColumn get locationId =>
//     text().withLength(min: 1, max: 8).references(Locations, #countryCode)();
// @ReferenceName('deviceGroups') // Foreign key
// IntColumn get mainDevice =>
//     integer().references(DeviceScores, #deviceId)(); // Foreign key
// @ReferenceName('pairedDeviceGroups')
// IntColumn get otherDevicesId =>
//     integer().references(Devices, #id)(); // Foreign key

// @DataClassName('BusinessProfileData')
// class BusinessProfiles extends Table {
//   IntColumn get id => integer().autoIncrement()();
//   TextColumn get name => text().withLength(min: 1, max: 100)();
//   IntColumn get industryType => integer().references(Industries, #id)();
//   @ReferenceName("ownerGroups") // Foreign key
//   IntColumn get owner => integer().references(Users, #id)();
//   // Foreign key
//   @ReferenceName("pairedUserGroups")
//   IntColumn get employees => integer().references(Users, #id)(); // Foreign key
// }

// @DataClassName('IndustryData')
// class Industries extends Table {
//   IntColumn get id => integer().autoIncrement()();
//   TextColumn get name => text().withLength(min: 1, max: 255)();
// }

// @DataClassName('LocationData')
// class Locations extends Table {
//   TextColumn get countryCode => text().withLength(min: 2, max: 2)();
//   TextColumn get country => text().withLength(min: 1, max: 255)();
//   TextColumn get city => text().withLength(min: 1, max: 255)();
// }

// @DataClassName('SmeProfileData')
// class SmeProfiles extends Table {
//   IntColumn get actor => integer().references(Users, #id)(); // Foreign key
//   TextColumn get verb => text().withLength(min: 1, max: 255)();
//   TextColumn get implRecoID => text().references(Recommendations, #id)();
// }

@DriftDatabase(
  tables: [
    UserProfiles,
    CompanyProfiles,
    GeigerScores,
    NewsInfo,
    Recommendations,
    Offerings,
    TodoOfferingStatuses,
    //BusinessProfiles,
    // Industries,
    // Locations,
    //SmeProfiles,
  ],
)
class AppDatabase extends _$AppDatabase {
  @override
  int get schemaVersion => 1;

  AppDatabase(super.connection);

  factory AppDatabase.runDatabase() => AppDatabase(impl.connect());
}

@Riverpod(keepAlive: true)
AppDatabase appDatabase(Ref ref) {
  return AppDatabase.runDatabase();
}
