// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_database.dart';

// ignore_for_file: type=lint
class $LocationsTable extends Locations
    with TableInfo<$LocationsTable, LocationData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LocationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _countryCodeMeta =
      const VerificationMeta('countryCode');
  @override
  late final GeneratedColumn<String> countryCode = GeneratedColumn<String>(
      'country_code', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 2, maxTextLength: 2),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _countryMeta =
      const VerificationMeta('country');
  @override
  late final GeneratedColumn<String> country = GeneratedColumn<String>(
      'country', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _cityMeta = const VerificationMeta('city');
  @override
  late final GeneratedColumn<String> city = GeneratedColumn<String>(
      'city', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [countryCode, country, city];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'locations';
  @override
  VerificationContext validateIntegrity(Insertable<LocationData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('country_code')) {
      context.handle(
          _countryCodeMeta,
          countryCode.isAcceptableOrUnknown(
              data['country_code']!, _countryCodeMeta));
    } else if (isInserting) {
      context.missing(_countryCodeMeta);
    }
    if (data.containsKey('country')) {
      context.handle(_countryMeta,
          country.isAcceptableOrUnknown(data['country']!, _countryMeta));
    } else if (isInserting) {
      context.missing(_countryMeta);
    }
    if (data.containsKey('city')) {
      context.handle(
          _cityMeta, city.isAcceptableOrUnknown(data['city']!, _cityMeta));
    } else if (isInserting) {
      context.missing(_cityMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  LocationData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return LocationData(
      countryCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}country_code'])!,
      country: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}country'])!,
      city: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}city'])!,
    );
  }

  @override
  $LocationsTable createAlias(String alias) {
    return $LocationsTable(attachedDatabase, alias);
  }
}

class LocationData extends DataClass implements Insertable<LocationData> {
  final String countryCode;
  final String country;
  final String city;
  const LocationData(
      {required this.countryCode, required this.country, required this.city});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['country_code'] = Variable<String>(countryCode);
    map['country'] = Variable<String>(country);
    map['city'] = Variable<String>(city);
    return map;
  }

  LocationsCompanion toCompanion(bool nullToAbsent) {
    return LocationsCompanion(
      countryCode: Value(countryCode),
      country: Value(country),
      city: Value(city),
    );
  }

  factory LocationData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return LocationData(
      countryCode: serializer.fromJson<String>(json['countryCode']),
      country: serializer.fromJson<String>(json['country']),
      city: serializer.fromJson<String>(json['city']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'countryCode': serializer.toJson<String>(countryCode),
      'country': serializer.toJson<String>(country),
      'city': serializer.toJson<String>(city),
    };
  }

  LocationData copyWith({String? countryCode, String? country, String? city}) =>
      LocationData(
        countryCode: countryCode ?? this.countryCode,
        country: country ?? this.country,
        city: city ?? this.city,
      );
  LocationData copyWithCompanion(LocationsCompanion data) {
    return LocationData(
      countryCode:
          data.countryCode.present ? data.countryCode.value : this.countryCode,
      country: data.country.present ? data.country.value : this.country,
      city: data.city.present ? data.city.value : this.city,
    );
  }

  @override
  String toString() {
    return (StringBuffer('LocationData(')
          ..write('countryCode: $countryCode, ')
          ..write('country: $country, ')
          ..write('city: $city')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(countryCode, country, city);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LocationData &&
          other.countryCode == this.countryCode &&
          other.country == this.country &&
          other.city == this.city);
}

class LocationsCompanion extends UpdateCompanion<LocationData> {
  final Value<String> countryCode;
  final Value<String> country;
  final Value<String> city;
  final Value<int> rowid;
  const LocationsCompanion({
    this.countryCode = const Value.absent(),
    this.country = const Value.absent(),
    this.city = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  LocationsCompanion.insert({
    required String countryCode,
    required String country,
    required String city,
    this.rowid = const Value.absent(),
  })  : countryCode = Value(countryCode),
        country = Value(country),
        city = Value(city);
  static Insertable<LocationData> custom({
    Expression<String>? countryCode,
    Expression<String>? country,
    Expression<String>? city,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (countryCode != null) 'country_code': countryCode,
      if (country != null) 'country': country,
      if (city != null) 'city': city,
      if (rowid != null) 'rowid': rowid,
    });
  }

  LocationsCompanion copyWith(
      {Value<String>? countryCode,
      Value<String>? country,
      Value<String>? city,
      Value<int>? rowid}) {
    return LocationsCompanion(
      countryCode: countryCode ?? this.countryCode,
      country: country ?? this.country,
      city: city ?? this.city,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (countryCode.present) {
      map['country_code'] = Variable<String>(countryCode.value);
    }
    if (country.present) {
      map['country'] = Variable<String>(country.value);
    }
    if (city.present) {
      map['city'] = Variable<String>(city.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LocationsCompanion(')
          ..write('countryCode: $countryCode, ')
          ..write('country: $country, ')
          ..write('city: $city, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DevicesTable extends Devices with TableInfo<$DevicesTable, DeviceData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DevicesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, type];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'devices';
  @override
  VerificationContext validateIntegrity(Insertable<DeviceData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DeviceData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DeviceData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
    );
  }

  @override
  $DevicesTable createAlias(String alias) {
    return $DevicesTable(attachedDatabase, alias);
  }
}

class DeviceData extends DataClass implements Insertable<DeviceData> {
  final int id;
  final String name;
  final String type;
  const DeviceData({required this.id, required this.name, required this.type});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['type'] = Variable<String>(type);
    return map;
  }

  DevicesCompanion toCompanion(bool nullToAbsent) {
    return DevicesCompanion(
      id: Value(id),
      name: Value(name),
      type: Value(type),
    );
  }

  factory DeviceData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DeviceData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      type: serializer.fromJson<String>(json['type']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'type': serializer.toJson<String>(type),
    };
  }

  DeviceData copyWith({int? id, String? name, String? type}) => DeviceData(
        id: id ?? this.id,
        name: name ?? this.name,
        type: type ?? this.type,
      );
  DeviceData copyWithCompanion(DevicesCompanion data) {
    return DeviceData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      type: data.type.present ? data.type.value : this.type,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DeviceData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, type);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DeviceData &&
          other.id == this.id &&
          other.name == this.name &&
          other.type == this.type);
}

class DevicesCompanion extends UpdateCompanion<DeviceData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> type;
  const DevicesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
  });
  DevicesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String type,
  })  : name = Value(name),
        type = Value(type);
  static Insertable<DeviceData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? type,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
    });
  }

  DevicesCompanion copyWith(
      {Value<int>? id, Value<String>? name, Value<String>? type}) {
    return DevicesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DevicesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type')
          ..write(')'))
        .toString();
  }
}

class $DeviceScoresTable extends DeviceScores
    with TableInfo<$DeviceScoresTable, DeviceScoreData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DeviceScoresTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _deviceIdMeta =
      const VerificationMeta('deviceId');
  @override
  late final GeneratedColumn<int> deviceId = GeneratedColumn<int>(
      'device_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES devices (id)'));
  static const VerificationMeta _scoreMeta = const VerificationMeta('score');
  @override
  late final GeneratedColumn<int> score = GeneratedColumn<int>(
      'score', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _lastUpdatedMeta =
      const VerificationMeta('lastUpdated');
  @override
  late final GeneratedColumn<DateTime> lastUpdated = GeneratedColumn<DateTime>(
      'last_updated', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _createdMeta =
      const VerificationMeta('created');
  @override
  late final GeneratedColumn<DateTime> created = GeneratedColumn<DateTime>(
      'created', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [deviceId, score, lastUpdated, created];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'device_scores';
  @override
  VerificationContext validateIntegrity(Insertable<DeviceScoreData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('device_id')) {
      context.handle(_deviceIdMeta,
          deviceId.isAcceptableOrUnknown(data['device_id']!, _deviceIdMeta));
    } else if (isInserting) {
      context.missing(_deviceIdMeta);
    }
    if (data.containsKey('score')) {
      context.handle(
          _scoreMeta, score.isAcceptableOrUnknown(data['score']!, _scoreMeta));
    }
    if (data.containsKey('last_updated')) {
      context.handle(
          _lastUpdatedMeta,
          lastUpdated.isAcceptableOrUnknown(
              data['last_updated']!, _lastUpdatedMeta));
    }
    if (data.containsKey('created')) {
      context.handle(_createdMeta,
          created.isAcceptableOrUnknown(data['created']!, _createdMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  DeviceScoreData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DeviceScoreData(
      deviceId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}device_id'])!,
      score: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}score']),
      lastUpdated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_updated'])!,
      created: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created'])!,
    );
  }

  @override
  $DeviceScoresTable createAlias(String alias) {
    return $DeviceScoresTable(attachedDatabase, alias);
  }
}

class DeviceScoreData extends DataClass implements Insertable<DeviceScoreData> {
  final int deviceId;
  final int? score;
  final DateTime lastUpdated;
  final DateTime created;
  const DeviceScoreData(
      {required this.deviceId,
      this.score,
      required this.lastUpdated,
      required this.created});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['device_id'] = Variable<int>(deviceId);
    if (!nullToAbsent || score != null) {
      map['score'] = Variable<int>(score);
    }
    map['last_updated'] = Variable<DateTime>(lastUpdated);
    map['created'] = Variable<DateTime>(created);
    return map;
  }

  DeviceScoresCompanion toCompanion(bool nullToAbsent) {
    return DeviceScoresCompanion(
      deviceId: Value(deviceId),
      score:
          score == null && nullToAbsent ? const Value.absent() : Value(score),
      lastUpdated: Value(lastUpdated),
      created: Value(created),
    );
  }

  factory DeviceScoreData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DeviceScoreData(
      deviceId: serializer.fromJson<int>(json['deviceId']),
      score: serializer.fromJson<int?>(json['score']),
      lastUpdated: serializer.fromJson<DateTime>(json['lastUpdated']),
      created: serializer.fromJson<DateTime>(json['created']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'deviceId': serializer.toJson<int>(deviceId),
      'score': serializer.toJson<int?>(score),
      'lastUpdated': serializer.toJson<DateTime>(lastUpdated),
      'created': serializer.toJson<DateTime>(created),
    };
  }

  DeviceScoreData copyWith(
          {int? deviceId,
          Value<int?> score = const Value.absent(),
          DateTime? lastUpdated,
          DateTime? created}) =>
      DeviceScoreData(
        deviceId: deviceId ?? this.deviceId,
        score: score.present ? score.value : this.score,
        lastUpdated: lastUpdated ?? this.lastUpdated,
        created: created ?? this.created,
      );
  DeviceScoreData copyWithCompanion(DeviceScoresCompanion data) {
    return DeviceScoreData(
      deviceId: data.deviceId.present ? data.deviceId.value : this.deviceId,
      score: data.score.present ? data.score.value : this.score,
      lastUpdated:
          data.lastUpdated.present ? data.lastUpdated.value : this.lastUpdated,
      created: data.created.present ? data.created.value : this.created,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DeviceScoreData(')
          ..write('deviceId: $deviceId, ')
          ..write('score: $score, ')
          ..write('lastUpdated: $lastUpdated, ')
          ..write('created: $created')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(deviceId, score, lastUpdated, created);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DeviceScoreData &&
          other.deviceId == this.deviceId &&
          other.score == this.score &&
          other.lastUpdated == this.lastUpdated &&
          other.created == this.created);
}

class DeviceScoresCompanion extends UpdateCompanion<DeviceScoreData> {
  final Value<int> deviceId;
  final Value<int?> score;
  final Value<DateTime> lastUpdated;
  final Value<DateTime> created;
  final Value<int> rowid;
  const DeviceScoresCompanion({
    this.deviceId = const Value.absent(),
    this.score = const Value.absent(),
    this.lastUpdated = const Value.absent(),
    this.created = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DeviceScoresCompanion.insert({
    required int deviceId,
    this.score = const Value.absent(),
    this.lastUpdated = const Value.absent(),
    this.created = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : deviceId = Value(deviceId);
  static Insertable<DeviceScoreData> custom({
    Expression<int>? deviceId,
    Expression<int>? score,
    Expression<DateTime>? lastUpdated,
    Expression<DateTime>? created,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (deviceId != null) 'device_id': deviceId,
      if (score != null) 'score': score,
      if (lastUpdated != null) 'last_updated': lastUpdated,
      if (created != null) 'created': created,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DeviceScoresCompanion copyWith(
      {Value<int>? deviceId,
      Value<int?>? score,
      Value<DateTime>? lastUpdated,
      Value<DateTime>? created,
      Value<int>? rowid}) {
    return DeviceScoresCompanion(
      deviceId: deviceId ?? this.deviceId,
      score: score ?? this.score,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      created: created ?? this.created,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (deviceId.present) {
      map['device_id'] = Variable<int>(deviceId.value);
    }
    if (score.present) {
      map['score'] = Variable<int>(score.value);
    }
    if (lastUpdated.present) {
      map['last_updated'] = Variable<DateTime>(lastUpdated.value);
    }
    if (created.present) {
      map['created'] = Variable<DateTime>(created.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DeviceScoresCompanion(')
          ..write('deviceId: $deviceId, ')
          ..write('score: $score, ')
          ..write('lastUpdated: $lastUpdated, ')
          ..write('created: $created, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UsersTable extends Users with TableInfo<$UsersTable, UserData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _locationIdMeta =
      const VerificationMeta('locationId');
  @override
  late final GeneratedColumn<String> locationId = GeneratedColumn<String>(
      'location_id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 8),
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES locations (country_code)'));
  static const VerificationMeta _mainDeviceMeta =
      const VerificationMeta('mainDevice');
  @override
  late final GeneratedColumn<int> mainDevice = GeneratedColumn<int>(
      'main_device', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES device_scores (device_id)'));
  static const VerificationMeta _otherDevicesIdMeta =
      const VerificationMeta('otherDevicesId');
  @override
  late final GeneratedColumn<int> otherDevicesId = GeneratedColumn<int>(
      'other_devices_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES devices (id)'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, email, locationId, mainDevice, otherDevicesId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(Insertable<UserData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('location_id')) {
      context.handle(
          _locationIdMeta,
          locationId.isAcceptableOrUnknown(
              data['location_id']!, _locationIdMeta));
    } else if (isInserting) {
      context.missing(_locationIdMeta);
    }
    if (data.containsKey('main_device')) {
      context.handle(
          _mainDeviceMeta,
          mainDevice.isAcceptableOrUnknown(
              data['main_device']!, _mainDeviceMeta));
    } else if (isInserting) {
      context.missing(_mainDeviceMeta);
    }
    if (data.containsKey('other_devices_id')) {
      context.handle(
          _otherDevicesIdMeta,
          otherDevicesId.isAcceptableOrUnknown(
              data['other_devices_id']!, _otherDevicesIdMeta));
    } else if (isInserting) {
      context.missing(_otherDevicesIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  UserData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email'])!,
      locationId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}location_id'])!,
      mainDevice: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}main_device'])!,
      otherDevicesId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}other_devices_id'])!,
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class UserData extends DataClass implements Insertable<UserData> {
  final int id;
  final String name;
  final String email;
  final String locationId;
  final int mainDevice;
  final int otherDevicesId;
  const UserData(
      {required this.id,
      required this.name,
      required this.email,
      required this.locationId,
      required this.mainDevice,
      required this.otherDevicesId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['email'] = Variable<String>(email);
    map['location_id'] = Variable<String>(locationId);
    map['main_device'] = Variable<int>(mainDevice);
    map['other_devices_id'] = Variable<int>(otherDevicesId);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      name: Value(name),
      email: Value(email),
      locationId: Value(locationId),
      mainDevice: Value(mainDevice),
      otherDevicesId: Value(otherDevicesId),
    );
  }

  factory UserData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      email: serializer.fromJson<String>(json['email']),
      locationId: serializer.fromJson<String>(json['locationId']),
      mainDevice: serializer.fromJson<int>(json['mainDevice']),
      otherDevicesId: serializer.fromJson<int>(json['otherDevicesId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'email': serializer.toJson<String>(email),
      'locationId': serializer.toJson<String>(locationId),
      'mainDevice': serializer.toJson<int>(mainDevice),
      'otherDevicesId': serializer.toJson<int>(otherDevicesId),
    };
  }

  UserData copyWith(
          {int? id,
          String? name,
          String? email,
          String? locationId,
          int? mainDevice,
          int? otherDevicesId}) =>
      UserData(
        id: id ?? this.id,
        name: name ?? this.name,
        email: email ?? this.email,
        locationId: locationId ?? this.locationId,
        mainDevice: mainDevice ?? this.mainDevice,
        otherDevicesId: otherDevicesId ?? this.otherDevicesId,
      );
  UserData copyWithCompanion(UsersCompanion data) {
    return UserData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      email: data.email.present ? data.email.value : this.email,
      locationId:
          data.locationId.present ? data.locationId.value : this.locationId,
      mainDevice:
          data.mainDevice.present ? data.mainDevice.value : this.mainDevice,
      otherDevicesId: data.otherDevicesId.present
          ? data.otherDevicesId.value
          : this.otherDevicesId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('locationId: $locationId, ')
          ..write('mainDevice: $mainDevice, ')
          ..write('otherDevicesId: $otherDevicesId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, email, locationId, mainDevice, otherDevicesId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserData &&
          other.id == this.id &&
          other.name == this.name &&
          other.email == this.email &&
          other.locationId == this.locationId &&
          other.mainDevice == this.mainDevice &&
          other.otherDevicesId == this.otherDevicesId);
}

class UsersCompanion extends UpdateCompanion<UserData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> email;
  final Value<String> locationId;
  final Value<int> mainDevice;
  final Value<int> otherDevicesId;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.email = const Value.absent(),
    this.locationId = const Value.absent(),
    this.mainDevice = const Value.absent(),
    this.otherDevicesId = const Value.absent(),
  });
  UsersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String email,
    required String locationId,
    required int mainDevice,
    required int otherDevicesId,
  })  : name = Value(name),
        email = Value(email),
        locationId = Value(locationId),
        mainDevice = Value(mainDevice),
        otherDevicesId = Value(otherDevicesId);
  static Insertable<UserData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? email,
    Expression<String>? locationId,
    Expression<int>? mainDevice,
    Expression<int>? otherDevicesId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (email != null) 'email': email,
      if (locationId != null) 'location_id': locationId,
      if (mainDevice != null) 'main_device': mainDevice,
      if (otherDevicesId != null) 'other_devices_id': otherDevicesId,
    });
  }

  UsersCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? email,
      Value<String>? locationId,
      Value<int>? mainDevice,
      Value<int>? otherDevicesId}) {
    return UsersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      locationId: locationId ?? this.locationId,
      mainDevice: mainDevice ?? this.mainDevice,
      otherDevicesId: otherDevicesId ?? this.otherDevicesId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (locationId.present) {
      map['location_id'] = Variable<String>(locationId.value);
    }
    if (mainDevice.present) {
      map['main_device'] = Variable<int>(mainDevice.value);
    }
    if (otherDevicesId.present) {
      map['other_devices_id'] = Variable<int>(otherDevicesId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('locationId: $locationId, ')
          ..write('mainDevice: $mainDevice, ')
          ..write('otherDevicesId: $otherDevicesId')
          ..write(')'))
        .toString();
  }
}

class $IndustriesTable extends Industries
    with TableInfo<$IndustriesTable, IndustryData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $IndustriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'industries';
  @override
  VerificationContext validateIntegrity(Insertable<IndustryData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  IndustryData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return IndustryData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $IndustriesTable createAlias(String alias) {
    return $IndustriesTable(attachedDatabase, alias);
  }
}

class IndustryData extends DataClass implements Insertable<IndustryData> {
  final int id;
  final String name;
  const IndustryData({required this.id, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    return map;
  }

  IndustriesCompanion toCompanion(bool nullToAbsent) {
    return IndustriesCompanion(
      id: Value(id),
      name: Value(name),
    );
  }

  factory IndustryData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return IndustryData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
    };
  }

  IndustryData copyWith({int? id, String? name}) => IndustryData(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  IndustryData copyWithCompanion(IndustriesCompanion data) {
    return IndustryData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('IndustryData(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is IndustryData && other.id == this.id && other.name == this.name);
}

class IndustriesCompanion extends UpdateCompanion<IndustryData> {
  final Value<int> id;
  final Value<String> name;
  const IndustriesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
  });
  IndustriesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
  }) : name = Value(name);
  static Insertable<IndustryData> custom({
    Expression<int>? id,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
    });
  }

  IndustriesCompanion copyWith({Value<int>? id, Value<String>? name}) {
    return IndustriesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IndustriesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

class $BusinessProfilesTable extends BusinessProfiles
    with TableInfo<$BusinessProfilesTable, BusinessProfileData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BusinessProfilesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _industryTypeMeta =
      const VerificationMeta('industryType');
  @override
  late final GeneratedColumn<int> industryType = GeneratedColumn<int>(
      'industry_type', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES industries (id)'));
  static const VerificationMeta _ownerMeta = const VerificationMeta('owner');
  @override
  late final GeneratedColumn<int> owner = GeneratedColumn<int>(
      'owner', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES users (id)'));
  static const VerificationMeta _employeesMeta =
      const VerificationMeta('employees');
  @override
  late final GeneratedColumn<int> employees = GeneratedColumn<int>(
      'employees', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES users (id)'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, industryType, owner, employees];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'business_profiles';
  @override
  VerificationContext validateIntegrity(
      Insertable<BusinessProfileData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('industry_type')) {
      context.handle(
          _industryTypeMeta,
          industryType.isAcceptableOrUnknown(
              data['industry_type']!, _industryTypeMeta));
    } else if (isInserting) {
      context.missing(_industryTypeMeta);
    }
    if (data.containsKey('owner')) {
      context.handle(
          _ownerMeta, owner.isAcceptableOrUnknown(data['owner']!, _ownerMeta));
    } else if (isInserting) {
      context.missing(_ownerMeta);
    }
    if (data.containsKey('employees')) {
      context.handle(_employeesMeta,
          employees.isAcceptableOrUnknown(data['employees']!, _employeesMeta));
    } else if (isInserting) {
      context.missing(_employeesMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  BusinessProfileData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return BusinessProfileData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      industryType: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}industry_type'])!,
      owner: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}owner'])!,
      employees: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}employees'])!,
    );
  }

  @override
  $BusinessProfilesTable createAlias(String alias) {
    return $BusinessProfilesTable(attachedDatabase, alias);
  }
}

class BusinessProfileData extends DataClass
    implements Insertable<BusinessProfileData> {
  final int id;
  final String name;
  final int industryType;
  final int owner;
  final int employees;
  const BusinessProfileData(
      {required this.id,
      required this.name,
      required this.industryType,
      required this.owner,
      required this.employees});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['industry_type'] = Variable<int>(industryType);
    map['owner'] = Variable<int>(owner);
    map['employees'] = Variable<int>(employees);
    return map;
  }

  BusinessProfilesCompanion toCompanion(bool nullToAbsent) {
    return BusinessProfilesCompanion(
      id: Value(id),
      name: Value(name),
      industryType: Value(industryType),
      owner: Value(owner),
      employees: Value(employees),
    );
  }

  factory BusinessProfileData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return BusinessProfileData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      industryType: serializer.fromJson<int>(json['industryType']),
      owner: serializer.fromJson<int>(json['owner']),
      employees: serializer.fromJson<int>(json['employees']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'industryType': serializer.toJson<int>(industryType),
      'owner': serializer.toJson<int>(owner),
      'employees': serializer.toJson<int>(employees),
    };
  }

  BusinessProfileData copyWith(
          {int? id,
          String? name,
          int? industryType,
          int? owner,
          int? employees}) =>
      BusinessProfileData(
        id: id ?? this.id,
        name: name ?? this.name,
        industryType: industryType ?? this.industryType,
        owner: owner ?? this.owner,
        employees: employees ?? this.employees,
      );
  BusinessProfileData copyWithCompanion(BusinessProfilesCompanion data) {
    return BusinessProfileData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      industryType: data.industryType.present
          ? data.industryType.value
          : this.industryType,
      owner: data.owner.present ? data.owner.value : this.owner,
      employees: data.employees.present ? data.employees.value : this.employees,
    );
  }

  @override
  String toString() {
    return (StringBuffer('BusinessProfileData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('industryType: $industryType, ')
          ..write('owner: $owner, ')
          ..write('employees: $employees')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, industryType, owner, employees);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is BusinessProfileData &&
          other.id == this.id &&
          other.name == this.name &&
          other.industryType == this.industryType &&
          other.owner == this.owner &&
          other.employees == this.employees);
}

class BusinessProfilesCompanion extends UpdateCompanion<BusinessProfileData> {
  final Value<int> id;
  final Value<String> name;
  final Value<int> industryType;
  final Value<int> owner;
  final Value<int> employees;
  const BusinessProfilesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.industryType = const Value.absent(),
    this.owner = const Value.absent(),
    this.employees = const Value.absent(),
  });
  BusinessProfilesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required int industryType,
    required int owner,
    required int employees,
  })  : name = Value(name),
        industryType = Value(industryType),
        owner = Value(owner),
        employees = Value(employees);
  static Insertable<BusinessProfileData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<int>? industryType,
    Expression<int>? owner,
    Expression<int>? employees,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (industryType != null) 'industry_type': industryType,
      if (owner != null) 'owner': owner,
      if (employees != null) 'employees': employees,
    });
  }

  BusinessProfilesCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<int>? industryType,
      Value<int>? owner,
      Value<int>? employees}) {
    return BusinessProfilesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      industryType: industryType ?? this.industryType,
      owner: owner ?? this.owner,
      employees: employees ?? this.employees,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (industryType.present) {
      map['industry_type'] = Variable<int>(industryType.value);
    }
    if (owner.present) {
      map['owner'] = Variable<int>(owner.value);
    }
    if (employees.present) {
      map['employees'] = Variable<int>(employees.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BusinessProfilesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('industryType: $industryType, ')
          ..write('owner: $owner, ')
          ..write('employees: $employees')
          ..write(')'))
        .toString();
  }
}

class $NewsInfoTable extends NewsInfo with TableInfo<$NewsInfoTable, NewsData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NewsInfoTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 8),
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'UNIQUE NOT NULL');
  static const VerificationMeta _orderMeta = const VerificationMeta('order');
  @override
  late final GeneratedColumn<int> order = GeneratedColumn<int>(
      'order', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'UNIQUE NOT NULL');
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _summaryMeta =
      const VerificationMeta('summary');
  @override
  late final GeneratedColumn<String> summary = GeneratedColumn<String>(
      'summary', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imageUrlMeta =
      const VerificationMeta('imageUrl');
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
      'image_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dateCreatedMeta =
      const VerificationMeta('dateCreated');
  @override
  late final GeneratedColumn<String> dateCreated = GeneratedColumn<String>(
      'date_created', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, order, title, summary, imageUrl, dateCreated];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'news_info';
  @override
  VerificationContext validateIntegrity(Insertable<NewsData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('order')) {
      context.handle(
          _orderMeta, order.isAcceptableOrUnknown(data['order']!, _orderMeta));
    } else if (isInserting) {
      context.missing(_orderMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('summary')) {
      context.handle(_summaryMeta,
          summary.isAcceptableOrUnknown(data['summary']!, _summaryMeta));
    } else if (isInserting) {
      context.missing(_summaryMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(_imageUrlMeta,
          imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta));
    } else if (isInserting) {
      context.missing(_imageUrlMeta);
    }
    if (data.containsKey('date_created')) {
      context.handle(
          _dateCreatedMeta,
          dateCreated.isAcceptableOrUnknown(
              data['date_created']!, _dateCreatedMeta));
    } else if (isInserting) {
      context.missing(_dateCreatedMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NewsData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NewsData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      order: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}order'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      summary: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}summary'])!,
      imageUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_url'])!,
      dateCreated: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}date_created'])!,
    );
  }

  @override
  $NewsInfoTable createAlias(String alias) {
    return $NewsInfoTable(attachedDatabase, alias);
  }
}

class NewsData extends DataClass implements Insertable<NewsData> {
  final String id;
  final int order;
  final String title;
  final String summary;
  final String imageUrl;
  final String dateCreated;
  const NewsData(
      {required this.id,
      required this.order,
      required this.title,
      required this.summary,
      required this.imageUrl,
      required this.dateCreated});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['order'] = Variable<int>(order);
    map['title'] = Variable<String>(title);
    map['summary'] = Variable<String>(summary);
    map['image_url'] = Variable<String>(imageUrl);
    map['date_created'] = Variable<String>(dateCreated);
    return map;
  }

  NewsInfoCompanion toCompanion(bool nullToAbsent) {
    return NewsInfoCompanion(
      id: Value(id),
      order: Value(order),
      title: Value(title),
      summary: Value(summary),
      imageUrl: Value(imageUrl),
      dateCreated: Value(dateCreated),
    );
  }

  factory NewsData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NewsData(
      id: serializer.fromJson<String>(json['id']),
      order: serializer.fromJson<int>(json['order']),
      title: serializer.fromJson<String>(json['title']),
      summary: serializer.fromJson<String>(json['summary']),
      imageUrl: serializer.fromJson<String>(json['imageUrl']),
      dateCreated: serializer.fromJson<String>(json['dateCreated']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'order': serializer.toJson<int>(order),
      'title': serializer.toJson<String>(title),
      'summary': serializer.toJson<String>(summary),
      'imageUrl': serializer.toJson<String>(imageUrl),
      'dateCreated': serializer.toJson<String>(dateCreated),
    };
  }

  NewsData copyWith(
          {String? id,
          int? order,
          String? title,
          String? summary,
          String? imageUrl,
          String? dateCreated}) =>
      NewsData(
        id: id ?? this.id,
        order: order ?? this.order,
        title: title ?? this.title,
        summary: summary ?? this.summary,
        imageUrl: imageUrl ?? this.imageUrl,
        dateCreated: dateCreated ?? this.dateCreated,
      );
  NewsData copyWithCompanion(NewsInfoCompanion data) {
    return NewsData(
      id: data.id.present ? data.id.value : this.id,
      order: data.order.present ? data.order.value : this.order,
      title: data.title.present ? data.title.value : this.title,
      summary: data.summary.present ? data.summary.value : this.summary,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      dateCreated:
          data.dateCreated.present ? data.dateCreated.value : this.dateCreated,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NewsData(')
          ..write('id: $id, ')
          ..write('order: $order, ')
          ..write('title: $title, ')
          ..write('summary: $summary, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('dateCreated: $dateCreated')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, order, title, summary, imageUrl, dateCreated);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NewsData &&
          other.id == this.id &&
          other.order == this.order &&
          other.title == this.title &&
          other.summary == this.summary &&
          other.imageUrl == this.imageUrl &&
          other.dateCreated == this.dateCreated);
}

class NewsInfoCompanion extends UpdateCompanion<NewsData> {
  final Value<String> id;
  final Value<int> order;
  final Value<String> title;
  final Value<String> summary;
  final Value<String> imageUrl;
  final Value<String> dateCreated;
  final Value<int> rowid;
  const NewsInfoCompanion({
    this.id = const Value.absent(),
    this.order = const Value.absent(),
    this.title = const Value.absent(),
    this.summary = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.dateCreated = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  NewsInfoCompanion.insert({
    required String id,
    required int order,
    required String title,
    required String summary,
    required String imageUrl,
    required String dateCreated,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        order = Value(order),
        title = Value(title),
        summary = Value(summary),
        imageUrl = Value(imageUrl),
        dateCreated = Value(dateCreated);
  static Insertable<NewsData> custom({
    Expression<String>? id,
    Expression<int>? order,
    Expression<String>? title,
    Expression<String>? summary,
    Expression<String>? imageUrl,
    Expression<String>? dateCreated,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (order != null) 'order': order,
      if (title != null) 'title': title,
      if (summary != null) 'summary': summary,
      if (imageUrl != null) 'image_url': imageUrl,
      if (dateCreated != null) 'date_created': dateCreated,
      if (rowid != null) 'rowid': rowid,
    });
  }

  NewsInfoCompanion copyWith(
      {Value<String>? id,
      Value<int>? order,
      Value<String>? title,
      Value<String>? summary,
      Value<String>? imageUrl,
      Value<String>? dateCreated,
      Value<int>? rowid}) {
    return NewsInfoCompanion(
      id: id ?? this.id,
      order: order ?? this.order,
      title: title ?? this.title,
      summary: summary ?? this.summary,
      imageUrl: imageUrl ?? this.imageUrl,
      dateCreated: dateCreated ?? this.dateCreated,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (order.present) {
      map['order'] = Variable<int>(order.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (summary.present) {
      map['summary'] = Variable<String>(summary.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (dateCreated.present) {
      map['date_created'] = Variable<String>(dateCreated.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NewsInfoCompanion(')
          ..write('id: $id, ')
          ..write('order: $order, ')
          ..write('title: $title, ')
          ..write('summary: $summary, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('dateCreated: $dateCreated, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RecommendationsTable extends Recommendations
    with TableInfo<$RecommendationsTable, RecommendationData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecommendationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 8),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _newsIdMeta = const VerificationMeta('newsId');
  @override
  late final GeneratedColumn<String> newsId = GeneratedColumn<String>(
      'news_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES news_info (id)'));
  static const VerificationMeta _orderMeta = const VerificationMeta('order');
  @override
  late final GeneratedColumn<int> order = GeneratedColumn<int>(
      'order', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'UNIQUE NOT NULL');
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, newsId, order, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recommendations';
  @override
  VerificationContext validateIntegrity(Insertable<RecommendationData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('news_id')) {
      context.handle(_newsIdMeta,
          newsId.isAcceptableOrUnknown(data['news_id']!, _newsIdMeta));
    } else if (isInserting) {
      context.missing(_newsIdMeta);
    }
    if (data.containsKey('order')) {
      context.handle(
          _orderMeta, order.isAcceptableOrUnknown(data['order']!, _orderMeta));
    } else if (isInserting) {
      context.missing(_orderMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RecommendationData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecommendationData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      newsId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}news_id'])!,
      order: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}order'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $RecommendationsTable createAlias(String alias) {
    return $RecommendationsTable(attachedDatabase, alias);
  }
}

class RecommendationData extends DataClass
    implements Insertable<RecommendationData> {
  final String id;
  final String newsId;
  final int order;
  final String name;
  const RecommendationData(
      {required this.id,
      required this.newsId,
      required this.order,
      required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['news_id'] = Variable<String>(newsId);
    map['order'] = Variable<int>(order);
    map['name'] = Variable<String>(name);
    return map;
  }

  RecommendationsCompanion toCompanion(bool nullToAbsent) {
    return RecommendationsCompanion(
      id: Value(id),
      newsId: Value(newsId),
      order: Value(order),
      name: Value(name),
    );
  }

  factory RecommendationData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecommendationData(
      id: serializer.fromJson<String>(json['id']),
      newsId: serializer.fromJson<String>(json['newsId']),
      order: serializer.fromJson<int>(json['order']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'newsId': serializer.toJson<String>(newsId),
      'order': serializer.toJson<int>(order),
      'name': serializer.toJson<String>(name),
    };
  }

  RecommendationData copyWith(
          {String? id, String? newsId, int? order, String? name}) =>
      RecommendationData(
        id: id ?? this.id,
        newsId: newsId ?? this.newsId,
        order: order ?? this.order,
        name: name ?? this.name,
      );
  RecommendationData copyWithCompanion(RecommendationsCompanion data) {
    return RecommendationData(
      id: data.id.present ? data.id.value : this.id,
      newsId: data.newsId.present ? data.newsId.value : this.newsId,
      order: data.order.present ? data.order.value : this.order,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RecommendationData(')
          ..write('id: $id, ')
          ..write('newsId: $newsId, ')
          ..write('order: $order, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, newsId, order, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecommendationData &&
          other.id == this.id &&
          other.newsId == this.newsId &&
          other.order == this.order &&
          other.name == this.name);
}

class RecommendationsCompanion extends UpdateCompanion<RecommendationData> {
  final Value<String> id;
  final Value<String> newsId;
  final Value<int> order;
  final Value<String> name;
  final Value<int> rowid;
  const RecommendationsCompanion({
    this.id = const Value.absent(),
    this.newsId = const Value.absent(),
    this.order = const Value.absent(),
    this.name = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RecommendationsCompanion.insert({
    required String id,
    required String newsId,
    required int order,
    required String name,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        newsId = Value(newsId),
        order = Value(order),
        name = Value(name);
  static Insertable<RecommendationData> custom({
    Expression<String>? id,
    Expression<String>? newsId,
    Expression<int>? order,
    Expression<String>? name,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (newsId != null) 'news_id': newsId,
      if (order != null) 'order': order,
      if (name != null) 'name': name,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RecommendationsCompanion copyWith(
      {Value<String>? id,
      Value<String>? newsId,
      Value<int>? order,
      Value<String>? name,
      Value<int>? rowid}) {
    return RecommendationsCompanion(
      id: id ?? this.id,
      newsId: newsId ?? this.newsId,
      order: order ?? this.order,
      name: name ?? this.name,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (newsId.present) {
      map['news_id'] = Variable<String>(newsId.value);
    }
    if (order.present) {
      map['order'] = Variable<int>(order.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecommendationsCompanion(')
          ..write('id: $id, ')
          ..write('newsId: $newsId, ')
          ..write('order: $order, ')
          ..write('name: $name, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SmeProfilesTable extends SmeProfiles
    with TableInfo<$SmeProfilesTable, SmeProfileData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SmeProfilesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _actorMeta = const VerificationMeta('actor');
  @override
  late final GeneratedColumn<int> actor = GeneratedColumn<int>(
      'actor', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES users (id)'));
  static const VerificationMeta _verbMeta = const VerificationMeta('verb');
  @override
  late final GeneratedColumn<String> verb = GeneratedColumn<String>(
      'verb', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _implRecoIDMeta =
      const VerificationMeta('implRecoID');
  @override
  late final GeneratedColumn<String> implRecoID = GeneratedColumn<String>(
      'impl_reco_i_d', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES recommendations (id)'));
  @override
  List<GeneratedColumn> get $columns => [actor, verb, implRecoID];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sme_profiles';
  @override
  VerificationContext validateIntegrity(Insertable<SmeProfileData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('actor')) {
      context.handle(
          _actorMeta, actor.isAcceptableOrUnknown(data['actor']!, _actorMeta));
    } else if (isInserting) {
      context.missing(_actorMeta);
    }
    if (data.containsKey('verb')) {
      context.handle(
          _verbMeta, verb.isAcceptableOrUnknown(data['verb']!, _verbMeta));
    } else if (isInserting) {
      context.missing(_verbMeta);
    }
    if (data.containsKey('impl_reco_i_d')) {
      context.handle(
          _implRecoIDMeta,
          implRecoID.isAcceptableOrUnknown(
              data['impl_reco_i_d']!, _implRecoIDMeta));
    } else if (isInserting) {
      context.missing(_implRecoIDMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  SmeProfileData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SmeProfileData(
      actor: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}actor'])!,
      verb: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}verb'])!,
      implRecoID: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}impl_reco_i_d'])!,
    );
  }

  @override
  $SmeProfilesTable createAlias(String alias) {
    return $SmeProfilesTable(attachedDatabase, alias);
  }
}

class SmeProfileData extends DataClass implements Insertable<SmeProfileData> {
  final int actor;
  final String verb;
  final String implRecoID;
  const SmeProfileData(
      {required this.actor, required this.verb, required this.implRecoID});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['actor'] = Variable<int>(actor);
    map['verb'] = Variable<String>(verb);
    map['impl_reco_i_d'] = Variable<String>(implRecoID);
    return map;
  }

  SmeProfilesCompanion toCompanion(bool nullToAbsent) {
    return SmeProfilesCompanion(
      actor: Value(actor),
      verb: Value(verb),
      implRecoID: Value(implRecoID),
    );
  }

  factory SmeProfileData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SmeProfileData(
      actor: serializer.fromJson<int>(json['actor']),
      verb: serializer.fromJson<String>(json['verb']),
      implRecoID: serializer.fromJson<String>(json['implRecoID']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'actor': serializer.toJson<int>(actor),
      'verb': serializer.toJson<String>(verb),
      'implRecoID': serializer.toJson<String>(implRecoID),
    };
  }

  SmeProfileData copyWith({int? actor, String? verb, String? implRecoID}) =>
      SmeProfileData(
        actor: actor ?? this.actor,
        verb: verb ?? this.verb,
        implRecoID: implRecoID ?? this.implRecoID,
      );
  SmeProfileData copyWithCompanion(SmeProfilesCompanion data) {
    return SmeProfileData(
      actor: data.actor.present ? data.actor.value : this.actor,
      verb: data.verb.present ? data.verb.value : this.verb,
      implRecoID:
          data.implRecoID.present ? data.implRecoID.value : this.implRecoID,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SmeProfileData(')
          ..write('actor: $actor, ')
          ..write('verb: $verb, ')
          ..write('implRecoID: $implRecoID')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(actor, verb, implRecoID);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SmeProfileData &&
          other.actor == this.actor &&
          other.verb == this.verb &&
          other.implRecoID == this.implRecoID);
}

class SmeProfilesCompanion extends UpdateCompanion<SmeProfileData> {
  final Value<int> actor;
  final Value<String> verb;
  final Value<String> implRecoID;
  final Value<int> rowid;
  const SmeProfilesCompanion({
    this.actor = const Value.absent(),
    this.verb = const Value.absent(),
    this.implRecoID = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SmeProfilesCompanion.insert({
    required int actor,
    required String verb,
    required String implRecoID,
    this.rowid = const Value.absent(),
  })  : actor = Value(actor),
        verb = Value(verb),
        implRecoID = Value(implRecoID);
  static Insertable<SmeProfileData> custom({
    Expression<int>? actor,
    Expression<String>? verb,
    Expression<String>? implRecoID,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (actor != null) 'actor': actor,
      if (verb != null) 'verb': verb,
      if (implRecoID != null) 'impl_reco_i_d': implRecoID,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SmeProfilesCompanion copyWith(
      {Value<int>? actor,
      Value<String>? verb,
      Value<String>? implRecoID,
      Value<int>? rowid}) {
    return SmeProfilesCompanion(
      actor: actor ?? this.actor,
      verb: verb ?? this.verb,
      implRecoID: implRecoID ?? this.implRecoID,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (actor.present) {
      map['actor'] = Variable<int>(actor.value);
    }
    if (verb.present) {
      map['verb'] = Variable<String>(verb.value);
    }
    if (implRecoID.present) {
      map['impl_reco_i_d'] = Variable<String>(implRecoID.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SmeProfilesCompanion(')
          ..write('actor: $actor, ')
          ..write('verb: $verb, ')
          ..write('implRecoID: $implRecoID, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TodoRecommendationStatusesTable extends TodoRecommendationStatuses
    with
        TableInfo<$TodoRecommendationStatusesTable,
            TodoRecommendationStatusData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TodoRecommendationStatusesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _recommendationIdMeta =
      const VerificationMeta('recommendationId');
  @override
  late final GeneratedColumn<String> recommendationId = GeneratedColumn<String>(
      'recommendation_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES recommendations (id)'));
  static const VerificationMeta _completedMeta =
      const VerificationMeta('completed');
  @override
  late final GeneratedColumn<bool> completed = GeneratedColumn<bool>(
      'completed', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("completed" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [recommendationId, completed];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'todo_recommendation_statuses';
  @override
  VerificationContext validateIntegrity(
      Insertable<TodoRecommendationStatusData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('recommendation_id')) {
      context.handle(
          _recommendationIdMeta,
          recommendationId.isAcceptableOrUnknown(
              data['recommendation_id']!, _recommendationIdMeta));
    } else if (isInserting) {
      context.missing(_recommendationIdMeta);
    }
    if (data.containsKey('completed')) {
      context.handle(_completedMeta,
          completed.isAcceptableOrUnknown(data['completed']!, _completedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  TodoRecommendationStatusData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TodoRecommendationStatusData(
      recommendationId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}recommendation_id'])!,
      completed: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}completed'])!,
    );
  }

  @override
  $TodoRecommendationStatusesTable createAlias(String alias) {
    return $TodoRecommendationStatusesTable(attachedDatabase, alias);
  }
}

class TodoRecommendationStatusData extends DataClass
    implements Insertable<TodoRecommendationStatusData> {
  final String recommendationId;
  final bool completed;
  const TodoRecommendationStatusData(
      {required this.recommendationId, required this.completed});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['recommendation_id'] = Variable<String>(recommendationId);
    map['completed'] = Variable<bool>(completed);
    return map;
  }

  TodoRecommendationStatusesCompanion toCompanion(bool nullToAbsent) {
    return TodoRecommendationStatusesCompanion(
      recommendationId: Value(recommendationId),
      completed: Value(completed),
    );
  }

  factory TodoRecommendationStatusData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TodoRecommendationStatusData(
      recommendationId: serializer.fromJson<String>(json['recommendationId']),
      completed: serializer.fromJson<bool>(json['completed']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'recommendationId': serializer.toJson<String>(recommendationId),
      'completed': serializer.toJson<bool>(completed),
    };
  }

  TodoRecommendationStatusData copyWith(
          {String? recommendationId, bool? completed}) =>
      TodoRecommendationStatusData(
        recommendationId: recommendationId ?? this.recommendationId,
        completed: completed ?? this.completed,
      );
  TodoRecommendationStatusData copyWithCompanion(
      TodoRecommendationStatusesCompanion data) {
    return TodoRecommendationStatusData(
      recommendationId: data.recommendationId.present
          ? data.recommendationId.value
          : this.recommendationId,
      completed: data.completed.present ? data.completed.value : this.completed,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TodoRecommendationStatusData(')
          ..write('recommendationId: $recommendationId, ')
          ..write('completed: $completed')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(recommendationId, completed);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TodoRecommendationStatusData &&
          other.recommendationId == this.recommendationId &&
          other.completed == this.completed);
}

class TodoRecommendationStatusesCompanion
    extends UpdateCompanion<TodoRecommendationStatusData> {
  final Value<String> recommendationId;
  final Value<bool> completed;
  final Value<int> rowid;
  const TodoRecommendationStatusesCompanion({
    this.recommendationId = const Value.absent(),
    this.completed = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TodoRecommendationStatusesCompanion.insert({
    required String recommendationId,
    this.completed = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : recommendationId = Value(recommendationId);
  static Insertable<TodoRecommendationStatusData> custom({
    Expression<String>? recommendationId,
    Expression<bool>? completed,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (recommendationId != null) 'recommendation_id': recommendationId,
      if (completed != null) 'completed': completed,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TodoRecommendationStatusesCompanion copyWith(
      {Value<String>? recommendationId,
      Value<bool>? completed,
      Value<int>? rowid}) {
    return TodoRecommendationStatusesCompanion(
      recommendationId: recommendationId ?? this.recommendationId,
      completed: completed ?? this.completed,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (recommendationId.present) {
      map['recommendation_id'] = Variable<String>(recommendationId.value);
    }
    if (completed.present) {
      map['completed'] = Variable<bool>(completed.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TodoRecommendationStatusesCompanion(')
          ..write('recommendationId: $recommendationId, ')
          ..write('completed: $completed, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $OfferingsTable extends Offerings
    with TableInfo<$OfferingsTable, OfferingData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OfferingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'UNIQUE NOT NULL');
  static const VerificationMeta _recommendationIdMeta =
      const VerificationMeta('recommendationId');
  @override
  late final GeneratedColumn<String> recommendationId = GeneratedColumn<String>(
      'recommendation_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES recommendations (id)'));
  static const VerificationMeta _orderMeta = const VerificationMeta('order');
  @override
  late final GeneratedColumn<int> order = GeneratedColumn<int>(
      'order', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'UNIQUE NOT NULL');
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _summaryMeta =
      const VerificationMeta('summary');
  @override
  late final GeneratedColumn<String> summary = GeneratedColumn<String>(
      'summary', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, recommendationId, order, name, summary];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'offerings';
  @override
  VerificationContext validateIntegrity(Insertable<OfferingData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('recommendation_id')) {
      context.handle(
          _recommendationIdMeta,
          recommendationId.isAcceptableOrUnknown(
              data['recommendation_id']!, _recommendationIdMeta));
    } else if (isInserting) {
      context.missing(_recommendationIdMeta);
    }
    if (data.containsKey('order')) {
      context.handle(
          _orderMeta, order.isAcceptableOrUnknown(data['order']!, _orderMeta));
    } else if (isInserting) {
      context.missing(_orderMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('summary')) {
      context.handle(_summaryMeta,
          summary.isAcceptableOrUnknown(data['summary']!, _summaryMeta));
    } else if (isInserting) {
      context.missing(_summaryMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OfferingData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OfferingData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      recommendationId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}recommendation_id'])!,
      order: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}order'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      summary: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}summary'])!,
    );
  }

  @override
  $OfferingsTable createAlias(String alias) {
    return $OfferingsTable(attachedDatabase, alias);
  }
}

class OfferingData extends DataClass implements Insertable<OfferingData> {
  final String id;
  final String recommendationId;
  final int order;
  final String name;
  final String summary;
  const OfferingData(
      {required this.id,
      required this.recommendationId,
      required this.order,
      required this.name,
      required this.summary});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['recommendation_id'] = Variable<String>(recommendationId);
    map['order'] = Variable<int>(order);
    map['name'] = Variable<String>(name);
    map['summary'] = Variable<String>(summary);
    return map;
  }

  OfferingsCompanion toCompanion(bool nullToAbsent) {
    return OfferingsCompanion(
      id: Value(id),
      recommendationId: Value(recommendationId),
      order: Value(order),
      name: Value(name),
      summary: Value(summary),
    );
  }

  factory OfferingData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OfferingData(
      id: serializer.fromJson<String>(json['id']),
      recommendationId: serializer.fromJson<String>(json['recommendationId']),
      order: serializer.fromJson<int>(json['order']),
      name: serializer.fromJson<String>(json['name']),
      summary: serializer.fromJson<String>(json['summary']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'recommendationId': serializer.toJson<String>(recommendationId),
      'order': serializer.toJson<int>(order),
      'name': serializer.toJson<String>(name),
      'summary': serializer.toJson<String>(summary),
    };
  }

  OfferingData copyWith(
          {String? id,
          String? recommendationId,
          int? order,
          String? name,
          String? summary}) =>
      OfferingData(
        id: id ?? this.id,
        recommendationId: recommendationId ?? this.recommendationId,
        order: order ?? this.order,
        name: name ?? this.name,
        summary: summary ?? this.summary,
      );
  OfferingData copyWithCompanion(OfferingsCompanion data) {
    return OfferingData(
      id: data.id.present ? data.id.value : this.id,
      recommendationId: data.recommendationId.present
          ? data.recommendationId.value
          : this.recommendationId,
      order: data.order.present ? data.order.value : this.order,
      name: data.name.present ? data.name.value : this.name,
      summary: data.summary.present ? data.summary.value : this.summary,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OfferingData(')
          ..write('id: $id, ')
          ..write('recommendationId: $recommendationId, ')
          ..write('order: $order, ')
          ..write('name: $name, ')
          ..write('summary: $summary')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, recommendationId, order, name, summary);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OfferingData &&
          other.id == this.id &&
          other.recommendationId == this.recommendationId &&
          other.order == this.order &&
          other.name == this.name &&
          other.summary == this.summary);
}

class OfferingsCompanion extends UpdateCompanion<OfferingData> {
  final Value<String> id;
  final Value<String> recommendationId;
  final Value<int> order;
  final Value<String> name;
  final Value<String> summary;
  final Value<int> rowid;
  const OfferingsCompanion({
    this.id = const Value.absent(),
    this.recommendationId = const Value.absent(),
    this.order = const Value.absent(),
    this.name = const Value.absent(),
    this.summary = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  OfferingsCompanion.insert({
    required String id,
    required String recommendationId,
    required int order,
    required String name,
    required String summary,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        recommendationId = Value(recommendationId),
        order = Value(order),
        name = Value(name),
        summary = Value(summary);
  static Insertable<OfferingData> custom({
    Expression<String>? id,
    Expression<String>? recommendationId,
    Expression<int>? order,
    Expression<String>? name,
    Expression<String>? summary,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (recommendationId != null) 'recommendation_id': recommendationId,
      if (order != null) 'order': order,
      if (name != null) 'name': name,
      if (summary != null) 'summary': summary,
      if (rowid != null) 'rowid': rowid,
    });
  }

  OfferingsCompanion copyWith(
      {Value<String>? id,
      Value<String>? recommendationId,
      Value<int>? order,
      Value<String>? name,
      Value<String>? summary,
      Value<int>? rowid}) {
    return OfferingsCompanion(
      id: id ?? this.id,
      recommendationId: recommendationId ?? this.recommendationId,
      order: order ?? this.order,
      name: name ?? this.name,
      summary: summary ?? this.summary,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (recommendationId.present) {
      map['recommendation_id'] = Variable<String>(recommendationId.value);
    }
    if (order.present) {
      map['order'] = Variable<int>(order.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (summary.present) {
      map['summary'] = Variable<String>(summary.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OfferingsCompanion(')
          ..write('id: $id, ')
          ..write('recommendationId: $recommendationId, ')
          ..write('order: $order, ')
          ..write('name: $name, ')
          ..write('summary: $summary, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $LocationsTable locations = $LocationsTable(this);
  late final $DevicesTable devices = $DevicesTable(this);
  late final $DeviceScoresTable deviceScores = $DeviceScoresTable(this);
  late final $UsersTable users = $UsersTable(this);
  late final $IndustriesTable industries = $IndustriesTable(this);
  late final $BusinessProfilesTable businessProfiles =
      $BusinessProfilesTable(this);
  late final $NewsInfoTable newsInfo = $NewsInfoTable(this);
  late final $RecommendationsTable recommendations =
      $RecommendationsTable(this);
  late final $SmeProfilesTable smeProfiles = $SmeProfilesTable(this);
  late final $TodoRecommendationStatusesTable todoRecommendationStatuses =
      $TodoRecommendationStatusesTable(this);
  late final $OfferingsTable offerings = $OfferingsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        locations,
        devices,
        deviceScores,
        users,
        industries,
        businessProfiles,
        newsInfo,
        recommendations,
        smeProfiles,
        todoRecommendationStatuses,
        offerings
      ];
}

typedef $$LocationsTableCreateCompanionBuilder = LocationsCompanion Function({
  required String countryCode,
  required String country,
  required String city,
  Value<int> rowid,
});
typedef $$LocationsTableUpdateCompanionBuilder = LocationsCompanion Function({
  Value<String> countryCode,
  Value<String> country,
  Value<String> city,
  Value<int> rowid,
});

final class $$LocationsTableReferences
    extends BaseReferences<_$AppDatabase, $LocationsTable, LocationData> {
  $$LocationsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$UsersTable, List<UserData>> _usersRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.users,
          aliasName: $_aliasNameGenerator(
              db.locations.countryCode, db.users.locationId));

  $$UsersTableProcessedTableManager get usersRefs {
    final manager = $$UsersTableTableManager($_db, $_db.users)
        .filter((f) => f.locationId.countryCode($_item.countryCode));

    final cache = $_typedResult.readTableOrNull(_usersRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$LocationsTableFilterComposer
    extends Composer<_$AppDatabase, $LocationsTable> {
  $$LocationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get countryCode => $composableBuilder(
      column: $table.countryCode, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get country => $composableBuilder(
      column: $table.country, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get city => $composableBuilder(
      column: $table.city, builder: (column) => ColumnFilters(column));

  Expression<bool> usersRefs(
      Expression<bool> Function($$UsersTableFilterComposer f) f) {
    final $$UsersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.countryCode,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.locationId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableFilterComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$LocationsTableOrderingComposer
    extends Composer<_$AppDatabase, $LocationsTable> {
  $$LocationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get countryCode => $composableBuilder(
      column: $table.countryCode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get country => $composableBuilder(
      column: $table.country, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get city => $composableBuilder(
      column: $table.city, builder: (column) => ColumnOrderings(column));
}

class $$LocationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $LocationsTable> {
  $$LocationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get countryCode => $composableBuilder(
      column: $table.countryCode, builder: (column) => column);

  GeneratedColumn<String> get country =>
      $composableBuilder(column: $table.country, builder: (column) => column);

  GeneratedColumn<String> get city =>
      $composableBuilder(column: $table.city, builder: (column) => column);

  Expression<T> usersRefs<T extends Object>(
      Expression<T> Function($$UsersTableAnnotationComposer a) f) {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.countryCode,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.locationId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableAnnotationComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$LocationsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $LocationsTable,
    LocationData,
    $$LocationsTableFilterComposer,
    $$LocationsTableOrderingComposer,
    $$LocationsTableAnnotationComposer,
    $$LocationsTableCreateCompanionBuilder,
    $$LocationsTableUpdateCompanionBuilder,
    (LocationData, $$LocationsTableReferences),
    LocationData,
    PrefetchHooks Function({bool usersRefs})> {
  $$LocationsTableTableManager(_$AppDatabase db, $LocationsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LocationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LocationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LocationsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> countryCode = const Value.absent(),
            Value<String> country = const Value.absent(),
            Value<String> city = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              LocationsCompanion(
            countryCode: countryCode,
            country: country,
            city: city,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String countryCode,
            required String country,
            required String city,
            Value<int> rowid = const Value.absent(),
          }) =>
              LocationsCompanion.insert(
            countryCode: countryCode,
            country: country,
            city: city,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$LocationsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({usersRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (usersRefs) db.users],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (usersRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$LocationsTableReferences._usersRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$LocationsTableReferences(db, table, p0).usersRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.locationId == item.countryCode),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$LocationsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $LocationsTable,
    LocationData,
    $$LocationsTableFilterComposer,
    $$LocationsTableOrderingComposer,
    $$LocationsTableAnnotationComposer,
    $$LocationsTableCreateCompanionBuilder,
    $$LocationsTableUpdateCompanionBuilder,
    (LocationData, $$LocationsTableReferences),
    LocationData,
    PrefetchHooks Function({bool usersRefs})>;
typedef $$DevicesTableCreateCompanionBuilder = DevicesCompanion Function({
  Value<int> id,
  required String name,
  required String type,
});
typedef $$DevicesTableUpdateCompanionBuilder = DevicesCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> type,
});

final class $$DevicesTableReferences
    extends BaseReferences<_$AppDatabase, $DevicesTable, DeviceData> {
  $$DevicesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$DeviceScoresTable, List<DeviceScoreData>>
      _deviceScoresRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.deviceScores,
          aliasName:
              $_aliasNameGenerator(db.devices.id, db.deviceScores.deviceId));

  $$DeviceScoresTableProcessedTableManager get deviceScoresRefs {
    final manager = $$DeviceScoresTableTableManager($_db, $_db.deviceScores)
        .filter((f) => f.deviceId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_deviceScoresRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$UsersTable, List<UserData>>
      _pairedDeviceGroupsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.users,
              aliasName:
                  $_aliasNameGenerator(db.devices.id, db.users.otherDevicesId));

  $$UsersTableProcessedTableManager get pairedDeviceGroups {
    final manager = $$UsersTableTableManager($_db, $_db.users)
        .filter((f) => f.otherDevicesId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_pairedDeviceGroupsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$DevicesTableFilterComposer
    extends Composer<_$AppDatabase, $DevicesTable> {
  $$DevicesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  Expression<bool> deviceScoresRefs(
      Expression<bool> Function($$DeviceScoresTableFilterComposer f) f) {
    final $$DeviceScoresTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.deviceScores,
        getReferencedColumn: (t) => t.deviceId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DeviceScoresTableFilterComposer(
              $db: $db,
              $table: $db.deviceScores,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> pairedDeviceGroups(
      Expression<bool> Function($$UsersTableFilterComposer f) f) {
    final $$UsersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.otherDevicesId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableFilterComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$DevicesTableOrderingComposer
    extends Composer<_$AppDatabase, $DevicesTable> {
  $$DevicesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));
}

class $$DevicesTableAnnotationComposer
    extends Composer<_$AppDatabase, $DevicesTable> {
  $$DevicesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  Expression<T> deviceScoresRefs<T extends Object>(
      Expression<T> Function($$DeviceScoresTableAnnotationComposer a) f) {
    final $$DeviceScoresTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.deviceScores,
        getReferencedColumn: (t) => t.deviceId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DeviceScoresTableAnnotationComposer(
              $db: $db,
              $table: $db.deviceScores,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> pairedDeviceGroups<T extends Object>(
      Expression<T> Function($$UsersTableAnnotationComposer a) f) {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.otherDevicesId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableAnnotationComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$DevicesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $DevicesTable,
    DeviceData,
    $$DevicesTableFilterComposer,
    $$DevicesTableOrderingComposer,
    $$DevicesTableAnnotationComposer,
    $$DevicesTableCreateCompanionBuilder,
    $$DevicesTableUpdateCompanionBuilder,
    (DeviceData, $$DevicesTableReferences),
    DeviceData,
    PrefetchHooks Function({bool deviceScoresRefs, bool pairedDeviceGroups})> {
  $$DevicesTableTableManager(_$AppDatabase db, $DevicesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DevicesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DevicesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DevicesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> type = const Value.absent(),
          }) =>
              DevicesCompanion(
            id: id,
            name: name,
            type: type,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String type,
          }) =>
              DevicesCompanion.insert(
            id: id,
            name: name,
            type: type,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$DevicesTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {deviceScoresRefs = false, pairedDeviceGroups = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (deviceScoresRefs) db.deviceScores,
                if (pairedDeviceGroups) db.users
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (deviceScoresRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$DevicesTableReferences._deviceScoresRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$DevicesTableReferences(db, table, p0)
                                .deviceScoresRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.deviceId == item.id),
                        typedResults: items),
                  if (pairedDeviceGroups)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$DevicesTableReferences
                            ._pairedDeviceGroupsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$DevicesTableReferences(db, table, p0)
                                .pairedDeviceGroups,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.otherDevicesId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$DevicesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $DevicesTable,
    DeviceData,
    $$DevicesTableFilterComposer,
    $$DevicesTableOrderingComposer,
    $$DevicesTableAnnotationComposer,
    $$DevicesTableCreateCompanionBuilder,
    $$DevicesTableUpdateCompanionBuilder,
    (DeviceData, $$DevicesTableReferences),
    DeviceData,
    PrefetchHooks Function({bool deviceScoresRefs, bool pairedDeviceGroups})>;
typedef $$DeviceScoresTableCreateCompanionBuilder = DeviceScoresCompanion
    Function({
  required int deviceId,
  Value<int?> score,
  Value<DateTime> lastUpdated,
  Value<DateTime> created,
  Value<int> rowid,
});
typedef $$DeviceScoresTableUpdateCompanionBuilder = DeviceScoresCompanion
    Function({
  Value<int> deviceId,
  Value<int?> score,
  Value<DateTime> lastUpdated,
  Value<DateTime> created,
  Value<int> rowid,
});

final class $$DeviceScoresTableReferences
    extends BaseReferences<_$AppDatabase, $DeviceScoresTable, DeviceScoreData> {
  $$DeviceScoresTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $DevicesTable _deviceIdTable(_$AppDatabase db) =>
      db.devices.createAlias(
          $_aliasNameGenerator(db.deviceScores.deviceId, db.devices.id));

  $$DevicesTableProcessedTableManager? get deviceId {
    if ($_item.deviceId == null) return null;
    final manager = $$DevicesTableTableManager($_db, $_db.devices)
        .filter((f) => f.id($_item.deviceId!));
    final item = $_typedResult.readTableOrNull(_deviceIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$DeviceScoresTableFilterComposer
    extends Composer<_$AppDatabase, $DeviceScoresTable> {
  $$DeviceScoresTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get score => $composableBuilder(
      column: $table.score, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastUpdated => $composableBuilder(
      column: $table.lastUpdated, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get created => $composableBuilder(
      column: $table.created, builder: (column) => ColumnFilters(column));

  $$DevicesTableFilterComposer get deviceId {
    final $$DevicesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.deviceId,
        referencedTable: $db.devices,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DevicesTableFilterComposer(
              $db: $db,
              $table: $db.devices,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$DeviceScoresTableOrderingComposer
    extends Composer<_$AppDatabase, $DeviceScoresTable> {
  $$DeviceScoresTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get score => $composableBuilder(
      column: $table.score, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastUpdated => $composableBuilder(
      column: $table.lastUpdated, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get created => $composableBuilder(
      column: $table.created, builder: (column) => ColumnOrderings(column));

  $$DevicesTableOrderingComposer get deviceId {
    final $$DevicesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.deviceId,
        referencedTable: $db.devices,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DevicesTableOrderingComposer(
              $db: $db,
              $table: $db.devices,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$DeviceScoresTableAnnotationComposer
    extends Composer<_$AppDatabase, $DeviceScoresTable> {
  $$DeviceScoresTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get score =>
      $composableBuilder(column: $table.score, builder: (column) => column);

  GeneratedColumn<DateTime> get lastUpdated => $composableBuilder(
      column: $table.lastUpdated, builder: (column) => column);

  GeneratedColumn<DateTime> get created =>
      $composableBuilder(column: $table.created, builder: (column) => column);

  $$DevicesTableAnnotationComposer get deviceId {
    final $$DevicesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.deviceId,
        referencedTable: $db.devices,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DevicesTableAnnotationComposer(
              $db: $db,
              $table: $db.devices,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$DeviceScoresTableTableManager extends RootTableManager<
    _$AppDatabase,
    $DeviceScoresTable,
    DeviceScoreData,
    $$DeviceScoresTableFilterComposer,
    $$DeviceScoresTableOrderingComposer,
    $$DeviceScoresTableAnnotationComposer,
    $$DeviceScoresTableCreateCompanionBuilder,
    $$DeviceScoresTableUpdateCompanionBuilder,
    (DeviceScoreData, $$DeviceScoresTableReferences),
    DeviceScoreData,
    PrefetchHooks Function({bool deviceId})> {
  $$DeviceScoresTableTableManager(_$AppDatabase db, $DeviceScoresTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DeviceScoresTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DeviceScoresTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DeviceScoresTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> deviceId = const Value.absent(),
            Value<int?> score = const Value.absent(),
            Value<DateTime> lastUpdated = const Value.absent(),
            Value<DateTime> created = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DeviceScoresCompanion(
            deviceId: deviceId,
            score: score,
            lastUpdated: lastUpdated,
            created: created,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int deviceId,
            Value<int?> score = const Value.absent(),
            Value<DateTime> lastUpdated = const Value.absent(),
            Value<DateTime> created = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DeviceScoresCompanion.insert(
            deviceId: deviceId,
            score: score,
            lastUpdated: lastUpdated,
            created: created,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$DeviceScoresTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({deviceId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (deviceId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.deviceId,
                    referencedTable:
                        $$DeviceScoresTableReferences._deviceIdTable(db),
                    referencedColumn:
                        $$DeviceScoresTableReferences._deviceIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$DeviceScoresTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $DeviceScoresTable,
    DeviceScoreData,
    $$DeviceScoresTableFilterComposer,
    $$DeviceScoresTableOrderingComposer,
    $$DeviceScoresTableAnnotationComposer,
    $$DeviceScoresTableCreateCompanionBuilder,
    $$DeviceScoresTableUpdateCompanionBuilder,
    (DeviceScoreData, $$DeviceScoresTableReferences),
    DeviceScoreData,
    PrefetchHooks Function({bool deviceId})>;
typedef $$UsersTableCreateCompanionBuilder = UsersCompanion Function({
  Value<int> id,
  required String name,
  required String email,
  required String locationId,
  required int mainDevice,
  required int otherDevicesId,
});
typedef $$UsersTableUpdateCompanionBuilder = UsersCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> email,
  Value<String> locationId,
  Value<int> mainDevice,
  Value<int> otherDevicesId,
});

final class $$UsersTableReferences
    extends BaseReferences<_$AppDatabase, $UsersTable, UserData> {
  $$UsersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $LocationsTable _locationIdTable(_$AppDatabase db) =>
      db.locations.createAlias(
          $_aliasNameGenerator(db.users.locationId, db.locations.countryCode));

  $$LocationsTableProcessedTableManager? get locationId {
    if ($_item.locationId == null) return null;
    final manager = $$LocationsTableTableManager($_db, $_db.locations)
        .filter((f) => f.countryCode($_item.locationId!));
    final item = $_typedResult.readTableOrNull(_locationIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $DevicesTable _otherDevicesIdTable(_$AppDatabase db) =>
      db.devices.createAlias(
          $_aliasNameGenerator(db.users.otherDevicesId, db.devices.id));

  $$DevicesTableProcessedTableManager? get otherDevicesId {
    if ($_item.otherDevicesId == null) return null;
    final manager = $$DevicesTableTableManager($_db, $_db.devices)
        .filter((f) => f.id($_item.otherDevicesId!));
    final item = $_typedResult.readTableOrNull(_otherDevicesIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$BusinessProfilesTable, List<BusinessProfileData>>
      _ownerGroupsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.businessProfiles,
              aliasName:
                  $_aliasNameGenerator(db.users.id, db.businessProfiles.owner));

  $$BusinessProfilesTableProcessedTableManager get ownerGroups {
    final manager =
        $$BusinessProfilesTableTableManager($_db, $_db.businessProfiles)
            .filter((f) => f.owner.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_ownerGroupsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$BusinessProfilesTable, List<BusinessProfileData>>
      _pairedUserGroupsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.businessProfiles,
          aliasName:
              $_aliasNameGenerator(db.users.id, db.businessProfiles.employees));

  $$BusinessProfilesTableProcessedTableManager get pairedUserGroups {
    final manager =
        $$BusinessProfilesTableTableManager($_db, $_db.businessProfiles)
            .filter((f) => f.employees.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_pairedUserGroupsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$SmeProfilesTable, List<SmeProfileData>>
      _smeProfilesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.smeProfiles,
          aliasName: $_aliasNameGenerator(db.users.id, db.smeProfiles.actor));

  $$SmeProfilesTableProcessedTableManager get smeProfilesRefs {
    final manager = $$SmeProfilesTableTableManager($_db, $_db.smeProfiles)
        .filter((f) => f.actor.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_smeProfilesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$UsersTableFilterComposer extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  $$LocationsTableFilterComposer get locationId {
    final $$LocationsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.locationId,
        referencedTable: $db.locations,
        getReferencedColumn: (t) => t.countryCode,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$LocationsTableFilterComposer(
              $db: $db,
              $table: $db.locations,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$DevicesTableFilterComposer get otherDevicesId {
    final $$DevicesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.otherDevicesId,
        referencedTable: $db.devices,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DevicesTableFilterComposer(
              $db: $db,
              $table: $db.devices,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> ownerGroups(
      Expression<bool> Function($$BusinessProfilesTableFilterComposer f) f) {
    final $$BusinessProfilesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.businessProfiles,
        getReferencedColumn: (t) => t.owner,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BusinessProfilesTableFilterComposer(
              $db: $db,
              $table: $db.businessProfiles,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> pairedUserGroups(
      Expression<bool> Function($$BusinessProfilesTableFilterComposer f) f) {
    final $$BusinessProfilesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.businessProfiles,
        getReferencedColumn: (t) => t.employees,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BusinessProfilesTableFilterComposer(
              $db: $db,
              $table: $db.businessProfiles,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> smeProfilesRefs(
      Expression<bool> Function($$SmeProfilesTableFilterComposer f) f) {
    final $$SmeProfilesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.smeProfiles,
        getReferencedColumn: (t) => t.actor,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SmeProfilesTableFilterComposer(
              $db: $db,
              $table: $db.smeProfiles,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$UsersTableOrderingComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  $$LocationsTableOrderingComposer get locationId {
    final $$LocationsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.locationId,
        referencedTable: $db.locations,
        getReferencedColumn: (t) => t.countryCode,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$LocationsTableOrderingComposer(
              $db: $db,
              $table: $db.locations,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$DevicesTableOrderingComposer get otherDevicesId {
    final $$DevicesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.otherDevicesId,
        referencedTable: $db.devices,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DevicesTableOrderingComposer(
              $db: $db,
              $table: $db.devices,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$UsersTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  $$LocationsTableAnnotationComposer get locationId {
    final $$LocationsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.locationId,
        referencedTable: $db.locations,
        getReferencedColumn: (t) => t.countryCode,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$LocationsTableAnnotationComposer(
              $db: $db,
              $table: $db.locations,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$DevicesTableAnnotationComposer get otherDevicesId {
    final $$DevicesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.otherDevicesId,
        referencedTable: $db.devices,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$DevicesTableAnnotationComposer(
              $db: $db,
              $table: $db.devices,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> ownerGroups<T extends Object>(
      Expression<T> Function($$BusinessProfilesTableAnnotationComposer a) f) {
    final $$BusinessProfilesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.businessProfiles,
        getReferencedColumn: (t) => t.owner,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BusinessProfilesTableAnnotationComposer(
              $db: $db,
              $table: $db.businessProfiles,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> pairedUserGroups<T extends Object>(
      Expression<T> Function($$BusinessProfilesTableAnnotationComposer a) f) {
    final $$BusinessProfilesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.businessProfiles,
        getReferencedColumn: (t) => t.employees,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BusinessProfilesTableAnnotationComposer(
              $db: $db,
              $table: $db.businessProfiles,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> smeProfilesRefs<T extends Object>(
      Expression<T> Function($$SmeProfilesTableAnnotationComposer a) f) {
    final $$SmeProfilesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.smeProfiles,
        getReferencedColumn: (t) => t.actor,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SmeProfilesTableAnnotationComposer(
              $db: $db,
              $table: $db.smeProfiles,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$UsersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UsersTable,
    UserData,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableAnnotationComposer,
    $$UsersTableCreateCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder,
    (UserData, $$UsersTableReferences),
    UserData,
    PrefetchHooks Function(
        {bool locationId,
        bool otherDevicesId,
        bool ownerGroups,
        bool pairedUserGroups,
        bool smeProfilesRefs})> {
  $$UsersTableTableManager(_$AppDatabase db, $UsersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> email = const Value.absent(),
            Value<String> locationId = const Value.absent(),
            Value<int> mainDevice = const Value.absent(),
            Value<int> otherDevicesId = const Value.absent(),
          }) =>
              UsersCompanion(
            id: id,
            name: name,
            email: email,
            locationId: locationId,
            mainDevice: mainDevice,
            otherDevicesId: otherDevicesId,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String email,
            required String locationId,
            required int mainDevice,
            required int otherDevicesId,
          }) =>
              UsersCompanion.insert(
            id: id,
            name: name,
            email: email,
            locationId: locationId,
            mainDevice: mainDevice,
            otherDevicesId: otherDevicesId,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$UsersTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: (
              {locationId = false,
              otherDevicesId = false,
              ownerGroups = false,
              pairedUserGroups = false,
              smeProfilesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (ownerGroups) db.businessProfiles,
                if (pairedUserGroups) db.businessProfiles,
                if (smeProfilesRefs) db.smeProfiles
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (locationId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.locationId,
                    referencedTable:
                        $$UsersTableReferences._locationIdTable(db),
                    referencedColumn:
                        $$UsersTableReferences._locationIdTable(db).countryCode,
                  ) as T;
                }
                if (otherDevicesId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.otherDevicesId,
                    referencedTable:
                        $$UsersTableReferences._otherDevicesIdTable(db),
                    referencedColumn:
                        $$UsersTableReferences._otherDevicesIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (ownerGroups)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$UsersTableReferences._ownerGroupsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$UsersTableReferences(db, table, p0).ownerGroups,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.owner == item.id),
                        typedResults: items),
                  if (pairedUserGroups)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$UsersTableReferences._pairedUserGroupsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$UsersTableReferences(db, table, p0)
                                .pairedUserGroups,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.employees == item.id),
                        typedResults: items),
                  if (smeProfilesRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable:
                            $$UsersTableReferences._smeProfilesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$UsersTableReferences(db, table, p0)
                                .smeProfilesRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.actor == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$UsersTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $UsersTable,
    UserData,
    $$UsersTableFilterComposer,
    $$UsersTableOrderingComposer,
    $$UsersTableAnnotationComposer,
    $$UsersTableCreateCompanionBuilder,
    $$UsersTableUpdateCompanionBuilder,
    (UserData, $$UsersTableReferences),
    UserData,
    PrefetchHooks Function(
        {bool locationId,
        bool otherDevicesId,
        bool ownerGroups,
        bool pairedUserGroups,
        bool smeProfilesRefs})>;
typedef $$IndustriesTableCreateCompanionBuilder = IndustriesCompanion Function({
  Value<int> id,
  required String name,
});
typedef $$IndustriesTableUpdateCompanionBuilder = IndustriesCompanion Function({
  Value<int> id,
  Value<String> name,
});

final class $$IndustriesTableReferences
    extends BaseReferences<_$AppDatabase, $IndustriesTable, IndustryData> {
  $$IndustriesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$BusinessProfilesTable, List<BusinessProfileData>>
      _businessProfilesRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.businessProfiles,
              aliasName: $_aliasNameGenerator(
                  db.industries.id, db.businessProfiles.industryType));

  $$BusinessProfilesTableProcessedTableManager get businessProfilesRefs {
    final manager =
        $$BusinessProfilesTableTableManager($_db, $_db.businessProfiles)
            .filter((f) => f.industryType.id($_item.id));

    final cache =
        $_typedResult.readTableOrNull(_businessProfilesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$IndustriesTableFilterComposer
    extends Composer<_$AppDatabase, $IndustriesTable> {
  $$IndustriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  Expression<bool> businessProfilesRefs(
      Expression<bool> Function($$BusinessProfilesTableFilterComposer f) f) {
    final $$BusinessProfilesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.businessProfiles,
        getReferencedColumn: (t) => t.industryType,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BusinessProfilesTableFilterComposer(
              $db: $db,
              $table: $db.businessProfiles,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$IndustriesTableOrderingComposer
    extends Composer<_$AppDatabase, $IndustriesTable> {
  $$IndustriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));
}

class $$IndustriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $IndustriesTable> {
  $$IndustriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  Expression<T> businessProfilesRefs<T extends Object>(
      Expression<T> Function($$BusinessProfilesTableAnnotationComposer a) f) {
    final $$BusinessProfilesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.businessProfiles,
        getReferencedColumn: (t) => t.industryType,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$BusinessProfilesTableAnnotationComposer(
              $db: $db,
              $table: $db.businessProfiles,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$IndustriesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $IndustriesTable,
    IndustryData,
    $$IndustriesTableFilterComposer,
    $$IndustriesTableOrderingComposer,
    $$IndustriesTableAnnotationComposer,
    $$IndustriesTableCreateCompanionBuilder,
    $$IndustriesTableUpdateCompanionBuilder,
    (IndustryData, $$IndustriesTableReferences),
    IndustryData,
    PrefetchHooks Function({bool businessProfilesRefs})> {
  $$IndustriesTableTableManager(_$AppDatabase db, $IndustriesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$IndustriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$IndustriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$IndustriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
          }) =>
              IndustriesCompanion(
            id: id,
            name: name,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
          }) =>
              IndustriesCompanion.insert(
            id: id,
            name: name,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$IndustriesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({businessProfilesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (businessProfilesRefs) db.businessProfiles
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (businessProfilesRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$IndustriesTableReferences
                            ._businessProfilesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$IndustriesTableReferences(db, table, p0)
                                .businessProfilesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.industryType == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$IndustriesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $IndustriesTable,
    IndustryData,
    $$IndustriesTableFilterComposer,
    $$IndustriesTableOrderingComposer,
    $$IndustriesTableAnnotationComposer,
    $$IndustriesTableCreateCompanionBuilder,
    $$IndustriesTableUpdateCompanionBuilder,
    (IndustryData, $$IndustriesTableReferences),
    IndustryData,
    PrefetchHooks Function({bool businessProfilesRefs})>;
typedef $$BusinessProfilesTableCreateCompanionBuilder
    = BusinessProfilesCompanion Function({
  Value<int> id,
  required String name,
  required int industryType,
  required int owner,
  required int employees,
});
typedef $$BusinessProfilesTableUpdateCompanionBuilder
    = BusinessProfilesCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<int> industryType,
  Value<int> owner,
  Value<int> employees,
});

final class $$BusinessProfilesTableReferences extends BaseReferences<
    _$AppDatabase, $BusinessProfilesTable, BusinessProfileData> {
  $$BusinessProfilesTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $IndustriesTable _industryTypeTable(_$AppDatabase db) =>
      db.industries.createAlias($_aliasNameGenerator(
          db.businessProfiles.industryType, db.industries.id));

  $$IndustriesTableProcessedTableManager? get industryType {
    if ($_item.industryType == null) return null;
    final manager = $$IndustriesTableTableManager($_db, $_db.industries)
        .filter((f) => f.id($_item.industryType!));
    final item = $_typedResult.readTableOrNull(_industryTypeTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $UsersTable _ownerTable(_$AppDatabase db) => db.users.createAlias(
      $_aliasNameGenerator(db.businessProfiles.owner, db.users.id));

  $$UsersTableProcessedTableManager? get owner {
    if ($_item.owner == null) return null;
    final manager = $$UsersTableTableManager($_db, $_db.users)
        .filter((f) => f.id($_item.owner!));
    final item = $_typedResult.readTableOrNull(_ownerTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $UsersTable _employeesTable(_$AppDatabase db) => db.users.createAlias(
      $_aliasNameGenerator(db.businessProfiles.employees, db.users.id));

  $$UsersTableProcessedTableManager? get employees {
    if ($_item.employees == null) return null;
    final manager = $$UsersTableTableManager($_db, $_db.users)
        .filter((f) => f.id($_item.employees!));
    final item = $_typedResult.readTableOrNull(_employeesTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$BusinessProfilesTableFilterComposer
    extends Composer<_$AppDatabase, $BusinessProfilesTable> {
  $$BusinessProfilesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  $$IndustriesTableFilterComposer get industryType {
    final $$IndustriesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.industryType,
        referencedTable: $db.industries,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$IndustriesTableFilterComposer(
              $db: $db,
              $table: $db.industries,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UsersTableFilterComposer get owner {
    final $$UsersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.owner,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableFilterComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UsersTableFilterComposer get employees {
    final $$UsersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.employees,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableFilterComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$BusinessProfilesTableOrderingComposer
    extends Composer<_$AppDatabase, $BusinessProfilesTable> {
  $$BusinessProfilesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  $$IndustriesTableOrderingComposer get industryType {
    final $$IndustriesTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.industryType,
        referencedTable: $db.industries,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$IndustriesTableOrderingComposer(
              $db: $db,
              $table: $db.industries,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UsersTableOrderingComposer get owner {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.owner,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableOrderingComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UsersTableOrderingComposer get employees {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.employees,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableOrderingComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$BusinessProfilesTableAnnotationComposer
    extends Composer<_$AppDatabase, $BusinessProfilesTable> {
  $$BusinessProfilesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  $$IndustriesTableAnnotationComposer get industryType {
    final $$IndustriesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.industryType,
        referencedTable: $db.industries,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$IndustriesTableAnnotationComposer(
              $db: $db,
              $table: $db.industries,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UsersTableAnnotationComposer get owner {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.owner,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableAnnotationComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$UsersTableAnnotationComposer get employees {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.employees,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableAnnotationComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$BusinessProfilesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $BusinessProfilesTable,
    BusinessProfileData,
    $$BusinessProfilesTableFilterComposer,
    $$BusinessProfilesTableOrderingComposer,
    $$BusinessProfilesTableAnnotationComposer,
    $$BusinessProfilesTableCreateCompanionBuilder,
    $$BusinessProfilesTableUpdateCompanionBuilder,
    (BusinessProfileData, $$BusinessProfilesTableReferences),
    BusinessProfileData,
    PrefetchHooks Function({bool industryType, bool owner, bool employees})> {
  $$BusinessProfilesTableTableManager(
      _$AppDatabase db, $BusinessProfilesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BusinessProfilesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BusinessProfilesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BusinessProfilesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int> industryType = const Value.absent(),
            Value<int> owner = const Value.absent(),
            Value<int> employees = const Value.absent(),
          }) =>
              BusinessProfilesCompanion(
            id: id,
            name: name,
            industryType: industryType,
            owner: owner,
            employees: employees,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required int industryType,
            required int owner,
            required int employees,
          }) =>
              BusinessProfilesCompanion.insert(
            id: id,
            name: name,
            industryType: industryType,
            owner: owner,
            employees: employees,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$BusinessProfilesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {industryType = false, owner = false, employees = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (industryType) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.industryType,
                    referencedTable: $$BusinessProfilesTableReferences
                        ._industryTypeTable(db),
                    referencedColumn: $$BusinessProfilesTableReferences
                        ._industryTypeTable(db)
                        .id,
                  ) as T;
                }
                if (owner) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.owner,
                    referencedTable:
                        $$BusinessProfilesTableReferences._ownerTable(db),
                    referencedColumn:
                        $$BusinessProfilesTableReferences._ownerTable(db).id,
                  ) as T;
                }
                if (employees) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.employees,
                    referencedTable:
                        $$BusinessProfilesTableReferences._employeesTable(db),
                    referencedColumn: $$BusinessProfilesTableReferences
                        ._employeesTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$BusinessProfilesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $BusinessProfilesTable,
    BusinessProfileData,
    $$BusinessProfilesTableFilterComposer,
    $$BusinessProfilesTableOrderingComposer,
    $$BusinessProfilesTableAnnotationComposer,
    $$BusinessProfilesTableCreateCompanionBuilder,
    $$BusinessProfilesTableUpdateCompanionBuilder,
    (BusinessProfileData, $$BusinessProfilesTableReferences),
    BusinessProfileData,
    PrefetchHooks Function({bool industryType, bool owner, bool employees})>;
typedef $$NewsInfoTableCreateCompanionBuilder = NewsInfoCompanion Function({
  required String id,
  required int order,
  required String title,
  required String summary,
  required String imageUrl,
  required String dateCreated,
  Value<int> rowid,
});
typedef $$NewsInfoTableUpdateCompanionBuilder = NewsInfoCompanion Function({
  Value<String> id,
  Value<int> order,
  Value<String> title,
  Value<String> summary,
  Value<String> imageUrl,
  Value<String> dateCreated,
  Value<int> rowid,
});

final class $$NewsInfoTableReferences
    extends BaseReferences<_$AppDatabase, $NewsInfoTable, NewsData> {
  $$NewsInfoTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$RecommendationsTable, List<RecommendationData>>
      _recommendationsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.recommendations,
              aliasName: $_aliasNameGenerator(
                  db.newsInfo.id, db.recommendations.newsId));

  $$RecommendationsTableProcessedTableManager get recommendationsRefs {
    final manager =
        $$RecommendationsTableTableManager($_db, $_db.recommendations)
            .filter((f) => f.newsId.id($_item.id));

    final cache =
        $_typedResult.readTableOrNull(_recommendationsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$NewsInfoTableFilterComposer
    extends Composer<_$AppDatabase, $NewsInfoTable> {
  $$NewsInfoTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get order => $composableBuilder(
      column: $table.order, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get summary => $composableBuilder(
      column: $table.summary, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get imageUrl => $composableBuilder(
      column: $table.imageUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get dateCreated => $composableBuilder(
      column: $table.dateCreated, builder: (column) => ColumnFilters(column));

  Expression<bool> recommendationsRefs(
      Expression<bool> Function($$RecommendationsTableFilterComposer f) f) {
    final $$RecommendationsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.recommendations,
        getReferencedColumn: (t) => t.newsId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RecommendationsTableFilterComposer(
              $db: $db,
              $table: $db.recommendations,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$NewsInfoTableOrderingComposer
    extends Composer<_$AppDatabase, $NewsInfoTable> {
  $$NewsInfoTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get order => $composableBuilder(
      column: $table.order, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get title => $composableBuilder(
      column: $table.title, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get summary => $composableBuilder(
      column: $table.summary, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get imageUrl => $composableBuilder(
      column: $table.imageUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get dateCreated => $composableBuilder(
      column: $table.dateCreated, builder: (column) => ColumnOrderings(column));
}

class $$NewsInfoTableAnnotationComposer
    extends Composer<_$AppDatabase, $NewsInfoTable> {
  $$NewsInfoTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get order =>
      $composableBuilder(column: $table.order, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get summary =>
      $composableBuilder(column: $table.summary, builder: (column) => column);

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<String> get dateCreated => $composableBuilder(
      column: $table.dateCreated, builder: (column) => column);

  Expression<T> recommendationsRefs<T extends Object>(
      Expression<T> Function($$RecommendationsTableAnnotationComposer a) f) {
    final $$RecommendationsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.recommendations,
        getReferencedColumn: (t) => t.newsId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RecommendationsTableAnnotationComposer(
              $db: $db,
              $table: $db.recommendations,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$NewsInfoTableTableManager extends RootTableManager<
    _$AppDatabase,
    $NewsInfoTable,
    NewsData,
    $$NewsInfoTableFilterComposer,
    $$NewsInfoTableOrderingComposer,
    $$NewsInfoTableAnnotationComposer,
    $$NewsInfoTableCreateCompanionBuilder,
    $$NewsInfoTableUpdateCompanionBuilder,
    (NewsData, $$NewsInfoTableReferences),
    NewsData,
    PrefetchHooks Function({bool recommendationsRefs})> {
  $$NewsInfoTableTableManager(_$AppDatabase db, $NewsInfoTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$NewsInfoTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$NewsInfoTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$NewsInfoTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<int> order = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> summary = const Value.absent(),
            Value<String> imageUrl = const Value.absent(),
            Value<String> dateCreated = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              NewsInfoCompanion(
            id: id,
            order: order,
            title: title,
            summary: summary,
            imageUrl: imageUrl,
            dateCreated: dateCreated,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required int order,
            required String title,
            required String summary,
            required String imageUrl,
            required String dateCreated,
            Value<int> rowid = const Value.absent(),
          }) =>
              NewsInfoCompanion.insert(
            id: id,
            order: order,
            title: title,
            summary: summary,
            imageUrl: imageUrl,
            dateCreated: dateCreated,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) =>
                  (e.readTable(table), $$NewsInfoTableReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: ({recommendationsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (recommendationsRefs) db.recommendations
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (recommendationsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$NewsInfoTableReferences
                            ._recommendationsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$NewsInfoTableReferences(db, table, p0)
                                .recommendationsRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.newsId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$NewsInfoTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $NewsInfoTable,
    NewsData,
    $$NewsInfoTableFilterComposer,
    $$NewsInfoTableOrderingComposer,
    $$NewsInfoTableAnnotationComposer,
    $$NewsInfoTableCreateCompanionBuilder,
    $$NewsInfoTableUpdateCompanionBuilder,
    (NewsData, $$NewsInfoTableReferences),
    NewsData,
    PrefetchHooks Function({bool recommendationsRefs})>;
typedef $$RecommendationsTableCreateCompanionBuilder = RecommendationsCompanion
    Function({
  required String id,
  required String newsId,
  required int order,
  required String name,
  Value<int> rowid,
});
typedef $$RecommendationsTableUpdateCompanionBuilder = RecommendationsCompanion
    Function({
  Value<String> id,
  Value<String> newsId,
  Value<int> order,
  Value<String> name,
  Value<int> rowid,
});

final class $$RecommendationsTableReferences extends BaseReferences<
    _$AppDatabase, $RecommendationsTable, RecommendationData> {
  $$RecommendationsTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $NewsInfoTable _newsIdTable(_$AppDatabase db) =>
      db.newsInfo.createAlias(
          $_aliasNameGenerator(db.recommendations.newsId, db.newsInfo.id));

  $$NewsInfoTableProcessedTableManager? get newsId {
    if ($_item.newsId == null) return null;
    final manager = $$NewsInfoTableTableManager($_db, $_db.newsInfo)
        .filter((f) => f.id($_item.newsId!));
    final item = $_typedResult.readTableOrNull(_newsIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$SmeProfilesTable, List<SmeProfileData>>
      _smeProfilesRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.smeProfiles,
              aliasName: $_aliasNameGenerator(
                  db.recommendations.id, db.smeProfiles.implRecoID));

  $$SmeProfilesTableProcessedTableManager get smeProfilesRefs {
    final manager = $$SmeProfilesTableTableManager($_db, $_db.smeProfiles)
        .filter((f) => f.implRecoID.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_smeProfilesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$TodoRecommendationStatusesTable,
      List<TodoRecommendationStatusData>> _todoRecommendationStatusesRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.todoRecommendationStatuses,
          aliasName: $_aliasNameGenerator(db.recommendations.id,
              db.todoRecommendationStatuses.recommendationId));

  $$TodoRecommendationStatusesTableProcessedTableManager
      get todoRecommendationStatusesRefs {
    final manager = $$TodoRecommendationStatusesTableTableManager(
            $_db, $_db.todoRecommendationStatuses)
        .filter((f) => f.recommendationId.id($_item.id));

    final cache = $_typedResult
        .readTableOrNull(_todoRecommendationStatusesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$OfferingsTable, List<OfferingData>>
      _offeringsRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.offerings,
              aliasName: $_aliasNameGenerator(
                  db.recommendations.id, db.offerings.recommendationId));

  $$OfferingsTableProcessedTableManager get offeringsRefs {
    final manager = $$OfferingsTableTableManager($_db, $_db.offerings)
        .filter((f) => f.recommendationId.id($_item.id));

    final cache = $_typedResult.readTableOrNull(_offeringsRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$RecommendationsTableFilterComposer
    extends Composer<_$AppDatabase, $RecommendationsTable> {
  $$RecommendationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get order => $composableBuilder(
      column: $table.order, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  $$NewsInfoTableFilterComposer get newsId {
    final $$NewsInfoTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.newsId,
        referencedTable: $db.newsInfo,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$NewsInfoTableFilterComposer(
              $db: $db,
              $table: $db.newsInfo,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> smeProfilesRefs(
      Expression<bool> Function($$SmeProfilesTableFilterComposer f) f) {
    final $$SmeProfilesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.smeProfiles,
        getReferencedColumn: (t) => t.implRecoID,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SmeProfilesTableFilterComposer(
              $db: $db,
              $table: $db.smeProfiles,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> todoRecommendationStatusesRefs(
      Expression<bool> Function(
              $$TodoRecommendationStatusesTableFilterComposer f)
          f) {
    final $$TodoRecommendationStatusesTableFilterComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.todoRecommendationStatuses,
            getReferencedColumn: (t) => t.recommendationId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$TodoRecommendationStatusesTableFilterComposer(
                  $db: $db,
                  $table: $db.todoRecommendationStatuses,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<bool> offeringsRefs(
      Expression<bool> Function($$OfferingsTableFilterComposer f) f) {
    final $$OfferingsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.offerings,
        getReferencedColumn: (t) => t.recommendationId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$OfferingsTableFilterComposer(
              $db: $db,
              $table: $db.offerings,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$RecommendationsTableOrderingComposer
    extends Composer<_$AppDatabase, $RecommendationsTable> {
  $$RecommendationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get order => $composableBuilder(
      column: $table.order, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  $$NewsInfoTableOrderingComposer get newsId {
    final $$NewsInfoTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.newsId,
        referencedTable: $db.newsInfo,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$NewsInfoTableOrderingComposer(
              $db: $db,
              $table: $db.newsInfo,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$RecommendationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RecommendationsTable> {
  $$RecommendationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get order =>
      $composableBuilder(column: $table.order, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  $$NewsInfoTableAnnotationComposer get newsId {
    final $$NewsInfoTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.newsId,
        referencedTable: $db.newsInfo,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$NewsInfoTableAnnotationComposer(
              $db: $db,
              $table: $db.newsInfo,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> smeProfilesRefs<T extends Object>(
      Expression<T> Function($$SmeProfilesTableAnnotationComposer a) f) {
    final $$SmeProfilesTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.smeProfiles,
        getReferencedColumn: (t) => t.implRecoID,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SmeProfilesTableAnnotationComposer(
              $db: $db,
              $table: $db.smeProfiles,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> todoRecommendationStatusesRefs<T extends Object>(
      Expression<T> Function(
              $$TodoRecommendationStatusesTableAnnotationComposer a)
          f) {
    final $$TodoRecommendationStatusesTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.todoRecommendationStatuses,
            getReferencedColumn: (t) => t.recommendationId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$TodoRecommendationStatusesTableAnnotationComposer(
                  $db: $db,
                  $table: $db.todoRecommendationStatuses,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }

  Expression<T> offeringsRefs<T extends Object>(
      Expression<T> Function($$OfferingsTableAnnotationComposer a) f) {
    final $$OfferingsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.offerings,
        getReferencedColumn: (t) => t.recommendationId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$OfferingsTableAnnotationComposer(
              $db: $db,
              $table: $db.offerings,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$RecommendationsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RecommendationsTable,
    RecommendationData,
    $$RecommendationsTableFilterComposer,
    $$RecommendationsTableOrderingComposer,
    $$RecommendationsTableAnnotationComposer,
    $$RecommendationsTableCreateCompanionBuilder,
    $$RecommendationsTableUpdateCompanionBuilder,
    (RecommendationData, $$RecommendationsTableReferences),
    RecommendationData,
    PrefetchHooks Function(
        {bool newsId,
        bool smeProfilesRefs,
        bool todoRecommendationStatusesRefs,
        bool offeringsRefs})> {
  $$RecommendationsTableTableManager(
      _$AppDatabase db, $RecommendationsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RecommendationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RecommendationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RecommendationsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> newsId = const Value.absent(),
            Value<int> order = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              RecommendationsCompanion(
            id: id,
            newsId: newsId,
            order: order,
            name: name,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String newsId,
            required int order,
            required String name,
            Value<int> rowid = const Value.absent(),
          }) =>
              RecommendationsCompanion.insert(
            id: id,
            newsId: newsId,
            order: order,
            name: name,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$RecommendationsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {newsId = false,
              smeProfilesRefs = false,
              todoRecommendationStatusesRefs = false,
              offeringsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (smeProfilesRefs) db.smeProfiles,
                if (todoRecommendationStatusesRefs)
                  db.todoRecommendationStatuses,
                if (offeringsRefs) db.offerings
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (newsId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.newsId,
                    referencedTable:
                        $$RecommendationsTableReferences._newsIdTable(db),
                    referencedColumn:
                        $$RecommendationsTableReferences._newsIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (smeProfilesRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$RecommendationsTableReferences
                            ._smeProfilesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$RecommendationsTableReferences(db, table, p0)
                                .smeProfilesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.implRecoID == item.id),
                        typedResults: items),
                  if (todoRecommendationStatusesRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$RecommendationsTableReferences
                            ._todoRecommendationStatusesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$RecommendationsTableReferences(db, table, p0)
                                .todoRecommendationStatusesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.recommendationId == item.id),
                        typedResults: items),
                  if (offeringsRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$RecommendationsTableReferences
                            ._offeringsRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$RecommendationsTableReferences(db, table, p0)
                                .offeringsRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.recommendationId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$RecommendationsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $RecommendationsTable,
    RecommendationData,
    $$RecommendationsTableFilterComposer,
    $$RecommendationsTableOrderingComposer,
    $$RecommendationsTableAnnotationComposer,
    $$RecommendationsTableCreateCompanionBuilder,
    $$RecommendationsTableUpdateCompanionBuilder,
    (RecommendationData, $$RecommendationsTableReferences),
    RecommendationData,
    PrefetchHooks Function(
        {bool newsId,
        bool smeProfilesRefs,
        bool todoRecommendationStatusesRefs,
        bool offeringsRefs})>;
typedef $$SmeProfilesTableCreateCompanionBuilder = SmeProfilesCompanion
    Function({
  required int actor,
  required String verb,
  required String implRecoID,
  Value<int> rowid,
});
typedef $$SmeProfilesTableUpdateCompanionBuilder = SmeProfilesCompanion
    Function({
  Value<int> actor,
  Value<String> verb,
  Value<String> implRecoID,
  Value<int> rowid,
});

final class $$SmeProfilesTableReferences
    extends BaseReferences<_$AppDatabase, $SmeProfilesTable, SmeProfileData> {
  $$SmeProfilesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _actorTable(_$AppDatabase db) => db.users
      .createAlias($_aliasNameGenerator(db.smeProfiles.actor, db.users.id));

  $$UsersTableProcessedTableManager? get actor {
    if ($_item.actor == null) return null;
    final manager = $$UsersTableTableManager($_db, $_db.users)
        .filter((f) => f.id($_item.actor!));
    final item = $_typedResult.readTableOrNull(_actorTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $RecommendationsTable _implRecoIDTable(_$AppDatabase db) =>
      db.recommendations.createAlias($_aliasNameGenerator(
          db.smeProfiles.implRecoID, db.recommendations.id));

  $$RecommendationsTableProcessedTableManager? get implRecoID {
    if ($_item.implRecoID == null) return null;
    final manager =
        $$RecommendationsTableTableManager($_db, $_db.recommendations)
            .filter((f) => f.id($_item.implRecoID!));
    final item = $_typedResult.readTableOrNull(_implRecoIDTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$SmeProfilesTableFilterComposer
    extends Composer<_$AppDatabase, $SmeProfilesTable> {
  $$SmeProfilesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get verb => $composableBuilder(
      column: $table.verb, builder: (column) => ColumnFilters(column));

  $$UsersTableFilterComposer get actor {
    final $$UsersTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.actor,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableFilterComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$RecommendationsTableFilterComposer get implRecoID {
    final $$RecommendationsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.implRecoID,
        referencedTable: $db.recommendations,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RecommendationsTableFilterComposer(
              $db: $db,
              $table: $db.recommendations,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$SmeProfilesTableOrderingComposer
    extends Composer<_$AppDatabase, $SmeProfilesTable> {
  $$SmeProfilesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get verb => $composableBuilder(
      column: $table.verb, builder: (column) => ColumnOrderings(column));

  $$UsersTableOrderingComposer get actor {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.actor,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableOrderingComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$RecommendationsTableOrderingComposer get implRecoID {
    final $$RecommendationsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.implRecoID,
        referencedTable: $db.recommendations,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RecommendationsTableOrderingComposer(
              $db: $db,
              $table: $db.recommendations,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$SmeProfilesTableAnnotationComposer
    extends Composer<_$AppDatabase, $SmeProfilesTable> {
  $$SmeProfilesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get verb =>
      $composableBuilder(column: $table.verb, builder: (column) => column);

  $$UsersTableAnnotationComposer get actor {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.actor,
        referencedTable: $db.users,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$UsersTableAnnotationComposer(
              $db: $db,
              $table: $db.users,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$RecommendationsTableAnnotationComposer get implRecoID {
    final $$RecommendationsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.implRecoID,
        referencedTable: $db.recommendations,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RecommendationsTableAnnotationComposer(
              $db: $db,
              $table: $db.recommendations,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$SmeProfilesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SmeProfilesTable,
    SmeProfileData,
    $$SmeProfilesTableFilterComposer,
    $$SmeProfilesTableOrderingComposer,
    $$SmeProfilesTableAnnotationComposer,
    $$SmeProfilesTableCreateCompanionBuilder,
    $$SmeProfilesTableUpdateCompanionBuilder,
    (SmeProfileData, $$SmeProfilesTableReferences),
    SmeProfileData,
    PrefetchHooks Function({bool actor, bool implRecoID})> {
  $$SmeProfilesTableTableManager(_$AppDatabase db, $SmeProfilesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SmeProfilesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SmeProfilesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SmeProfilesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> actor = const Value.absent(),
            Value<String> verb = const Value.absent(),
            Value<String> implRecoID = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SmeProfilesCompanion(
            actor: actor,
            verb: verb,
            implRecoID: implRecoID,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int actor,
            required String verb,
            required String implRecoID,
            Value<int> rowid = const Value.absent(),
          }) =>
              SmeProfilesCompanion.insert(
            actor: actor,
            verb: verb,
            implRecoID: implRecoID,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$SmeProfilesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({actor = false, implRecoID = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (actor) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.actor,
                    referencedTable:
                        $$SmeProfilesTableReferences._actorTable(db),
                    referencedColumn:
                        $$SmeProfilesTableReferences._actorTable(db).id,
                  ) as T;
                }
                if (implRecoID) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.implRecoID,
                    referencedTable:
                        $$SmeProfilesTableReferences._implRecoIDTable(db),
                    referencedColumn:
                        $$SmeProfilesTableReferences._implRecoIDTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$SmeProfilesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SmeProfilesTable,
    SmeProfileData,
    $$SmeProfilesTableFilterComposer,
    $$SmeProfilesTableOrderingComposer,
    $$SmeProfilesTableAnnotationComposer,
    $$SmeProfilesTableCreateCompanionBuilder,
    $$SmeProfilesTableUpdateCompanionBuilder,
    (SmeProfileData, $$SmeProfilesTableReferences),
    SmeProfileData,
    PrefetchHooks Function({bool actor, bool implRecoID})>;
typedef $$TodoRecommendationStatusesTableCreateCompanionBuilder
    = TodoRecommendationStatusesCompanion Function({
  required String recommendationId,
  Value<bool> completed,
  Value<int> rowid,
});
typedef $$TodoRecommendationStatusesTableUpdateCompanionBuilder
    = TodoRecommendationStatusesCompanion Function({
  Value<String> recommendationId,
  Value<bool> completed,
  Value<int> rowid,
});

final class $$TodoRecommendationStatusesTableReferences extends BaseReferences<
    _$AppDatabase,
    $TodoRecommendationStatusesTable,
    TodoRecommendationStatusData> {
  $$TodoRecommendationStatusesTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $RecommendationsTable _recommendationIdTable(_$AppDatabase db) =>
      db.recommendations.createAlias($_aliasNameGenerator(
          db.todoRecommendationStatuses.recommendationId,
          db.recommendations.id));

  $$RecommendationsTableProcessedTableManager? get recommendationId {
    if ($_item.recommendationId == null) return null;
    final manager =
        $$RecommendationsTableTableManager($_db, $_db.recommendations)
            .filter((f) => f.id($_item.recommendationId!));
    final item = $_typedResult.readTableOrNull(_recommendationIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$TodoRecommendationStatusesTableFilterComposer
    extends Composer<_$AppDatabase, $TodoRecommendationStatusesTable> {
  $$TodoRecommendationStatusesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<bool> get completed => $composableBuilder(
      column: $table.completed, builder: (column) => ColumnFilters(column));

  $$RecommendationsTableFilterComposer get recommendationId {
    final $$RecommendationsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.recommendationId,
        referencedTable: $db.recommendations,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RecommendationsTableFilterComposer(
              $db: $db,
              $table: $db.recommendations,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TodoRecommendationStatusesTableOrderingComposer
    extends Composer<_$AppDatabase, $TodoRecommendationStatusesTable> {
  $$TodoRecommendationStatusesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<bool> get completed => $composableBuilder(
      column: $table.completed, builder: (column) => ColumnOrderings(column));

  $$RecommendationsTableOrderingComposer get recommendationId {
    final $$RecommendationsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.recommendationId,
        referencedTable: $db.recommendations,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RecommendationsTableOrderingComposer(
              $db: $db,
              $table: $db.recommendations,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TodoRecommendationStatusesTableAnnotationComposer
    extends Composer<_$AppDatabase, $TodoRecommendationStatusesTable> {
  $$TodoRecommendationStatusesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<bool> get completed =>
      $composableBuilder(column: $table.completed, builder: (column) => column);

  $$RecommendationsTableAnnotationComposer get recommendationId {
    final $$RecommendationsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.recommendationId,
        referencedTable: $db.recommendations,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RecommendationsTableAnnotationComposer(
              $db: $db,
              $table: $db.recommendations,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TodoRecommendationStatusesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TodoRecommendationStatusesTable,
    TodoRecommendationStatusData,
    $$TodoRecommendationStatusesTableFilterComposer,
    $$TodoRecommendationStatusesTableOrderingComposer,
    $$TodoRecommendationStatusesTableAnnotationComposer,
    $$TodoRecommendationStatusesTableCreateCompanionBuilder,
    $$TodoRecommendationStatusesTableUpdateCompanionBuilder,
    (TodoRecommendationStatusData, $$TodoRecommendationStatusesTableReferences),
    TodoRecommendationStatusData,
    PrefetchHooks Function({bool recommendationId})> {
  $$TodoRecommendationStatusesTableTableManager(
      _$AppDatabase db, $TodoRecommendationStatusesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TodoRecommendationStatusesTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$TodoRecommendationStatusesTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TodoRecommendationStatusesTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> recommendationId = const Value.absent(),
            Value<bool> completed = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TodoRecommendationStatusesCompanion(
            recommendationId: recommendationId,
            completed: completed,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String recommendationId,
            Value<bool> completed = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TodoRecommendationStatusesCompanion.insert(
            recommendationId: recommendationId,
            completed: completed,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$TodoRecommendationStatusesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({recommendationId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (recommendationId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.recommendationId,
                    referencedTable: $$TodoRecommendationStatusesTableReferences
                        ._recommendationIdTable(db),
                    referencedColumn:
                        $$TodoRecommendationStatusesTableReferences
                            ._recommendationIdTable(db)
                            .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$TodoRecommendationStatusesTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $TodoRecommendationStatusesTable,
        TodoRecommendationStatusData,
        $$TodoRecommendationStatusesTableFilterComposer,
        $$TodoRecommendationStatusesTableOrderingComposer,
        $$TodoRecommendationStatusesTableAnnotationComposer,
        $$TodoRecommendationStatusesTableCreateCompanionBuilder,
        $$TodoRecommendationStatusesTableUpdateCompanionBuilder,
        (
          TodoRecommendationStatusData,
          $$TodoRecommendationStatusesTableReferences
        ),
        TodoRecommendationStatusData,
        PrefetchHooks Function({bool recommendationId})>;
typedef $$OfferingsTableCreateCompanionBuilder = OfferingsCompanion Function({
  required String id,
  required String recommendationId,
  required int order,
  required String name,
  required String summary,
  Value<int> rowid,
});
typedef $$OfferingsTableUpdateCompanionBuilder = OfferingsCompanion Function({
  Value<String> id,
  Value<String> recommendationId,
  Value<int> order,
  Value<String> name,
  Value<String> summary,
  Value<int> rowid,
});

final class $$OfferingsTableReferences
    extends BaseReferences<_$AppDatabase, $OfferingsTable, OfferingData> {
  $$OfferingsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $RecommendationsTable _recommendationIdTable(_$AppDatabase db) =>
      db.recommendations.createAlias($_aliasNameGenerator(
          db.offerings.recommendationId, db.recommendations.id));

  $$RecommendationsTableProcessedTableManager? get recommendationId {
    if ($_item.recommendationId == null) return null;
    final manager =
        $$RecommendationsTableTableManager($_db, $_db.recommendations)
            .filter((f) => f.id($_item.recommendationId!));
    final item = $_typedResult.readTableOrNull(_recommendationIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$OfferingsTableFilterComposer
    extends Composer<_$AppDatabase, $OfferingsTable> {
  $$OfferingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get order => $composableBuilder(
      column: $table.order, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get summary => $composableBuilder(
      column: $table.summary, builder: (column) => ColumnFilters(column));

  $$RecommendationsTableFilterComposer get recommendationId {
    final $$RecommendationsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.recommendationId,
        referencedTable: $db.recommendations,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RecommendationsTableFilterComposer(
              $db: $db,
              $table: $db.recommendations,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$OfferingsTableOrderingComposer
    extends Composer<_$AppDatabase, $OfferingsTable> {
  $$OfferingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get order => $composableBuilder(
      column: $table.order, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get summary => $composableBuilder(
      column: $table.summary, builder: (column) => ColumnOrderings(column));

  $$RecommendationsTableOrderingComposer get recommendationId {
    final $$RecommendationsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.recommendationId,
        referencedTable: $db.recommendations,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RecommendationsTableOrderingComposer(
              $db: $db,
              $table: $db.recommendations,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$OfferingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $OfferingsTable> {
  $$OfferingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get order =>
      $composableBuilder(column: $table.order, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get summary =>
      $composableBuilder(column: $table.summary, builder: (column) => column);

  $$RecommendationsTableAnnotationComposer get recommendationId {
    final $$RecommendationsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.recommendationId,
        referencedTable: $db.recommendations,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RecommendationsTableAnnotationComposer(
              $db: $db,
              $table: $db.recommendations,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$OfferingsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $OfferingsTable,
    OfferingData,
    $$OfferingsTableFilterComposer,
    $$OfferingsTableOrderingComposer,
    $$OfferingsTableAnnotationComposer,
    $$OfferingsTableCreateCompanionBuilder,
    $$OfferingsTableUpdateCompanionBuilder,
    (OfferingData, $$OfferingsTableReferences),
    OfferingData,
    PrefetchHooks Function({bool recommendationId})> {
  $$OfferingsTableTableManager(_$AppDatabase db, $OfferingsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OfferingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OfferingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OfferingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> recommendationId = const Value.absent(),
            Value<int> order = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> summary = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              OfferingsCompanion(
            id: id,
            recommendationId: recommendationId,
            order: order,
            name: name,
            summary: summary,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String recommendationId,
            required int order,
            required String name,
            required String summary,
            Value<int> rowid = const Value.absent(),
          }) =>
              OfferingsCompanion.insert(
            id: id,
            recommendationId: recommendationId,
            order: order,
            name: name,
            summary: summary,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$OfferingsTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({recommendationId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (recommendationId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.recommendationId,
                    referencedTable:
                        $$OfferingsTableReferences._recommendationIdTable(db),
                    referencedColumn: $$OfferingsTableReferences
                        ._recommendationIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$OfferingsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $OfferingsTable,
    OfferingData,
    $$OfferingsTableFilterComposer,
    $$OfferingsTableOrderingComposer,
    $$OfferingsTableAnnotationComposer,
    $$OfferingsTableCreateCompanionBuilder,
    $$OfferingsTableUpdateCompanionBuilder,
    (OfferingData, $$OfferingsTableReferences),
    OfferingData,
    PrefetchHooks Function({bool recommendationId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$LocationsTableTableManager get locations =>
      $$LocationsTableTableManager(_db, _db.locations);
  $$DevicesTableTableManager get devices =>
      $$DevicesTableTableManager(_db, _db.devices);
  $$DeviceScoresTableTableManager get deviceScores =>
      $$DeviceScoresTableTableManager(_db, _db.deviceScores);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$IndustriesTableTableManager get industries =>
      $$IndustriesTableTableManager(_db, _db.industries);
  $$BusinessProfilesTableTableManager get businessProfiles =>
      $$BusinessProfilesTableTableManager(_db, _db.businessProfiles);
  $$NewsInfoTableTableManager get newsInfo =>
      $$NewsInfoTableTableManager(_db, _db.newsInfo);
  $$RecommendationsTableTableManager get recommendations =>
      $$RecommendationsTableTableManager(_db, _db.recommendations);
  $$SmeProfilesTableTableManager get smeProfiles =>
      $$SmeProfilesTableTableManager(_db, _db.smeProfiles);
  $$TodoRecommendationStatusesTableTableManager
      get todoRecommendationStatuses =>
          $$TodoRecommendationStatusesTableTableManager(
              _db, _db.todoRecommendationStatuses);
  $$OfferingsTableTableManager get offerings =>
      $$OfferingsTableTableManager(_db, _db.offerings);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appDatabaseHash() => r'8c69eb46d45206533c176c88a926608e79ca927d';

/// See also [appDatabase].
@ProviderFor(appDatabase)
final appDatabaseProvider = Provider<AppDatabase>.internal(
  appDatabase,
  name: r'appDatabaseProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$appDatabaseHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AppDatabaseRef = ProviderRef<AppDatabase>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
