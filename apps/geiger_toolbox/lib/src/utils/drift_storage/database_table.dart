import 'dart:convert';

import 'package:conversational_agent_client/conversational_agent_client.dart';
import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Conditional import implementation based on the Drift Flutter web example:
// https://github.com/simolus3/drift/tree/develop/examples/app
import 'package:geiger_toolbox/src/utils/drift_storage/connection/connection.dart' as impl;
import 'package:riverpod_annotation/riverpod_annotation.dart';

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
  TextColumn get interpretation => text()();
  IntColumn get score => integer()();

  DateTimeColumn get lastUpdated => dateTime().withDefault(currentDateAndTime)();
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
  TextColumn get newsCategory => text()();
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
  TextColumn get rationale => text()();

  @override
  Set<Column> get primaryKey => {id, newsId};
}

@DataClassName('RecommendationOfferingData')
class RecommendationOfferings extends Table {
  TextColumn get id => text().customConstraint('UNIQUE NOT NULL')();
  TextColumn get recommendationId => text().references(Recommendations, #id)(); // Foreign key
  TextColumn get name => text().withLength(min: 1, max: 255)();
  TextColumn get summary => text()();

  DateTimeColumn get dateRecommendated => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {id};
}

enum OfferingStatus { recommended, planned, done }

class TodoOfferingStatusConverter extends TypeConverter<OfferingStatus, int> {
  const TodoOfferingStatusConverter();
  @override
  OfferingStatus fromSql(int fromDb) {
    return OfferingStatus.values[fromDb]; // Convert int to enum
  }

  @override
  int toSql(OfferingStatus value) {
    return value.index; // Convert enum to int
  }
}

@DataClassName('TodoOfferingData')
class TodoOfferings extends Table {
  TextColumn get offeringId => text().references(RecommendationOfferings, #id)();
  // Foreign key
  IntColumn get offeringStatus => integer().map(const TodoOfferingStatusConverter())();
  DateTimeColumn get lastUpdated => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {offeringId};
}

class PreviousProfileConverter extends TypeConverter<Profile, String> {
  const PreviousProfileConverter();

  @override
  Profile fromSql(String fromDb) {
    final Map<String, dynamic> json = jsonDecode(fromDb);
    return Profile.fromJson(json);
  }

  @override
  String toSql(Profile value) {
    return jsonEncode(value.toJson());
  }
}

@DataClassName("PreviousUserProfileData")
class PreviousUserProfiles extends Table {
  IntColumn get id => integer()();
  TextColumn get previousProfile => text().map(const PreviousProfileConverter())();

  @override
  Set<Column> get primaryKey => {id};
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
    RecommendationOfferings,
    TodoOfferings,
    PreviousUserProfiles,

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
  final database = AppDatabase.runDatabase();
  ref.onDispose(() async {
    await database.close();
  });
  return database;
}
