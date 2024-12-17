// ignore_for_file: prefer-match-file-name, no-magic-number

import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Conditional import implementation based on the Drift Flutter web example:
// https://github.com/simolus3/drift/tree/develop/examples/app
import 'connection/connection.dart' as impl;

part 'drift_database.g.dart';

@DataClassName('UserData')
class Users extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 255)();
  TextColumn get email => text().withLength(min: 1, max: 255)();
  TextColumn get locationId =>
      text().withLength(min: 1, max: 8).references(Locations, #countryCode)();
  @ReferenceName('deviceGroups') // Foreign key
  IntColumn get mainDevice =>
      integer().references(DeviceScores, #deviceId)(); // Foreign key
  @ReferenceName('pairedDeviceGroups')
  IntColumn get otherDevicesId =>
      integer().references(Devices, #id)(); // Foreign key
}

@DataClassName('BusinessProfileData')
class BusinessProfiles extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 100)();
  IntColumn get industryType => integer().references(Industries, #id)();
  @ReferenceName("ownerGroups") // Foreign key
  IntColumn get owner => integer().references(Users, #id)();
  // Foreign key
  @ReferenceName("pairedUserGroups")
  IntColumn get employees => integer().references(Users, #id)(); // Foreign key
}

@DataClassName('DeviceScoreData')
class DeviceScores extends Table {
  IntColumn get deviceId => integer().references(Devices, #id)(); // Foreign key
  IntColumn get score => integer().nullable()();
  DateTimeColumn get lastUpdated =>
      dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get created => dateTime().withDefault(currentDateAndTime)();
}

@DataClassName('DeviceData')
class Devices extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 100)();
  TextColumn get type => text().withLength(min: 1, max: 100)();
}

@DataClassName('IndustryData')
class Industries extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withLength(min: 1, max: 255)();
}

@DataClassName('LocationData')
class Locations extends Table {
  TextColumn get countryCode => text().withLength(min: 2, max: 2)();
  TextColumn get country => text().withLength(min: 1, max: 255)();
  TextColumn get city => text().withLength(min: 1, max: 255)();
}

@DataClassName('NewsData')
class NewsInfo extends Table {
  TextColumn get id =>
      text().withLength(min: 1, max: 8).customConstraint('UNIQUE NOT NULL')();
  IntColumn get order => integer().customConstraint('UNIQUE NOT NULL')();

  TextColumn get title => text().withLength(min: 1, max: 255)();
  TextColumn get summary => text()();
  TextColumn get imageUrl => text()();
  TextColumn get dateCreated => text().withLength(min: 1, max: 100)();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('RecommendationData')
class Recommendations extends Table {
  TextColumn get id => text().withLength(min: 1, max: 8)();
  TextColumn get newsId => text().references(NewsInfo, #id)(); // Foreign key
  IntColumn get order => integer().customConstraint('UNIQUE NOT NULL')();
  TextColumn get name => text().withLength(min: 1, max: 255)();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('OfferingData')
class Offerings extends Table {
  TextColumn get id => text().customConstraint('UNIQUE NOT NULL')();
  TextColumn get recommendationId =>
      text().references(Recommendations, #id)(); // Foreign key

  IntColumn get order => integer().customConstraint('UNIQUE NOT NULL')();

  TextColumn get name => text().withLength(min: 1, max: 255)();
  TextColumn get summary => text()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('SmeProfileData')
class SmeProfiles extends Table {
  IntColumn get actor => integer().references(Users, #id)(); // Foreign key
  TextColumn get verb => text().withLength(min: 1, max: 255)();
  TextColumn get implRecoID => text().references(Recommendations, #id)();
}

@DataClassName('TodoRecommendationStatusData')
class TodoRecommendationStatuses extends Table {
  TextColumn get recommendationId =>
      text().references(Recommendations, #id)(); // Foreign key
  BoolColumn get completed => boolean().withDefault(const Constant(false))();
}

@DriftDatabase(
  tables: [
    Users,
    BusinessProfiles,
    DeviceScores,
    Devices,
    Industries,
    Locations,
    SmeProfiles,
    TodoRecommendationStatuses,
    NewsInfo,
    Recommendations,
    Offerings,
  ],
)
class AppDatabase extends _$AppDatabase {
  @override
  int get schemaVersion => 1;

  AppDatabase() : super(impl.connect());
}

@Riverpod(keepAlive: true)
AppDatabase appDatabase(Ref ref) {
  return AppDatabase();
}
