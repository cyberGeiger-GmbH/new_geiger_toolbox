// GENERATED CODE, DO NOT EDIT BY HAND.
// ignore_for_file: type=lint
//@dart=2.12
import 'package:drift/drift.dart';

class UserProfiles extends Table
    with TableInfo<UserProfiles, UserProfilesData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  UserProfiles(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 36, maxTextLength: 36),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  late final GeneratedColumn<bool> owner = GeneratedColumn<bool>(
      'owner', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("owner" IN (0, 1))'),
      defaultValue: const Constant(true));
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [userId, name, email, owner, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_profiles';
  @override
  Set<GeneratedColumn> get $primaryKey => {userId};
  @override
  UserProfilesData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserProfilesData(
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name']),
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email']),
      owner: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}owner'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  UserProfiles createAlias(String alias) {
    return UserProfiles(attachedDatabase, alias);
  }
}

class UserProfilesData extends DataClass
    implements Insertable<UserProfilesData> {
  final String userId;
  final String? name;
  final String? email;
  final bool owner;
  final DateTime createdAt;
  const UserProfilesData(
      {required this.userId,
      this.name,
      this.email,
      required this.owner,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['user_id'] = Variable<String>(userId);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String>(name);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    map['owner'] = Variable<bool>(owner);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  UserProfilesCompanion toCompanion(bool nullToAbsent) {
    return UserProfilesCompanion(
      userId: Value(userId),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      owner: Value(owner),
      createdAt: Value(createdAt),
    );
  }

  factory UserProfilesData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserProfilesData(
      userId: serializer.fromJson<String>(json['userId']),
      name: serializer.fromJson<String?>(json['name']),
      email: serializer.fromJson<String?>(json['email']),
      owner: serializer.fromJson<bool>(json['owner']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'userId': serializer.toJson<String>(userId),
      'name': serializer.toJson<String?>(name),
      'email': serializer.toJson<String?>(email),
      'owner': serializer.toJson<bool>(owner),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  UserProfilesData copyWith(
          {String? userId,
          Value<String?> name = const Value.absent(),
          Value<String?> email = const Value.absent(),
          bool? owner,
          DateTime? createdAt}) =>
      UserProfilesData(
        userId: userId ?? this.userId,
        name: name.present ? name.value : this.name,
        email: email.present ? email.value : this.email,
        owner: owner ?? this.owner,
        createdAt: createdAt ?? this.createdAt,
      );
  UserProfilesData copyWithCompanion(UserProfilesCompanion data) {
    return UserProfilesData(
      userId: data.userId.present ? data.userId.value : this.userId,
      name: data.name.present ? data.name.value : this.name,
      email: data.email.present ? data.email.value : this.email,
      owner: data.owner.present ? data.owner.value : this.owner,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserProfilesData(')
          ..write('userId: $userId, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('owner: $owner, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(userId, name, email, owner, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserProfilesData &&
          other.userId == this.userId &&
          other.name == this.name &&
          other.email == this.email &&
          other.owner == this.owner &&
          other.createdAt == this.createdAt);
}

class UserProfilesCompanion extends UpdateCompanion<UserProfilesData> {
  final Value<String> userId;
  final Value<String?> name;
  final Value<String?> email;
  final Value<bool> owner;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const UserProfilesCompanion({
    this.userId = const Value.absent(),
    this.name = const Value.absent(),
    this.email = const Value.absent(),
    this.owner = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  UserProfilesCompanion.insert({
    required String userId,
    this.name = const Value.absent(),
    this.email = const Value.absent(),
    this.owner = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : userId = Value(userId);
  static Insertable<UserProfilesData> custom({
    Expression<String>? userId,
    Expression<String>? name,
    Expression<String>? email,
    Expression<bool>? owner,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (userId != null) 'user_id': userId,
      if (name != null) 'name': name,
      if (email != null) 'email': email,
      if (owner != null) 'owner': owner,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  UserProfilesCompanion copyWith(
      {Value<String>? userId,
      Value<String?>? name,
      Value<String?>? email,
      Value<bool>? owner,
      Value<DateTime>? createdAt,
      Value<int>? rowid}) {
    return UserProfilesCompanion(
      userId: userId ?? this.userId,
      name: name ?? this.name,
      email: email ?? this.email,
      owner: owner ?? this.owner,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (owner.present) {
      map['owner'] = Variable<bool>(owner.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UserProfilesCompanion(')
          ..write('userId: $userId, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('owner: $owner, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class CompanyProfiles extends Table
    with TableInfo<CompanyProfiles, CompanyProfilesData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  CompanyProfiles(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> companyName = GeneratedColumn<String>(
      'company_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES user_profiles (user_id)'));
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
      'location', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [companyName, userId, location, description];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'company_profiles';
  @override
  Set<GeneratedColumn> get $primaryKey => {companyName};
  @override
  CompanyProfilesData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CompanyProfilesData(
      companyName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}company_name'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      location: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}location'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
    );
  }

  @override
  CompanyProfiles createAlias(String alias) {
    return CompanyProfiles(attachedDatabase, alias);
  }
}

class CompanyProfilesData extends DataClass
    implements Insertable<CompanyProfilesData> {
  final String companyName;
  final String userId;
  final String location;
  final String description;
  const CompanyProfilesData(
      {required this.companyName,
      required this.userId,
      required this.location,
      required this.description});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['company_name'] = Variable<String>(companyName);
    map['user_id'] = Variable<String>(userId);
    map['location'] = Variable<String>(location);
    map['description'] = Variable<String>(description);
    return map;
  }

  CompanyProfilesCompanion toCompanion(bool nullToAbsent) {
    return CompanyProfilesCompanion(
      companyName: Value(companyName),
      userId: Value(userId),
      location: Value(location),
      description: Value(description),
    );
  }

  factory CompanyProfilesData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CompanyProfilesData(
      companyName: serializer.fromJson<String>(json['companyName']),
      userId: serializer.fromJson<String>(json['userId']),
      location: serializer.fromJson<String>(json['location']),
      description: serializer.fromJson<String>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'companyName': serializer.toJson<String>(companyName),
      'userId': serializer.toJson<String>(userId),
      'location': serializer.toJson<String>(location),
      'description': serializer.toJson<String>(description),
    };
  }

  CompanyProfilesData copyWith(
          {String? companyName,
          String? userId,
          String? location,
          String? description}) =>
      CompanyProfilesData(
        companyName: companyName ?? this.companyName,
        userId: userId ?? this.userId,
        location: location ?? this.location,
        description: description ?? this.description,
      );
  CompanyProfilesData copyWithCompanion(CompanyProfilesCompanion data) {
    return CompanyProfilesData(
      companyName:
          data.companyName.present ? data.companyName.value : this.companyName,
      userId: data.userId.present ? data.userId.value : this.userId,
      location: data.location.present ? data.location.value : this.location,
      description:
          data.description.present ? data.description.value : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CompanyProfilesData(')
          ..write('companyName: $companyName, ')
          ..write('userId: $userId, ')
          ..write('location: $location, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(companyName, userId, location, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CompanyProfilesData &&
          other.companyName == this.companyName &&
          other.userId == this.userId &&
          other.location == this.location &&
          other.description == this.description);
}

class CompanyProfilesCompanion extends UpdateCompanion<CompanyProfilesData> {
  final Value<String> companyName;
  final Value<String> userId;
  final Value<String> location;
  final Value<String> description;
  final Value<int> rowid;
  const CompanyProfilesCompanion({
    this.companyName = const Value.absent(),
    this.userId = const Value.absent(),
    this.location = const Value.absent(),
    this.description = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CompanyProfilesCompanion.insert({
    required String companyName,
    required String userId,
    required String location,
    required String description,
    this.rowid = const Value.absent(),
  })  : companyName = Value(companyName),
        userId = Value(userId),
        location = Value(location),
        description = Value(description);
  static Insertable<CompanyProfilesData> custom({
    Expression<String>? companyName,
    Expression<String>? userId,
    Expression<String>? location,
    Expression<String>? description,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (companyName != null) 'company_name': companyName,
      if (userId != null) 'user_id': userId,
      if (location != null) 'location': location,
      if (description != null) 'description': description,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CompanyProfilesCompanion copyWith(
      {Value<String>? companyName,
      Value<String>? userId,
      Value<String>? location,
      Value<String>? description,
      Value<int>? rowid}) {
    return CompanyProfilesCompanion(
      companyName: companyName ?? this.companyName,
      userId: userId ?? this.userId,
      location: location ?? this.location,
      description: description ?? this.description,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (companyName.present) {
      map['company_name'] = Variable<String>(companyName.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (location.present) {
      map['location'] = Variable<String>(location.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CompanyProfilesCompanion(')
          ..write('companyName: $companyName, ')
          ..write('userId: $userId, ')
          ..write('location: $location, ')
          ..write('description: $description, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class GeigerScores extends Table
    with TableInfo<GeigerScores, GeigerScoresData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  GeigerScores(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
      'user_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES user_profiles (user_id)'));
  late final GeneratedColumn<int> score = GeneratedColumn<int>(
      'score', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  late final GeneratedColumn<DateTime> lastUpdated = GeneratedColumn<DateTime>(
      'last_updated', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  @override
  List<GeneratedColumn> get $columns => [id, userId, score, lastUpdated];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'geiger_scores';
  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GeigerScoresData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GeigerScoresData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}user_id'])!,
      score: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}score'])!,
      lastUpdated: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_updated'])!,
    );
  }

  @override
  GeigerScores createAlias(String alias) {
    return GeigerScores(attachedDatabase, alias);
  }
}

class GeigerScoresData extends DataClass
    implements Insertable<GeigerScoresData> {
  final int id;
  final String userId;
  final int score;
  final DateTime lastUpdated;
  const GeigerScoresData(
      {required this.id,
      required this.userId,
      required this.score,
      required this.lastUpdated});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<String>(userId);
    map['score'] = Variable<int>(score);
    map['last_updated'] = Variable<DateTime>(lastUpdated);
    return map;
  }

  GeigerScoresCompanion toCompanion(bool nullToAbsent) {
    return GeigerScoresCompanion(
      id: Value(id),
      userId: Value(userId),
      score: Value(score),
      lastUpdated: Value(lastUpdated),
    );
  }

  factory GeigerScoresData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GeigerScoresData(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      score: serializer.fromJson<int>(json['score']),
      lastUpdated: serializer.fromJson<DateTime>(json['lastUpdated']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<String>(userId),
      'score': serializer.toJson<int>(score),
      'lastUpdated': serializer.toJson<DateTime>(lastUpdated),
    };
  }

  GeigerScoresData copyWith(
          {int? id, String? userId, int? score, DateTime? lastUpdated}) =>
      GeigerScoresData(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        score: score ?? this.score,
        lastUpdated: lastUpdated ?? this.lastUpdated,
      );
  GeigerScoresData copyWithCompanion(GeigerScoresCompanion data) {
    return GeigerScoresData(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      score: data.score.present ? data.score.value : this.score,
      lastUpdated:
          data.lastUpdated.present ? data.lastUpdated.value : this.lastUpdated,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GeigerScoresData(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('score: $score, ')
          ..write('lastUpdated: $lastUpdated')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, score, lastUpdated);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GeigerScoresData &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.score == this.score &&
          other.lastUpdated == this.lastUpdated);
}

class GeigerScoresCompanion extends UpdateCompanion<GeigerScoresData> {
  final Value<int> id;
  final Value<String> userId;
  final Value<int> score;
  final Value<DateTime> lastUpdated;
  const GeigerScoresCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.score = const Value.absent(),
    this.lastUpdated = const Value.absent(),
  });
  GeigerScoresCompanion.insert({
    this.id = const Value.absent(),
    required String userId,
    required int score,
    this.lastUpdated = const Value.absent(),
  })  : userId = Value(userId),
        score = Value(score);
  static Insertable<GeigerScoresData> custom({
    Expression<int>? id,
    Expression<String>? userId,
    Expression<int>? score,
    Expression<DateTime>? lastUpdated,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (score != null) 'score': score,
      if (lastUpdated != null) 'last_updated': lastUpdated,
    });
  }

  GeigerScoresCompanion copyWith(
      {Value<int>? id,
      Value<String>? userId,
      Value<int>? score,
      Value<DateTime>? lastUpdated}) {
    return GeigerScoresCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      score: score ?? this.score,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<String>(userId.value);
    }
    if (score.present) {
      map['score'] = Variable<int>(score.value);
    }
    if (lastUpdated.present) {
      map['last_updated'] = Variable<DateTime>(lastUpdated.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GeigerScoresCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('score: $score, ')
          ..write('lastUpdated: $lastUpdated')
          ..write(')'))
        .toString();
  }
}

class Reasons extends Table with TableInfo<Reasons, ReasonsData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Reasons(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> reason = GeneratedColumn<String>(
      'reason', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<int> scoreId = GeneratedColumn<int>(
      'score_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES geiger_scores (id)'));
  @override
  List<GeneratedColumn> get $columns => [reason, scoreId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'reasons';
  @override
  Set<GeneratedColumn> get $primaryKey => const {};
  @override
  ReasonsData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ReasonsData(
      reason: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}reason'])!,
      scoreId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}score_id'])!,
    );
  }

  @override
  Reasons createAlias(String alias) {
    return Reasons(attachedDatabase, alias);
  }
}

class ReasonsData extends DataClass implements Insertable<ReasonsData> {
  final String reason;
  final int scoreId;
  const ReasonsData({required this.reason, required this.scoreId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['reason'] = Variable<String>(reason);
    map['score_id'] = Variable<int>(scoreId);
    return map;
  }

  ReasonsCompanion toCompanion(bool nullToAbsent) {
    return ReasonsCompanion(
      reason: Value(reason),
      scoreId: Value(scoreId),
    );
  }

  factory ReasonsData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ReasonsData(
      reason: serializer.fromJson<String>(json['reason']),
      scoreId: serializer.fromJson<int>(json['scoreId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'reason': serializer.toJson<String>(reason),
      'scoreId': serializer.toJson<int>(scoreId),
    };
  }

  ReasonsData copyWith({String? reason, int? scoreId}) => ReasonsData(
        reason: reason ?? this.reason,
        scoreId: scoreId ?? this.scoreId,
      );
  ReasonsData copyWithCompanion(ReasonsCompanion data) {
    return ReasonsData(
      reason: data.reason.present ? data.reason.value : this.reason,
      scoreId: data.scoreId.present ? data.scoreId.value : this.scoreId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ReasonsData(')
          ..write('reason: $reason, ')
          ..write('scoreId: $scoreId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(reason, scoreId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ReasonsData &&
          other.reason == this.reason &&
          other.scoreId == this.scoreId);
}

class ReasonsCompanion extends UpdateCompanion<ReasonsData> {
  final Value<String> reason;
  final Value<int> scoreId;
  final Value<int> rowid;
  const ReasonsCompanion({
    this.reason = const Value.absent(),
    this.scoreId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ReasonsCompanion.insert({
    required String reason,
    required int scoreId,
    this.rowid = const Value.absent(),
  })  : reason = Value(reason),
        scoreId = Value(scoreId);
  static Insertable<ReasonsData> custom({
    Expression<String>? reason,
    Expression<int>? scoreId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (reason != null) 'reason': reason,
      if (scoreId != null) 'score_id': scoreId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ReasonsCompanion copyWith(
      {Value<String>? reason, Value<int>? scoreId, Value<int>? rowid}) {
    return ReasonsCompanion(
      reason: reason ?? this.reason,
      scoreId: scoreId ?? this.scoreId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (reason.present) {
      map['reason'] = Variable<String>(reason.value);
    }
    if (scoreId.present) {
      map['score_id'] = Variable<int>(scoreId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ReasonsCompanion(')
          ..write('reason: $reason, ')
          ..write('scoreId: $scoreId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class NewsInfo extends Table with TableInfo<NewsInfo, NewsInfoData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  NewsInfo(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'UNIQUE NOT NULL');
  late final GeneratedColumn<int> order = GeneratedColumn<int>(
      'order', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'UNIQUE NOT NULL');
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  late final GeneratedColumn<String> summary = GeneratedColumn<String>(
      'summary', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
      'image_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
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
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NewsInfoData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NewsInfoData(
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
  NewsInfo createAlias(String alias) {
    return NewsInfo(attachedDatabase, alias);
  }
}

class NewsInfoData extends DataClass implements Insertable<NewsInfoData> {
  final String id;
  final int order;
  final String title;
  final String summary;
  final String imageUrl;
  final String dateCreated;
  const NewsInfoData(
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

  factory NewsInfoData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NewsInfoData(
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

  NewsInfoData copyWith(
          {String? id,
          int? order,
          String? title,
          String? summary,
          String? imageUrl,
          String? dateCreated}) =>
      NewsInfoData(
        id: id ?? this.id,
        order: order ?? this.order,
        title: title ?? this.title,
        summary: summary ?? this.summary,
        imageUrl: imageUrl ?? this.imageUrl,
        dateCreated: dateCreated ?? this.dateCreated,
      );
  NewsInfoData copyWithCompanion(NewsInfoCompanion data) {
    return NewsInfoData(
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
    return (StringBuffer('NewsInfoData(')
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
      (other is NewsInfoData &&
          other.id == this.id &&
          other.order == this.order &&
          other.title == this.title &&
          other.summary == this.summary &&
          other.imageUrl == this.imageUrl &&
          other.dateCreated == this.dateCreated);
}

class NewsInfoCompanion extends UpdateCompanion<NewsInfoData> {
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
  static Insertable<NewsInfoData> custom({
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

class Recommendations extends Table
    with TableInfo<Recommendations, RecommendationsData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Recommendations(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  late final GeneratedColumn<String> newsId = GeneratedColumn<String>(
      'news_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES news_info (id)'));
  late final GeneratedColumn<int> order = GeneratedColumn<int>(
      'order', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'UNIQUE NOT NULL');
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
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RecommendationsData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecommendationsData(
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
  Recommendations createAlias(String alias) {
    return Recommendations(attachedDatabase, alias);
  }
}

class RecommendationsData extends DataClass
    implements Insertable<RecommendationsData> {
  final String id;
  final String newsId;
  final int order;
  final String name;
  const RecommendationsData(
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

  factory RecommendationsData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecommendationsData(
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

  RecommendationsData copyWith(
          {String? id, String? newsId, int? order, String? name}) =>
      RecommendationsData(
        id: id ?? this.id,
        newsId: newsId ?? this.newsId,
        order: order ?? this.order,
        name: name ?? this.name,
      );
  RecommendationsData copyWithCompanion(RecommendationsCompanion data) {
    return RecommendationsData(
      id: data.id.present ? data.id.value : this.id,
      newsId: data.newsId.present ? data.newsId.value : this.newsId,
      order: data.order.present ? data.order.value : this.order,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RecommendationsData(')
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
      (other is RecommendationsData &&
          other.id == this.id &&
          other.newsId == this.newsId &&
          other.order == this.order &&
          other.name == this.name);
}

class RecommendationsCompanion extends UpdateCompanion<RecommendationsData> {
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
  static Insertable<RecommendationsData> custom({
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

class Offerings extends Table with TableInfo<Offerings, OfferingsData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Offerings(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'UNIQUE NOT NULL');
  late final GeneratedColumn<String> recommendationId = GeneratedColumn<String>(
      'recommendation_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES recommendations (id)'));
  late final GeneratedColumn<int> order = GeneratedColumn<int>(
      'order', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'UNIQUE NOT NULL');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 255),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
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
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OfferingsData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OfferingsData(
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
  Offerings createAlias(String alias) {
    return Offerings(attachedDatabase, alias);
  }
}

class OfferingsData extends DataClass implements Insertable<OfferingsData> {
  final String id;
  final String recommendationId;
  final int order;
  final String name;
  final String summary;
  const OfferingsData(
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

  factory OfferingsData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OfferingsData(
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

  OfferingsData copyWith(
          {String? id,
          String? recommendationId,
          int? order,
          String? name,
          String? summary}) =>
      OfferingsData(
        id: id ?? this.id,
        recommendationId: recommendationId ?? this.recommendationId,
        order: order ?? this.order,
        name: name ?? this.name,
        summary: summary ?? this.summary,
      );
  OfferingsData copyWithCompanion(OfferingsCompanion data) {
    return OfferingsData(
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
    return (StringBuffer('OfferingsData(')
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
      (other is OfferingsData &&
          other.id == this.id &&
          other.recommendationId == this.recommendationId &&
          other.order == this.order &&
          other.name == this.name &&
          other.summary == this.summary);
}

class OfferingsCompanion extends UpdateCompanion<OfferingsData> {
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
  static Insertable<OfferingsData> custom({
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

class TodoOfferingStatuses extends Table
    with TableInfo<TodoOfferingStatuses, TodoOfferingStatusesData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  TodoOfferingStatuses(this.attachedDatabase, [this._alias]);
  late final GeneratedColumn<String> offeringId = GeneratedColumn<String>(
      'offering_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES offerings (id)'));
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
  Set<GeneratedColumn> get $primaryKey => {offeringId};
  @override
  TodoOfferingStatusesData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TodoOfferingStatusesData(
      offeringId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}offering_id'])!,
      added: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}added'])!,
    );
  }

  @override
  TodoOfferingStatuses createAlias(String alias) {
    return TodoOfferingStatuses(attachedDatabase, alias);
  }
}

class TodoOfferingStatusesData extends DataClass
    implements Insertable<TodoOfferingStatusesData> {
  final String offeringId;
  final bool added;
  const TodoOfferingStatusesData(
      {required this.offeringId, required this.added});
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

  factory TodoOfferingStatusesData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TodoOfferingStatusesData(
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

  TodoOfferingStatusesData copyWith({String? offeringId, bool? added}) =>
      TodoOfferingStatusesData(
        offeringId: offeringId ?? this.offeringId,
        added: added ?? this.added,
      );
  TodoOfferingStatusesData copyWithCompanion(
      TodoOfferingStatusesCompanion data) {
    return TodoOfferingStatusesData(
      offeringId:
          data.offeringId.present ? data.offeringId.value : this.offeringId,
      added: data.added.present ? data.added.value : this.added,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TodoOfferingStatusesData(')
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
      (other is TodoOfferingStatusesData &&
          other.offeringId == this.offeringId &&
          other.added == this.added);
}

class TodoOfferingStatusesCompanion
    extends UpdateCompanion<TodoOfferingStatusesData> {
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
  static Insertable<TodoOfferingStatusesData> custom({
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

class DatabaseAtV2 extends GeneratedDatabase {
  DatabaseAtV2(QueryExecutor e) : super(e);
  late final UserProfiles userProfiles = UserProfiles(this);
  late final CompanyProfiles companyProfiles = CompanyProfiles(this);
  late final GeigerScores geigerScores = GeigerScores(this);
  late final Reasons reasons = Reasons(this);
  late final NewsInfo newsInfo = NewsInfo(this);
  late final Recommendations recommendations = Recommendations(this);
  late final Offerings offerings = Offerings(this);
  late final TodoOfferingStatuses todoOfferingStatuses =
      TodoOfferingStatuses(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        userProfiles,
        companyProfiles,
        geigerScores,
        reasons,
        newsInfo,
        recommendations,
        offerings,
        todoOfferingStatuses
      ];
  @override
  int get schemaVersion => 2;
}
