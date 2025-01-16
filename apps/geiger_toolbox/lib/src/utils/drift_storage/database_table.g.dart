// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_table.dart';

// ignore_for_file: type=lint
class $DevicesTable extends Devices with TableInfo<$DevicesTable, DeviceData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DevicesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: false);
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
  static const VerificationMeta _versionMeta =
      const VerificationMeta('version');
  @override
  late final GeneratedColumn<String> version = GeneratedColumn<String>(
      'version', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _createdMeta =
      const VerificationMeta('created');
  @override
  late final GeneratedColumn<DateTime> created = GeneratedColumn<DateTime>(
      'created', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, type, version, created];
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
    if (data.containsKey('version')) {
      context.handle(_versionMeta,
          version.isAcceptableOrUnknown(data['version']!, _versionMeta));
    } else if (isInserting) {
      context.missing(_versionMeta);
    }
    if (data.containsKey('created')) {
      context.handle(_createdMeta,
          created.isAcceptableOrUnknown(data['created']!, _createdMeta));
    } else if (isInserting) {
      context.missing(_createdMeta);
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
      version: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}version'])!,
      created: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created'])!,
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
  final String version;
  final DateTime created;
  const DeviceData(
      {required this.id,
      required this.name,
      required this.type,
      required this.version,
      required this.created});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['type'] = Variable<String>(type);
    map['version'] = Variable<String>(version);
    map['created'] = Variable<DateTime>(created);
    return map;
  }

  DevicesCompanion toCompanion(bool nullToAbsent) {
    return DevicesCompanion(
      id: Value(id),
      name: Value(name),
      type: Value(type),
      version: Value(version),
      created: Value(created),
    );
  }

  factory DeviceData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DeviceData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      type: serializer.fromJson<String>(json['type']),
      version: serializer.fromJson<String>(json['version']),
      created: serializer.fromJson<DateTime>(json['created']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'type': serializer.toJson<String>(type),
      'version': serializer.toJson<String>(version),
      'created': serializer.toJson<DateTime>(created),
    };
  }

  DeviceData copyWith(
          {int? id,
          String? name,
          String? type,
          String? version,
          DateTime? created}) =>
      DeviceData(
        id: id ?? this.id,
        name: name ?? this.name,
        type: type ?? this.type,
        version: version ?? this.version,
        created: created ?? this.created,
      );
  DeviceData copyWithCompanion(DevicesCompanion data) {
    return DeviceData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      type: data.type.present ? data.type.value : this.type,
      version: data.version.present ? data.version.value : this.version,
      created: data.created.present ? data.created.value : this.created,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DeviceData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('version: $version, ')
          ..write('created: $created')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, type, version, created);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DeviceData &&
          other.id == this.id &&
          other.name == this.name &&
          other.type == this.type &&
          other.version == this.version &&
          other.created == this.created);
}

class DevicesCompanion extends UpdateCompanion<DeviceData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> type;
  final Value<String> version;
  final Value<DateTime> created;
  const DevicesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.type = const Value.absent(),
    this.version = const Value.absent(),
    this.created = const Value.absent(),
  });
  DevicesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String type,
    required String version,
    required DateTime created,
  })  : name = Value(name),
        type = Value(type),
        version = Value(version),
        created = Value(created);
  static Insertable<DeviceData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? type,
    Expression<String>? version,
    Expression<DateTime>? created,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (type != null) 'type': type,
      if (version != null) 'version': version,
      if (created != null) 'created': created,
    });
  }

  DevicesCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? type,
      Value<String>? version,
      Value<DateTime>? created}) {
    return DevicesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      version: version ?? this.version,
      created: created ?? this.created,
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
    if (version.present) {
      map['version'] = Variable<String>(version.value);
    }
    if (created.present) {
      map['created'] = Variable<DateTime>(created.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DevicesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('type: $type, ')
          ..write('version: $version, ')
          ..write('created: $created')
          ..write(')'))
        .toString();
  }
}

class $GeigerScoresTable extends GeigerScores
    with TableInfo<$GeigerScoresTable, GeigerScoreData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GeigerScoresTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _scoreIdMeta =
      const VerificationMeta('scoreId');
  @override
  late final GeneratedColumn<DateTime> scoreId = GeneratedColumn<DateTime>(
      'score_id', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _scoreMeta = const VerificationMeta('score');
  @override
  late final GeneratedColumn<int> score = GeneratedColumn<int>(
      'score', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _reasonsMeta =
      const VerificationMeta('reasons');
  @override
  late final GeneratedColumn<String> reasons = GeneratedColumn<String>(
      'reasons', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [scoreId, score, reasons];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'geiger_scores';
  @override
  VerificationContext validateIntegrity(Insertable<GeigerScoreData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('score_id')) {
      context.handle(_scoreIdMeta,
          scoreId.isAcceptableOrUnknown(data['score_id']!, _scoreIdMeta));
    }
    if (data.containsKey('score')) {
      context.handle(
          _scoreMeta, score.isAcceptableOrUnknown(data['score']!, _scoreMeta));
    } else if (isInserting) {
      context.missing(_scoreMeta);
    }
    if (data.containsKey('reasons')) {
      context.handle(_reasonsMeta,
          reasons.isAcceptableOrUnknown(data['reasons']!, _reasonsMeta));
    } else if (isInserting) {
      context.missing(_reasonsMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {scoreId};
  @override
  GeigerScoreData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GeigerScoreData(
      scoreId: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}score_id'])!,
      score: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}score'])!,
      reasons: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}reasons'])!,
    );
  }

  @override
  $GeigerScoresTable createAlias(String alias) {
    return $GeigerScoresTable(attachedDatabase, alias);
  }
}

class GeigerScoreData extends DataClass implements Insertable<GeigerScoreData> {
  final DateTime scoreId;
  final int score;
  final String reasons;
  const GeigerScoreData(
      {required this.scoreId, required this.score, required this.reasons});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['score_id'] = Variable<DateTime>(scoreId);
    map['score'] = Variable<int>(score);
    map['reasons'] = Variable<String>(reasons);
    return map;
  }

  GeigerScoresCompanion toCompanion(bool nullToAbsent) {
    return GeigerScoresCompanion(
      scoreId: Value(scoreId),
      score: Value(score),
      reasons: Value(reasons),
    );
  }

  factory GeigerScoreData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GeigerScoreData(
      scoreId: serializer.fromJson<DateTime>(json['scoreId']),
      score: serializer.fromJson<int>(json['score']),
      reasons: serializer.fromJson<String>(json['reasons']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'scoreId': serializer.toJson<DateTime>(scoreId),
      'score': serializer.toJson<int>(score),
      'reasons': serializer.toJson<String>(reasons),
    };
  }

  GeigerScoreData copyWith({DateTime? scoreId, int? score, String? reasons}) =>
      GeigerScoreData(
        scoreId: scoreId ?? this.scoreId,
        score: score ?? this.score,
        reasons: reasons ?? this.reasons,
      );
  GeigerScoreData copyWithCompanion(GeigerScoresCompanion data) {
    return GeigerScoreData(
      scoreId: data.scoreId.present ? data.scoreId.value : this.scoreId,
      score: data.score.present ? data.score.value : this.score,
      reasons: data.reasons.present ? data.reasons.value : this.reasons,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GeigerScoreData(')
          ..write('scoreId: $scoreId, ')
          ..write('score: $score, ')
          ..write('reasons: $reasons')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(scoreId, score, reasons);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GeigerScoreData &&
          other.scoreId == this.scoreId &&
          other.score == this.score &&
          other.reasons == this.reasons);
}

class GeigerScoresCompanion extends UpdateCompanion<GeigerScoreData> {
  final Value<DateTime> scoreId;
  final Value<int> score;
  final Value<String> reasons;
  final Value<int> rowid;
  const GeigerScoresCompanion({
    this.scoreId = const Value.absent(),
    this.score = const Value.absent(),
    this.reasons = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GeigerScoresCompanion.insert({
    this.scoreId = const Value.absent(),
    required int score,
    required String reasons,
    this.rowid = const Value.absent(),
  })  : score = Value(score),
        reasons = Value(reasons);
  static Insertable<GeigerScoreData> custom({
    Expression<DateTime>? scoreId,
    Expression<int>? score,
    Expression<String>? reasons,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (scoreId != null) 'score_id': scoreId,
      if (score != null) 'score': score,
      if (reasons != null) 'reasons': reasons,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GeigerScoresCompanion copyWith(
      {Value<DateTime>? scoreId,
      Value<int>? score,
      Value<String>? reasons,
      Value<int>? rowid}) {
    return GeigerScoresCompanion(
      scoreId: scoreId ?? this.scoreId,
      score: score ?? this.score,
      reasons: reasons ?? this.reasons,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (scoreId.present) {
      map['score_id'] = Variable<DateTime>(scoreId.value);
    }
    if (score.present) {
      map['score'] = Variable<int>(score.value);
    }
    if (reasons.present) {
      map['reasons'] = Variable<String>(reasons.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GeigerScoresCompanion(')
          ..write('scoreId: $scoreId, ')
          ..write('score: $score, ')
          ..write('reasons: $reasons, ')
          ..write('rowid: $rowid')
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
  late final GeneratedColumn<String> deviceId = GeneratedColumn<String>(
      'device_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES devices (id)'));
  static const VerificationMeta _scoreIdMeta =
      const VerificationMeta('scoreId');
  @override
  late final GeneratedColumn<DateTime> scoreId = GeneratedColumn<DateTime>(
      'score_id', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES geiger_scores (score_id)'));
  static const VerificationMeta _lastUpdatedMeta =
      const VerificationMeta('lastUpdated');
  @override
  late final GeneratedColumn<DateTime> lastUpdated = GeneratedColumn<DateTime>(
      'last_updated', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [deviceId, scoreId, lastUpdated];
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
    if (data.containsKey('score_id')) {
      context.handle(_scoreIdMeta,
          scoreId.isAcceptableOrUnknown(data['score_id']!, _scoreIdMeta));
    } else if (isInserting) {
      context.missing(_scoreIdMeta);
    }
    if (data.containsKey('last_updated')) {
      context.handle(
          _lastUpdatedMeta,
          lastUpdated.isAcceptableOrUnknown(
              data['last_updated']!, _lastUpdatedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {deviceId, scoreId};
  @override
  DeviceScoreData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DeviceScoreData(
      deviceId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}device_id'])!,
      scoreId: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}score_id'])!,
      lastUpdated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_updated'])!,
    );
  }

  @override
  $DeviceScoresTable createAlias(String alias) {
    return $DeviceScoresTable(attachedDatabase, alias);
  }
}

class DeviceScoreData extends DataClass implements Insertable<DeviceScoreData> {
  final String deviceId;
  final DateTime scoreId;
  final DateTime lastUpdated;
  const DeviceScoreData(
      {required this.deviceId,
      required this.scoreId,
      required this.lastUpdated});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['device_id'] = Variable<String>(deviceId);
    map['score_id'] = Variable<DateTime>(scoreId);
    map['last_updated'] = Variable<DateTime>(lastUpdated);
    return map;
  }

  DeviceScoresCompanion toCompanion(bool nullToAbsent) {
    return DeviceScoresCompanion(
      deviceId: Value(deviceId),
      scoreId: Value(scoreId),
      lastUpdated: Value(lastUpdated),
    );
  }

  factory DeviceScoreData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DeviceScoreData(
      deviceId: serializer.fromJson<String>(json['deviceId']),
      scoreId: serializer.fromJson<DateTime>(json['scoreId']),
      lastUpdated: serializer.fromJson<DateTime>(json['lastUpdated']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'deviceId': serializer.toJson<String>(deviceId),
      'scoreId': serializer.toJson<DateTime>(scoreId),
      'lastUpdated': serializer.toJson<DateTime>(lastUpdated),
    };
  }

  DeviceScoreData copyWith(
          {String? deviceId, DateTime? scoreId, DateTime? lastUpdated}) =>
      DeviceScoreData(
        deviceId: deviceId ?? this.deviceId,
        scoreId: scoreId ?? this.scoreId,
        lastUpdated: lastUpdated ?? this.lastUpdated,
      );
  DeviceScoreData copyWithCompanion(DeviceScoresCompanion data) {
    return DeviceScoreData(
      deviceId: data.deviceId.present ? data.deviceId.value : this.deviceId,
      scoreId: data.scoreId.present ? data.scoreId.value : this.scoreId,
      lastUpdated:
          data.lastUpdated.present ? data.lastUpdated.value : this.lastUpdated,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DeviceScoreData(')
          ..write('deviceId: $deviceId, ')
          ..write('scoreId: $scoreId, ')
          ..write('lastUpdated: $lastUpdated')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(deviceId, scoreId, lastUpdated);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DeviceScoreData &&
          other.deviceId == this.deviceId &&
          other.scoreId == this.scoreId &&
          other.lastUpdated == this.lastUpdated);
}

class DeviceScoresCompanion extends UpdateCompanion<DeviceScoreData> {
  final Value<String> deviceId;
  final Value<DateTime> scoreId;
  final Value<DateTime> lastUpdated;
  final Value<int> rowid;
  const DeviceScoresCompanion({
    this.deviceId = const Value.absent(),
    this.scoreId = const Value.absent(),
    this.lastUpdated = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DeviceScoresCompanion.insert({
    required String deviceId,
    required DateTime scoreId,
    this.lastUpdated = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : deviceId = Value(deviceId),
        scoreId = Value(scoreId);
  static Insertable<DeviceScoreData> custom({
    Expression<String>? deviceId,
    Expression<DateTime>? scoreId,
    Expression<DateTime>? lastUpdated,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (deviceId != null) 'device_id': deviceId,
      if (scoreId != null) 'score_id': scoreId,
      if (lastUpdated != null) 'last_updated': lastUpdated,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DeviceScoresCompanion copyWith(
      {Value<String>? deviceId,
      Value<DateTime>? scoreId,
      Value<DateTime>? lastUpdated,
      Value<int>? rowid}) {
    return DeviceScoresCompanion(
      deviceId: deviceId ?? this.deviceId,
      scoreId: scoreId ?? this.scoreId,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (deviceId.present) {
      map['device_id'] = Variable<String>(deviceId.value);
    }
    if (scoreId.present) {
      map['score_id'] = Variable<DateTime>(scoreId.value);
    }
    if (lastUpdated.present) {
      map['last_updated'] = Variable<DateTime>(lastUpdated.value);
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
          ..write('scoreId: $scoreId, ')
          ..write('lastUpdated: $lastUpdated, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $UserProfilesTable extends UserProfiles
    with TableInfo<$UserProfilesTable, UserProfileData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserProfilesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _companyNameMeta =
      const VerificationMeta('companyName');
  @override
  late final GeneratedColumn<String> companyName = GeneratedColumn<String>(
      'company_name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _locationMeta =
      const VerificationMeta('location');
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
      'location', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _deviceScoreIdMeta =
      const VerificationMeta('deviceScoreId');
  @override
  late final GeneratedColumn<int> deviceScoreId = GeneratedColumn<int>(
      'device_score_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES device_scores (device_id)'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, companyName, location, description, deviceScoreId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_profiles';
  @override
  VerificationContext validateIntegrity(Insertable<UserProfileData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('company_name')) {
      context.handle(
          _companyNameMeta,
          companyName.isAcceptableOrUnknown(
              data['company_name']!, _companyNameMeta));
    } else if (isInserting) {
      context.missing(_companyNameMeta);
    }
    if (data.containsKey('location')) {
      context.handle(_locationMeta,
          location.isAcceptableOrUnknown(data['location']!, _locationMeta));
    } else if (isInserting) {
      context.missing(_locationMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('device_score_id')) {
      context.handle(
          _deviceScoreIdMeta,
          deviceScoreId.isAcceptableOrUnknown(
              data['device_score_id']!, _deviceScoreIdMeta));
    } else if (isInserting) {
      context.missing(_deviceScoreIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  UserProfileData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserProfileData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      companyName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}company_name'])!,
      location: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}location'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      deviceScoreId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}device_score_id'])!,
    );
  }

  @override
  $UserProfilesTable createAlias(String alias) {
    return $UserProfilesTable(attachedDatabase, alias);
  }
}

class UserProfileData extends DataClass implements Insertable<UserProfileData> {
  final int id;
  final String companyName;
  final String location;
  final String description;
  final int deviceScoreId;
  const UserProfileData(
      {required this.id,
      required this.companyName,
      required this.location,
      required this.description,
      required this.deviceScoreId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['company_name'] = Variable<String>(companyName);
    map['location'] = Variable<String>(location);
    map['description'] = Variable<String>(description);
    map['device_score_id'] = Variable<int>(deviceScoreId);
    return map;
  }

  UserProfilesCompanion toCompanion(bool nullToAbsent) {
    return UserProfilesCompanion(
      id: Value(id),
      companyName: Value(companyName),
      location: Value(location),
      description: Value(description),
      deviceScoreId: Value(deviceScoreId),
    );
  }

  factory UserProfileData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserProfileData(
      id: serializer.fromJson<int>(json['id']),
      companyName: serializer.fromJson<String>(json['companyName']),
      location: serializer.fromJson<String>(json['location']),
      description: serializer.fromJson<String>(json['description']),
      deviceScoreId: serializer.fromJson<int>(json['deviceScoreId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'companyName': serializer.toJson<String>(companyName),
      'location': serializer.toJson<String>(location),
      'description': serializer.toJson<String>(description),
      'deviceScoreId': serializer.toJson<int>(deviceScoreId),
    };
  }

  UserProfileData copyWith(
          {int? id,
          String? companyName,
          String? location,
          String? description,
          int? deviceScoreId}) =>
      UserProfileData(
        id: id ?? this.id,
        companyName: companyName ?? this.companyName,
        location: location ?? this.location,
        description: description ?? this.description,
        deviceScoreId: deviceScoreId ?? this.deviceScoreId,
      );
  UserProfileData copyWithCompanion(UserProfilesCompanion data) {
    return UserProfileData(
      id: data.id.present ? data.id.value : this.id,
      companyName:
          data.companyName.present ? data.companyName.value : this.companyName,
      location: data.location.present ? data.location.value : this.location,
      description:
          data.description.present ? data.description.value : this.description,
      deviceScoreId: data.deviceScoreId.present
          ? data.deviceScoreId.value
          : this.deviceScoreId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserProfileData(')
          ..write('id: $id, ')
          ..write('companyName: $companyName, ')
          ..write('location: $location, ')
          ..write('description: $description, ')
          ..write('deviceScoreId: $deviceScoreId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, companyName, location, description, deviceScoreId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserProfileData &&
          other.id == this.id &&
          other.companyName == this.companyName &&
          other.location == this.location &&
          other.description == this.description &&
          other.deviceScoreId == this.deviceScoreId);
}

class UserProfilesCompanion extends UpdateCompanion<UserProfileData> {
  final Value<int> id;
  final Value<String> companyName;
  final Value<String> location;
  final Value<String> description;
  final Value<int> deviceScoreId;
  final Value<int> rowid;
  const UserProfilesCompanion({
    this.id = const Value.absent(),
    this.companyName = const Value.absent(),
    this.location = const Value.absent(),
    this.description = const Value.absent(),
    this.deviceScoreId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserProfilesCompanion.insert({
    required int id,
    required String companyName,
    required String location,
    required String description,
    required int deviceScoreId,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        companyName = Value(companyName),
        location = Value(location),
        description = Value(description),
        deviceScoreId = Value(deviceScoreId);
  static Insertable<UserProfileData> custom({
    Expression<int>? id,
    Expression<String>? companyName,
    Expression<String>? location,
    Expression<String>? description,
    Expression<int>? deviceScoreId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (companyName != null) 'company_name': companyName,
      if (location != null) 'location': location,
      if (description != null) 'description': description,
      if (deviceScoreId != null) 'device_score_id': deviceScoreId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserProfilesCompanion copyWith(
      {Value<int>? id,
      Value<String>? companyName,
      Value<String>? location,
      Value<String>? description,
      Value<int>? deviceScoreId,
      Value<int>? rowid}) {
    return UserProfilesCompanion(
      id: id ?? this.id,
      companyName: companyName ?? this.companyName,
      location: location ?? this.location,
      description: description ?? this.description,
      deviceScoreId: deviceScoreId ?? this.deviceScoreId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (companyName.present) {
      map['company_name'] = Variable<String>(companyName.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (deviceScoreId.present) {
      map['device_score_id'] = Variable<int>(deviceScoreId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserProfilesCompanion(')
          ..write('id: $id, ')
          ..write('companyName: $companyName, ')
          ..write('location: $location, ')
          ..write('description: $description, ')
          ..write('deviceScoreId: $deviceScoreId, ')
          ..write('rowid: $rowid')
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

class $TodoOfferingStatusesTable extends TodoOfferingStatuses
    with TableInfo<$TodoOfferingStatusesTable, TodoOfferingStatusData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TodoOfferingStatusesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _offeringIdMeta =
      const VerificationMeta('offeringId');
  @override
  late final GeneratedColumn<String> offeringId = GeneratedColumn<String>(
      'offering_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES offerings (id)'));
  static const VerificationMeta _addedMeta = const VerificationMeta('added');
  @override
  late final GeneratedColumn<bool> added = GeneratedColumn<bool>(
      'added', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("added" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [offeringId, added];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'todo_offering_statuses';
  @override
  VerificationContext validateIntegrity(
      Insertable<TodoOfferingStatusData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('offering_id')) {
      context.handle(
          _offeringIdMeta,
          offeringId.isAcceptableOrUnknown(
              data['offering_id']!, _offeringIdMeta));
    } else if (isInserting) {
      context.missing(_offeringIdMeta);
    }
    if (data.containsKey('added')) {
      context.handle(
          _addedMeta, added.isAcceptableOrUnknown(data['added']!, _addedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {offeringId};
  @override
  TodoOfferingStatusData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TodoOfferingStatusData(
      offeringId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}offering_id'])!,
      added: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}added'])!,
    );
  }

  @override
  $TodoOfferingStatusesTable createAlias(String alias) {
    return $TodoOfferingStatusesTable(attachedDatabase, alias);
  }
}

class TodoOfferingStatusData extends DataClass
    implements Insertable<TodoOfferingStatusData> {
  final String offeringId;
  final bool added;
  const TodoOfferingStatusData({required this.offeringId, required this.added});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['offering_id'] = Variable<String>(offeringId);
    map['added'] = Variable<bool>(added);
    return map;
  }

  TodoOfferingStatusesCompanion toCompanion(bool nullToAbsent) {
    return TodoOfferingStatusesCompanion(
      offeringId: Value(offeringId),
      added: Value(added),
    );
  }

  factory TodoOfferingStatusData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TodoOfferingStatusData(
      offeringId: serializer.fromJson<String>(json['offeringId']),
      added: serializer.fromJson<bool>(json['added']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'offeringId': serializer.toJson<String>(offeringId),
      'added': serializer.toJson<bool>(added),
    };
  }

  TodoOfferingStatusData copyWith({String? offeringId, bool? added}) =>
      TodoOfferingStatusData(
        offeringId: offeringId ?? this.offeringId,
        added: added ?? this.added,
      );
  TodoOfferingStatusData copyWithCompanion(TodoOfferingStatusesCompanion data) {
    return TodoOfferingStatusData(
      offeringId:
          data.offeringId.present ? data.offeringId.value : this.offeringId,
      added: data.added.present ? data.added.value : this.added,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TodoOfferingStatusData(')
          ..write('offeringId: $offeringId, ')
          ..write('added: $added')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(offeringId, added);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TodoOfferingStatusData &&
          other.offeringId == this.offeringId &&
          other.added == this.added);
}

class TodoOfferingStatusesCompanion
    extends UpdateCompanion<TodoOfferingStatusData> {
  final Value<String> offeringId;
  final Value<bool> added;
  final Value<int> rowid;
  const TodoOfferingStatusesCompanion({
    this.offeringId = const Value.absent(),
    this.added = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TodoOfferingStatusesCompanion.insert({
    required String offeringId,
    this.added = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : offeringId = Value(offeringId);
  static Insertable<TodoOfferingStatusData> custom({
    Expression<String>? offeringId,
    Expression<bool>? added,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (offeringId != null) 'offering_id': offeringId,
      if (added != null) 'added': added,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TodoOfferingStatusesCompanion copyWith(
      {Value<String>? offeringId, Value<bool>? added, Value<int>? rowid}) {
    return TodoOfferingStatusesCompanion(
      offeringId: offeringId ?? this.offeringId,
      added: added ?? this.added,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (offeringId.present) {
      map['offering_id'] = Variable<String>(offeringId.value);
    }
    if (added.present) {
      map['added'] = Variable<bool>(added.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TodoOfferingStatusesCompanion(')
          ..write('offeringId: $offeringId, ')
          ..write('added: $added, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $DevicesTable devices = $DevicesTable(this);
  late final $GeigerScoresTable geigerScores = $GeigerScoresTable(this);
  late final $DeviceScoresTable deviceScores = $DeviceScoresTable(this);
  late final $UserProfilesTable userProfiles = $UserProfilesTable(this);
  late final $NewsInfoTable newsInfo = $NewsInfoTable(this);
  late final $RecommendationsTable recommendations =
      $RecommendationsTable(this);
  late final $OfferingsTable offerings = $OfferingsTable(this);
  late final $TodoOfferingStatusesTable todoOfferingStatuses =
      $TodoOfferingStatusesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        devices,
        geigerScores,
        deviceScores,
        userProfiles,
        newsInfo,
        recommendations,
        offerings,
        todoOfferingStatuses
      ];
}

typedef $$DevicesTableCreateCompanionBuilder = DevicesCompanion Function({
  Value<int> id,
  required String name,
  required String type,
  required String version,
  required DateTime created,
});
typedef $$DevicesTableUpdateCompanionBuilder = DevicesCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<String> type,
  Value<String> version,
  Value<DateTime> created,
});

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

  ColumnFilters<String> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get created => $composableBuilder(
      column: $table.created, builder: (column) => ColumnFilters(column));
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

  ColumnOrderings<String> get version => $composableBuilder(
      column: $table.version, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get created => $composableBuilder(
      column: $table.created, builder: (column) => ColumnOrderings(column));
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

  GeneratedColumn<String> get version =>
      $composableBuilder(column: $table.version, builder: (column) => column);

  GeneratedColumn<DateTime> get created =>
      $composableBuilder(column: $table.created, builder: (column) => column);
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
    (DeviceData, BaseReferences<_$AppDatabase, $DevicesTable, DeviceData>),
    DeviceData,
    PrefetchHooks Function()> {
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
            Value<String> version = const Value.absent(),
            Value<DateTime> created = const Value.absent(),
          }) =>
              DevicesCompanion(
            id: id,
            name: name,
            type: type,
            version: version,
            created: created,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            required String type,
            required String version,
            required DateTime created,
          }) =>
              DevicesCompanion.insert(
            id: id,
            name: name,
            type: type,
            version: version,
            created: created,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
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
    (DeviceData, BaseReferences<_$AppDatabase, $DevicesTable, DeviceData>),
    DeviceData,
    PrefetchHooks Function()>;
typedef $$GeigerScoresTableCreateCompanionBuilder = GeigerScoresCompanion
    Function({
  Value<DateTime> scoreId,
  required int score,
  required String reasons,
  Value<int> rowid,
});
typedef $$GeigerScoresTableUpdateCompanionBuilder = GeigerScoresCompanion
    Function({
  Value<DateTime> scoreId,
  Value<int> score,
  Value<String> reasons,
  Value<int> rowid,
});

final class $$GeigerScoresTableReferences
    extends BaseReferences<_$AppDatabase, $GeigerScoresTable, GeigerScoreData> {
  $$GeigerScoresTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$DeviceScoresTable, List<DeviceScoreData>>
      _deviceScoresRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.deviceScores,
              aliasName: $_aliasNameGenerator(
                  db.geigerScores.scoreId, db.deviceScores.scoreId));

  $$DeviceScoresTableProcessedTableManager get deviceScoresRefs {
    final manager = $$DeviceScoresTableTableManager($_db, $_db.deviceScores)
        .filter((f) => f.scoreId.scoreId($_item.scoreId));

    final cache = $_typedResult.readTableOrNull(_deviceScoresRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$GeigerScoresTableFilterComposer
    extends Composer<_$AppDatabase, $GeigerScoresTable> {
  $$GeigerScoresTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<DateTime> get scoreId => $composableBuilder(
      column: $table.scoreId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get score => $composableBuilder(
      column: $table.score, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get reasons => $composableBuilder(
      column: $table.reasons, builder: (column) => ColumnFilters(column));

  Expression<bool> deviceScoresRefs(
      Expression<bool> Function($$DeviceScoresTableFilterComposer f) f) {
    final $$DeviceScoresTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.scoreId,
        referencedTable: $db.deviceScores,
        getReferencedColumn: (t) => t.scoreId,
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
}

class $$GeigerScoresTableOrderingComposer
    extends Composer<_$AppDatabase, $GeigerScoresTable> {
  $$GeigerScoresTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<DateTime> get scoreId => $composableBuilder(
      column: $table.scoreId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get score => $composableBuilder(
      column: $table.score, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get reasons => $composableBuilder(
      column: $table.reasons, builder: (column) => ColumnOrderings(column));
}

class $$GeigerScoresTableAnnotationComposer
    extends Composer<_$AppDatabase, $GeigerScoresTable> {
  $$GeigerScoresTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<DateTime> get scoreId =>
      $composableBuilder(column: $table.scoreId, builder: (column) => column);

  GeneratedColumn<int> get score =>
      $composableBuilder(column: $table.score, builder: (column) => column);

  GeneratedColumn<String> get reasons =>
      $composableBuilder(column: $table.reasons, builder: (column) => column);

  Expression<T> deviceScoresRefs<T extends Object>(
      Expression<T> Function($$DeviceScoresTableAnnotationComposer a) f) {
    final $$DeviceScoresTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.scoreId,
        referencedTable: $db.deviceScores,
        getReferencedColumn: (t) => t.scoreId,
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
}

class $$GeigerScoresTableTableManager extends RootTableManager<
    _$AppDatabase,
    $GeigerScoresTable,
    GeigerScoreData,
    $$GeigerScoresTableFilterComposer,
    $$GeigerScoresTableOrderingComposer,
    $$GeigerScoresTableAnnotationComposer,
    $$GeigerScoresTableCreateCompanionBuilder,
    $$GeigerScoresTableUpdateCompanionBuilder,
    (GeigerScoreData, $$GeigerScoresTableReferences),
    GeigerScoreData,
    PrefetchHooks Function({bool deviceScoresRefs})> {
  $$GeigerScoresTableTableManager(_$AppDatabase db, $GeigerScoresTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GeigerScoresTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GeigerScoresTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GeigerScoresTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<DateTime> scoreId = const Value.absent(),
            Value<int> score = const Value.absent(),
            Value<String> reasons = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              GeigerScoresCompanion(
            scoreId: scoreId,
            score: score,
            reasons: reasons,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            Value<DateTime> scoreId = const Value.absent(),
            required int score,
            required String reasons,
            Value<int> rowid = const Value.absent(),
          }) =>
              GeigerScoresCompanion.insert(
            scoreId: scoreId,
            score: score,
            reasons: reasons,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$GeigerScoresTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({deviceScoresRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (deviceScoresRefs) db.deviceScores],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (deviceScoresRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$GeigerScoresTableReferences
                            ._deviceScoresRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$GeigerScoresTableReferences(db, table, p0)
                                .deviceScoresRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.scoreId == item.scoreId),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$GeigerScoresTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $GeigerScoresTable,
    GeigerScoreData,
    $$GeigerScoresTableFilterComposer,
    $$GeigerScoresTableOrderingComposer,
    $$GeigerScoresTableAnnotationComposer,
    $$GeigerScoresTableCreateCompanionBuilder,
    $$GeigerScoresTableUpdateCompanionBuilder,
    (GeigerScoreData, $$GeigerScoresTableReferences),
    GeigerScoreData,
    PrefetchHooks Function({bool deviceScoresRefs})>;
typedef $$DeviceScoresTableCreateCompanionBuilder = DeviceScoresCompanion
    Function({
  required String deviceId,
  required DateTime scoreId,
  Value<DateTime> lastUpdated,
  Value<int> rowid,
});
typedef $$DeviceScoresTableUpdateCompanionBuilder = DeviceScoresCompanion
    Function({
  Value<String> deviceId,
  Value<DateTime> scoreId,
  Value<DateTime> lastUpdated,
  Value<int> rowid,
});

final class $$DeviceScoresTableReferences
    extends BaseReferences<_$AppDatabase, $DeviceScoresTable, DeviceScoreData> {
  $$DeviceScoresTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $GeigerScoresTable _scoreIdTable(_$AppDatabase db) =>
      db.geigerScores.createAlias($_aliasNameGenerator(
          db.deviceScores.scoreId, db.geigerScores.scoreId));

  $$GeigerScoresTableProcessedTableManager? get scoreId {
    if ($_item.scoreId == null) return null;
    final manager = $$GeigerScoresTableTableManager($_db, $_db.geigerScores)
        .filter((f) => f.scoreId($_item.scoreId!));
    final item = $_typedResult.readTableOrNull(_scoreIdTable($_db));
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
  ColumnFilters<DateTime> get lastUpdated => $composableBuilder(
      column: $table.lastUpdated, builder: (column) => ColumnFilters(column));

  $$GeigerScoresTableFilterComposer get scoreId {
    final $$GeigerScoresTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.scoreId,
        referencedTable: $db.geigerScores,
        getReferencedColumn: (t) => t.scoreId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GeigerScoresTableFilterComposer(
              $db: $db,
              $table: $db.geigerScores,
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
  ColumnOrderings<DateTime> get lastUpdated => $composableBuilder(
      column: $table.lastUpdated, builder: (column) => ColumnOrderings(column));

  $$GeigerScoresTableOrderingComposer get scoreId {
    final $$GeigerScoresTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.scoreId,
        referencedTable: $db.geigerScores,
        getReferencedColumn: (t) => t.scoreId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GeigerScoresTableOrderingComposer(
              $db: $db,
              $table: $db.geigerScores,
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
  GeneratedColumn<DateTime> get lastUpdated => $composableBuilder(
      column: $table.lastUpdated, builder: (column) => column);

  $$GeigerScoresTableAnnotationComposer get scoreId {
    final $$GeigerScoresTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.scoreId,
        referencedTable: $db.geigerScores,
        getReferencedColumn: (t) => t.scoreId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$GeigerScoresTableAnnotationComposer(
              $db: $db,
              $table: $db.geigerScores,
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
    PrefetchHooks Function({bool scoreId})> {
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
            Value<String> deviceId = const Value.absent(),
            Value<DateTime> scoreId = const Value.absent(),
            Value<DateTime> lastUpdated = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DeviceScoresCompanion(
            deviceId: deviceId,
            scoreId: scoreId,
            lastUpdated: lastUpdated,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String deviceId,
            required DateTime scoreId,
            Value<DateTime> lastUpdated = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DeviceScoresCompanion.insert(
            deviceId: deviceId,
            scoreId: scoreId,
            lastUpdated: lastUpdated,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$DeviceScoresTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({scoreId = false}) {
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
                if (scoreId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.scoreId,
                    referencedTable:
                        $$DeviceScoresTableReferences._scoreIdTable(db),
                    referencedColumn:
                        $$DeviceScoresTableReferences._scoreIdTable(db).scoreId,
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
    PrefetchHooks Function({bool scoreId})>;
typedef $$UserProfilesTableCreateCompanionBuilder = UserProfilesCompanion
    Function({
  required int id,
  required String companyName,
  required String location,
  required String description,
  required int deviceScoreId,
  Value<int> rowid,
});
typedef $$UserProfilesTableUpdateCompanionBuilder = UserProfilesCompanion
    Function({
  Value<int> id,
  Value<String> companyName,
  Value<String> location,
  Value<String> description,
  Value<int> deviceScoreId,
  Value<int> rowid,
});

class $$UserProfilesTableFilterComposer
    extends Composer<_$AppDatabase, $UserProfilesTable> {
  $$UserProfilesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get companyName => $composableBuilder(
      column: $table.companyName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get location => $composableBuilder(
      column: $table.location, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));
}

class $$UserProfilesTableOrderingComposer
    extends Composer<_$AppDatabase, $UserProfilesTable> {
  $$UserProfilesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get companyName => $composableBuilder(
      column: $table.companyName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get location => $composableBuilder(
      column: $table.location, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));
}

class $$UserProfilesTableAnnotationComposer
    extends Composer<_$AppDatabase, $UserProfilesTable> {
  $$UserProfilesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get companyName => $composableBuilder(
      column: $table.companyName, builder: (column) => column);

  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);
}

class $$UserProfilesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $UserProfilesTable,
    UserProfileData,
    $$UserProfilesTableFilterComposer,
    $$UserProfilesTableOrderingComposer,
    $$UserProfilesTableAnnotationComposer,
    $$UserProfilesTableCreateCompanionBuilder,
    $$UserProfilesTableUpdateCompanionBuilder,
    (
      UserProfileData,
      BaseReferences<_$AppDatabase, $UserProfilesTable, UserProfileData>
    ),
    UserProfileData,
    PrefetchHooks Function()> {
  $$UserProfilesTableTableManager(_$AppDatabase db, $UserProfilesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UserProfilesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UserProfilesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UserProfilesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> companyName = const Value.absent(),
            Value<String> location = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<int> deviceScoreId = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              UserProfilesCompanion(
            id: id,
            companyName: companyName,
            location: location,
            description: description,
            deviceScoreId: deviceScoreId,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required int id,
            required String companyName,
            required String location,
            required String description,
            required int deviceScoreId,
            Value<int> rowid = const Value.absent(),
          }) =>
              UserProfilesCompanion.insert(
            id: id,
            companyName: companyName,
            location: location,
            description: description,
            deviceScoreId: deviceScoreId,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$UserProfilesTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $UserProfilesTable,
    UserProfileData,
    $$UserProfilesTableFilterComposer,
    $$UserProfilesTableOrderingComposer,
    $$UserProfilesTableAnnotationComposer,
    $$UserProfilesTableCreateCompanionBuilder,
    $$UserProfilesTableUpdateCompanionBuilder,
    (
      UserProfileData,
      BaseReferences<_$AppDatabase, $UserProfilesTable, UserProfileData>
    ),
    UserProfileData,
    PrefetchHooks Function()>;
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
    PrefetchHooks Function({bool newsId, bool offeringsRefs})> {
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
          prefetchHooksCallback: ({newsId = false, offeringsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (offeringsRefs) db.offerings],
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
    PrefetchHooks Function({bool newsId, bool offeringsRefs})>;
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

  static MultiTypedResultKey<$TodoOfferingStatusesTable,
      List<TodoOfferingStatusData>> _todoOfferingStatusesRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.todoOfferingStatuses,
          aliasName: $_aliasNameGenerator(
              db.offerings.id, db.todoOfferingStatuses.offeringId));

  $$TodoOfferingStatusesTableProcessedTableManager
      get todoOfferingStatusesRefs {
    final manager =
        $$TodoOfferingStatusesTableTableManager($_db, $_db.todoOfferingStatuses)
            .filter((f) => f.offeringId.id($_item.id));

    final cache =
        $_typedResult.readTableOrNull(_todoOfferingStatusesRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
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

  Expression<bool> todoOfferingStatusesRefs(
      Expression<bool> Function($$TodoOfferingStatusesTableFilterComposer f)
          f) {
    final $$TodoOfferingStatusesTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.todoOfferingStatuses,
        getReferencedColumn: (t) => t.offeringId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$TodoOfferingStatusesTableFilterComposer(
              $db: $db,
              $table: $db.todoOfferingStatuses,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
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

  Expression<T> todoOfferingStatusesRefs<T extends Object>(
      Expression<T> Function($$TodoOfferingStatusesTableAnnotationComposer a)
          f) {
    final $$TodoOfferingStatusesTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.todoOfferingStatuses,
            getReferencedColumn: (t) => t.offeringId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$TodoOfferingStatusesTableAnnotationComposer(
                  $db: $db,
                  $table: $db.todoOfferingStatuses,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
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
    PrefetchHooks Function(
        {bool recommendationId, bool todoOfferingStatusesRefs})> {
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
          prefetchHooksCallback: (
              {recommendationId = false, todoOfferingStatusesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (todoOfferingStatusesRefs) db.todoOfferingStatuses
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
                return [
                  if (todoOfferingStatusesRefs)
                    await $_getPrefetchedData(
                        currentTable: table,
                        referencedTable: $$OfferingsTableReferences
                            ._todoOfferingStatusesRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$OfferingsTableReferences(db, table, p0)
                                .todoOfferingStatusesRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.offeringId == item.id),
                        typedResults: items)
                ];
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
    PrefetchHooks Function(
        {bool recommendationId, bool todoOfferingStatusesRefs})>;
typedef $$TodoOfferingStatusesTableCreateCompanionBuilder
    = TodoOfferingStatusesCompanion Function({
  required String offeringId,
  Value<bool> added,
  Value<int> rowid,
});
typedef $$TodoOfferingStatusesTableUpdateCompanionBuilder
    = TodoOfferingStatusesCompanion Function({
  Value<String> offeringId,
  Value<bool> added,
  Value<int> rowid,
});

final class $$TodoOfferingStatusesTableReferences extends BaseReferences<
    _$AppDatabase, $TodoOfferingStatusesTable, TodoOfferingStatusData> {
  $$TodoOfferingStatusesTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $OfferingsTable _offeringIdTable(_$AppDatabase db) =>
      db.offerings.createAlias($_aliasNameGenerator(
          db.todoOfferingStatuses.offeringId, db.offerings.id));

  $$OfferingsTableProcessedTableManager? get offeringId {
    if ($_item.offeringId == null) return null;
    final manager = $$OfferingsTableTableManager($_db, $_db.offerings)
        .filter((f) => f.id($_item.offeringId!));
    final item = $_typedResult.readTableOrNull(_offeringIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$TodoOfferingStatusesTableFilterComposer
    extends Composer<_$AppDatabase, $TodoOfferingStatusesTable> {
  $$TodoOfferingStatusesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<bool> get added => $composableBuilder(
      column: $table.added, builder: (column) => ColumnFilters(column));

  $$OfferingsTableFilterComposer get offeringId {
    final $$OfferingsTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.offeringId,
        referencedTable: $db.offerings,
        getReferencedColumn: (t) => t.id,
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
    return composer;
  }
}

class $$TodoOfferingStatusesTableOrderingComposer
    extends Composer<_$AppDatabase, $TodoOfferingStatusesTable> {
  $$TodoOfferingStatusesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<bool> get added => $composableBuilder(
      column: $table.added, builder: (column) => ColumnOrderings(column));

  $$OfferingsTableOrderingComposer get offeringId {
    final $$OfferingsTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.offeringId,
        referencedTable: $db.offerings,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$OfferingsTableOrderingComposer(
              $db: $db,
              $table: $db.offerings,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$TodoOfferingStatusesTableAnnotationComposer
    extends Composer<_$AppDatabase, $TodoOfferingStatusesTable> {
  $$TodoOfferingStatusesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<bool> get added =>
      $composableBuilder(column: $table.added, builder: (column) => column);

  $$OfferingsTableAnnotationComposer get offeringId {
    final $$OfferingsTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.offeringId,
        referencedTable: $db.offerings,
        getReferencedColumn: (t) => t.id,
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
    return composer;
  }
}

class $$TodoOfferingStatusesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $TodoOfferingStatusesTable,
    TodoOfferingStatusData,
    $$TodoOfferingStatusesTableFilterComposer,
    $$TodoOfferingStatusesTableOrderingComposer,
    $$TodoOfferingStatusesTableAnnotationComposer,
    $$TodoOfferingStatusesTableCreateCompanionBuilder,
    $$TodoOfferingStatusesTableUpdateCompanionBuilder,
    (TodoOfferingStatusData, $$TodoOfferingStatusesTableReferences),
    TodoOfferingStatusData,
    PrefetchHooks Function({bool offeringId})> {
  $$TodoOfferingStatusesTableTableManager(
      _$AppDatabase db, $TodoOfferingStatusesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$TodoOfferingStatusesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$TodoOfferingStatusesTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$TodoOfferingStatusesTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> offeringId = const Value.absent(),
            Value<bool> added = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TodoOfferingStatusesCompanion(
            offeringId: offeringId,
            added: added,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String offeringId,
            Value<bool> added = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              TodoOfferingStatusesCompanion.insert(
            offeringId: offeringId,
            added: added,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$TodoOfferingStatusesTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({offeringId = false}) {
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
                if (offeringId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.offeringId,
                    referencedTable: $$TodoOfferingStatusesTableReferences
                        ._offeringIdTable(db),
                    referencedColumn: $$TodoOfferingStatusesTableReferences
                        ._offeringIdTable(db)
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

typedef $$TodoOfferingStatusesTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $TodoOfferingStatusesTable,
        TodoOfferingStatusData,
        $$TodoOfferingStatusesTableFilterComposer,
        $$TodoOfferingStatusesTableOrderingComposer,
        $$TodoOfferingStatusesTableAnnotationComposer,
        $$TodoOfferingStatusesTableCreateCompanionBuilder,
        $$TodoOfferingStatusesTableUpdateCompanionBuilder,
        (TodoOfferingStatusData, $$TodoOfferingStatusesTableReferences),
        TodoOfferingStatusData,
        PrefetchHooks Function({bool offeringId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$DevicesTableTableManager get devices =>
      $$DevicesTableTableManager(_db, _db.devices);
  $$GeigerScoresTableTableManager get geigerScores =>
      $$GeigerScoresTableTableManager(_db, _db.geigerScores);
  $$DeviceScoresTableTableManager get deviceScores =>
      $$DeviceScoresTableTableManager(_db, _db.deviceScores);
  $$UserProfilesTableTableManager get userProfiles =>
      $$UserProfilesTableTableManager(_db, _db.userProfiles);
  $$NewsInfoTableTableManager get newsInfo =>
      $$NewsInfoTableTableManager(_db, _db.newsInfo);
  $$RecommendationsTableTableManager get recommendations =>
      $$RecommendationsTableTableManager(_db, _db.recommendations);
  $$OfferingsTableTableManager get offerings =>
      $$OfferingsTableTableManager(_db, _db.offerings);
  $$TodoOfferingStatusesTableTableManager get todoOfferingStatuses =>
      $$TodoOfferingStatusesTableTableManager(_db, _db.todoOfferingStatuses);
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
