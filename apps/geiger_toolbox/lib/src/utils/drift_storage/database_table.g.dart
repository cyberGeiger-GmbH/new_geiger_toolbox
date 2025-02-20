// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_table.dart';

// ignore_for_file: type=lint
class $UserProfilesTable extends UserProfiles
    with TableInfo<$UserProfilesTable, UserProfileData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UserProfilesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 36,
      maxTextLength: 36,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ownerMeta = const VerificationMeta('owner');
  @override
  late final GeneratedColumn<bool> owner = GeneratedColumn<bool>(
    'owner',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("owner" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [userId, name, email, owner, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'user_profiles';
  @override
  VerificationContext validateIntegrity(
    Insertable<UserProfileData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    }
    if (data.containsKey('owner')) {
      context.handle(
        _ownerMeta,
        owner.isAcceptableOrUnknown(data['owner']!, _ownerMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {userId};
  @override
  UserProfileData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return UserProfileData(
      userId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}user_id'],
          )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      ),
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      ),
      owner:
          attachedDatabase.typeMapping.read(
            DriftSqlType.bool,
            data['${effectivePrefix}owner'],
          )!,
      createdAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}created_at'],
          )!,
    );
  }

  @override
  $UserProfilesTable createAlias(String alias) {
    return $UserProfilesTable(attachedDatabase, alias);
  }
}

class UserProfileData extends DataClass implements Insertable<UserProfileData> {
  final String userId;
  final String? name;
  final String? email;
  final bool owner;
  final DateTime createdAt;
  const UserProfileData({
    required this.userId,
    this.name,
    this.email,
    required this.owner,
    required this.createdAt,
  });
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

  factory UserProfileData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return UserProfileData(
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

  UserProfileData copyWith({
    String? userId,
    Value<String?> name = const Value.absent(),
    Value<String?> email = const Value.absent(),
    bool? owner,
    DateTime? createdAt,
  }) => UserProfileData(
    userId: userId ?? this.userId,
    name: name.present ? name.value : this.name,
    email: email.present ? email.value : this.email,
    owner: owner ?? this.owner,
    createdAt: createdAt ?? this.createdAt,
  );
  UserProfileData copyWithCompanion(UserProfilesCompanion data) {
    return UserProfileData(
      userId: data.userId.present ? data.userId.value : this.userId,
      name: data.name.present ? data.name.value : this.name,
      email: data.email.present ? data.email.value : this.email,
      owner: data.owner.present ? data.owner.value : this.owner,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('UserProfileData(')
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
      (other is UserProfileData &&
          other.userId == this.userId &&
          other.name == this.name &&
          other.email == this.email &&
          other.owner == this.owner &&
          other.createdAt == this.createdAt);
}

class UserProfilesCompanion extends UpdateCompanion<UserProfileData> {
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
  static Insertable<UserProfileData> custom({
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

  UserProfilesCompanion copyWith({
    Value<String>? userId,
    Value<String?>? name,
    Value<String?>? email,
    Value<bool>? owner,
    Value<DateTime>? createdAt,
    Value<int>? rowid,
  }) {
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

class $CompanyProfilesTable extends CompanyProfiles
    with TableInfo<$CompanyProfilesTable, CompanyProfileData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CompanyProfilesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _companyNameMeta = const VerificationMeta(
    'companyName',
  );
  @override
  late final GeneratedColumn<String> companyName = GeneratedColumn<String>(
    'company_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES user_profiles (user_id)',
    ),
  );
  static const VerificationMeta _locationMeta = const VerificationMeta(
    'location',
  );
  @override
  late final GeneratedColumn<String> location = GeneratedColumn<String>(
    'location',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 255,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    companyName,
    userId,
    location,
    description,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'company_profiles';
  @override
  VerificationContext validateIntegrity(
    Insertable<CompanyProfileData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('company_name')) {
      context.handle(
        _companyNameMeta,
        companyName.isAcceptableOrUnknown(
          data['company_name']!,
          _companyNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_companyNameMeta);
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('location')) {
      context.handle(
        _locationMeta,
        location.isAcceptableOrUnknown(data['location']!, _locationMeta),
      );
    } else if (isInserting) {
      context.missing(_locationMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {companyName};
  @override
  CompanyProfileData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CompanyProfileData(
      companyName:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}company_name'],
          )!,
      userId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}user_id'],
          )!,
      location:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}location'],
          )!,
      description:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}description'],
          )!,
    );
  }

  @override
  $CompanyProfilesTable createAlias(String alias) {
    return $CompanyProfilesTable(attachedDatabase, alias);
  }
}

class CompanyProfileData extends DataClass
    implements Insertable<CompanyProfileData> {
  final String companyName;
  final String userId;
  final String location;
  final String description;
  const CompanyProfileData({
    required this.companyName,
    required this.userId,
    required this.location,
    required this.description,
  });
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

  factory CompanyProfileData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CompanyProfileData(
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

  CompanyProfileData copyWith({
    String? companyName,
    String? userId,
    String? location,
    String? description,
  }) => CompanyProfileData(
    companyName: companyName ?? this.companyName,
    userId: userId ?? this.userId,
    location: location ?? this.location,
    description: description ?? this.description,
  );
  CompanyProfileData copyWithCompanion(CompanyProfilesCompanion data) {
    return CompanyProfileData(
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
    return (StringBuffer('CompanyProfileData(')
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
      (other is CompanyProfileData &&
          other.companyName == this.companyName &&
          other.userId == this.userId &&
          other.location == this.location &&
          other.description == this.description);
}

class CompanyProfilesCompanion extends UpdateCompanion<CompanyProfileData> {
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
  }) : companyName = Value(companyName),
       userId = Value(userId),
       location = Value(location),
       description = Value(description);
  static Insertable<CompanyProfileData> custom({
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

  CompanyProfilesCompanion copyWith({
    Value<String>? companyName,
    Value<String>? userId,
    Value<String>? location,
    Value<String>? description,
    Value<int>? rowid,
  }) {
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

class $GeigerScoresTable extends GeigerScores
    with TableInfo<$GeigerScoresTable, GeigerScoreData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GeigerScoresTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<String> userId = GeneratedColumn<String>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES user_profiles (user_id)',
    ),
  );
  static const VerificationMeta _reasonMeta = const VerificationMeta('reason');
  @override
  late final GeneratedColumn<String> reason = GeneratedColumn<String>(
    'reason',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _interpretationMeta = const VerificationMeta(
    'interpretation',
  );
  @override
  late final GeneratedColumn<String> interpretation = GeneratedColumn<String>(
    'interpretation',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _scoreMeta = const VerificationMeta('score');
  @override
  late final GeneratedColumn<int> score = GeneratedColumn<int>(
    'score',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastUpdatedMeta = const VerificationMeta(
    'lastUpdated',
  );
  @override
  late final GeneratedColumn<DateTime> lastUpdated = GeneratedColumn<DateTime>(
    'last_updated',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    userId,
    reason,
    interpretation,
    score,
    lastUpdated,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'geiger_scores';
  @override
  VerificationContext validateIntegrity(
    Insertable<GeigerScoreData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('reason')) {
      context.handle(
        _reasonMeta,
        reason.isAcceptableOrUnknown(data['reason']!, _reasonMeta),
      );
    } else if (isInserting) {
      context.missing(_reasonMeta);
    }
    if (data.containsKey('interpretation')) {
      context.handle(
        _interpretationMeta,
        interpretation.isAcceptableOrUnknown(
          data['interpretation']!,
          _interpretationMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_interpretationMeta);
    }
    if (data.containsKey('score')) {
      context.handle(
        _scoreMeta,
        score.isAcceptableOrUnknown(data['score']!, _scoreMeta),
      );
    } else if (isInserting) {
      context.missing(_scoreMeta);
    }
    if (data.containsKey('last_updated')) {
      context.handle(
        _lastUpdatedMeta,
        lastUpdated.isAcceptableOrUnknown(
          data['last_updated']!,
          _lastUpdatedMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GeigerScoreData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GeigerScoreData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      userId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}user_id'],
          )!,
      reason:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}reason'],
          )!,
      interpretation:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}interpretation'],
          )!,
      score:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}score'],
          )!,
      lastUpdated:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}last_updated'],
          )!,
    );
  }

  @override
  $GeigerScoresTable createAlias(String alias) {
    return $GeigerScoresTable(attachedDatabase, alias);
  }
}

class GeigerScoreData extends DataClass implements Insertable<GeigerScoreData> {
  final int id;
  final String userId;
  final String reason;
  final String interpretation;
  final int score;
  final DateTime lastUpdated;
  const GeigerScoreData({
    required this.id,
    required this.userId,
    required this.reason,
    required this.interpretation,
    required this.score,
    required this.lastUpdated,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<String>(userId);
    map['reason'] = Variable<String>(reason);
    map['interpretation'] = Variable<String>(interpretation);
    map['score'] = Variable<int>(score);
    map['last_updated'] = Variable<DateTime>(lastUpdated);
    return map;
  }

  GeigerScoresCompanion toCompanion(bool nullToAbsent) {
    return GeigerScoresCompanion(
      id: Value(id),
      userId: Value(userId),
      reason: Value(reason),
      interpretation: Value(interpretation),
      score: Value(score),
      lastUpdated: Value(lastUpdated),
    );
  }

  factory GeigerScoreData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GeigerScoreData(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<String>(json['userId']),
      reason: serializer.fromJson<String>(json['reason']),
      interpretation: serializer.fromJson<String>(json['interpretation']),
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
      'reason': serializer.toJson<String>(reason),
      'interpretation': serializer.toJson<String>(interpretation),
      'score': serializer.toJson<int>(score),
      'lastUpdated': serializer.toJson<DateTime>(lastUpdated),
    };
  }

  GeigerScoreData copyWith({
    int? id,
    String? userId,
    String? reason,
    String? interpretation,
    int? score,
    DateTime? lastUpdated,
  }) => GeigerScoreData(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    reason: reason ?? this.reason,
    interpretation: interpretation ?? this.interpretation,
    score: score ?? this.score,
    lastUpdated: lastUpdated ?? this.lastUpdated,
  );
  GeigerScoreData copyWithCompanion(GeigerScoresCompanion data) {
    return GeigerScoreData(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      reason: data.reason.present ? data.reason.value : this.reason,
      interpretation:
          data.interpretation.present
              ? data.interpretation.value
              : this.interpretation,
      score: data.score.present ? data.score.value : this.score,
      lastUpdated:
          data.lastUpdated.present ? data.lastUpdated.value : this.lastUpdated,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GeigerScoreData(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('reason: $reason, ')
          ..write('interpretation: $interpretation, ')
          ..write('score: $score, ')
          ..write('lastUpdated: $lastUpdated')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, userId, reason, interpretation, score, lastUpdated);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GeigerScoreData &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.reason == this.reason &&
          other.interpretation == this.interpretation &&
          other.score == this.score &&
          other.lastUpdated == this.lastUpdated);
}

class GeigerScoresCompanion extends UpdateCompanion<GeigerScoreData> {
  final Value<int> id;
  final Value<String> userId;
  final Value<String> reason;
  final Value<String> interpretation;
  final Value<int> score;
  final Value<DateTime> lastUpdated;
  const GeigerScoresCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.reason = const Value.absent(),
    this.interpretation = const Value.absent(),
    this.score = const Value.absent(),
    this.lastUpdated = const Value.absent(),
  });
  GeigerScoresCompanion.insert({
    this.id = const Value.absent(),
    required String userId,
    required String reason,
    required String interpretation,
    required int score,
    this.lastUpdated = const Value.absent(),
  }) : userId = Value(userId),
       reason = Value(reason),
       interpretation = Value(interpretation),
       score = Value(score);
  static Insertable<GeigerScoreData> custom({
    Expression<int>? id,
    Expression<String>? userId,
    Expression<String>? reason,
    Expression<String>? interpretation,
    Expression<int>? score,
    Expression<DateTime>? lastUpdated,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (reason != null) 'reason': reason,
      if (interpretation != null) 'interpretation': interpretation,
      if (score != null) 'score': score,
      if (lastUpdated != null) 'last_updated': lastUpdated,
    });
  }

  GeigerScoresCompanion copyWith({
    Value<int>? id,
    Value<String>? userId,
    Value<String>? reason,
    Value<String>? interpretation,
    Value<int>? score,
    Value<DateTime>? lastUpdated,
  }) {
    return GeigerScoresCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      reason: reason ?? this.reason,
      interpretation: interpretation ?? this.interpretation,
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
    if (reason.present) {
      map['reason'] = Variable<String>(reason.value);
    }
    if (interpretation.present) {
      map['interpretation'] = Variable<String>(interpretation.value);
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
          ..write('reason: $reason, ')
          ..write('interpretation: $interpretation, ')
          ..write('score: $score, ')
          ..write('lastUpdated: $lastUpdated')
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
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'UNIQUE NOT NULL',
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 255,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _summaryMeta = const VerificationMeta(
    'summary',
  );
  @override
  late final GeneratedColumn<String> summary = GeneratedColumn<String>(
    'summary',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _newsCategorgMeta = const VerificationMeta(
    'newsCategorg',
  );
  @override
  late final GeneratedColumn<String> newsCategorg = GeneratedColumn<String>(
    'news_categorg',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imageUrlMeta = const VerificationMeta(
    'imageUrl',
  );
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
    'image_url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateCreatedMeta = const VerificationMeta(
    'dateCreated',
  );
  @override
  late final GeneratedColumn<DateTime> dateCreated = GeneratedColumn<DateTime>(
    'date_created',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    summary,
    newsCategorg,
    imageUrl,
    dateCreated,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'news_info';
  @override
  VerificationContext validateIntegrity(
    Insertable<NewsData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('summary')) {
      context.handle(
        _summaryMeta,
        summary.isAcceptableOrUnknown(data['summary']!, _summaryMeta),
      );
    } else if (isInserting) {
      context.missing(_summaryMeta);
    }
    if (data.containsKey('news_categorg')) {
      context.handle(
        _newsCategorgMeta,
        newsCategorg.isAcceptableOrUnknown(
          data['news_categorg']!,
          _newsCategorgMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_newsCategorgMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(
        _imageUrlMeta,
        imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta),
      );
    } else if (isInserting) {
      context.missing(_imageUrlMeta);
    }
    if (data.containsKey('date_created')) {
      context.handle(
        _dateCreatedMeta,
        dateCreated.isAcceptableOrUnknown(
          data['date_created']!,
          _dateCreatedMeta,
        ),
      );
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
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}id'],
          )!,
      title:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}title'],
          )!,
      summary:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}summary'],
          )!,
      newsCategorg:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}news_categorg'],
          )!,
      imageUrl:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}image_url'],
          )!,
      dateCreated:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}date_created'],
          )!,
    );
  }

  @override
  $NewsInfoTable createAlias(String alias) {
    return $NewsInfoTable(attachedDatabase, alias);
  }
}

class NewsData extends DataClass implements Insertable<NewsData> {
  final String id;
  final String title;
  final String summary;
  final String newsCategorg;
  final String imageUrl;
  final DateTime dateCreated;
  const NewsData({
    required this.id,
    required this.title,
    required this.summary,
    required this.newsCategorg,
    required this.imageUrl,
    required this.dateCreated,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['summary'] = Variable<String>(summary);
    map['news_categorg'] = Variable<String>(newsCategorg);
    map['image_url'] = Variable<String>(imageUrl);
    map['date_created'] = Variable<DateTime>(dateCreated);
    return map;
  }

  NewsInfoCompanion toCompanion(bool nullToAbsent) {
    return NewsInfoCompanion(
      id: Value(id),
      title: Value(title),
      summary: Value(summary),
      newsCategorg: Value(newsCategorg),
      imageUrl: Value(imageUrl),
      dateCreated: Value(dateCreated),
    );
  }

  factory NewsData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NewsData(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      summary: serializer.fromJson<String>(json['summary']),
      newsCategorg: serializer.fromJson<String>(json['newsCategorg']),
      imageUrl: serializer.fromJson<String>(json['imageUrl']),
      dateCreated: serializer.fromJson<DateTime>(json['dateCreated']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'summary': serializer.toJson<String>(summary),
      'newsCategorg': serializer.toJson<String>(newsCategorg),
      'imageUrl': serializer.toJson<String>(imageUrl),
      'dateCreated': serializer.toJson<DateTime>(dateCreated),
    };
  }

  NewsData copyWith({
    String? id,
    String? title,
    String? summary,
    String? newsCategorg,
    String? imageUrl,
    DateTime? dateCreated,
  }) => NewsData(
    id: id ?? this.id,
    title: title ?? this.title,
    summary: summary ?? this.summary,
    newsCategorg: newsCategorg ?? this.newsCategorg,
    imageUrl: imageUrl ?? this.imageUrl,
    dateCreated: dateCreated ?? this.dateCreated,
  );
  NewsData copyWithCompanion(NewsInfoCompanion data) {
    return NewsData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      summary: data.summary.present ? data.summary.value : this.summary,
      newsCategorg:
          data.newsCategorg.present
              ? data.newsCategorg.value
              : this.newsCategorg,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      dateCreated:
          data.dateCreated.present ? data.dateCreated.value : this.dateCreated,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NewsData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('summary: $summary, ')
          ..write('newsCategorg: $newsCategorg, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('dateCreated: $dateCreated')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, title, summary, newsCategorg, imageUrl, dateCreated);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NewsData &&
          other.id == this.id &&
          other.title == this.title &&
          other.summary == this.summary &&
          other.newsCategorg == this.newsCategorg &&
          other.imageUrl == this.imageUrl &&
          other.dateCreated == this.dateCreated);
}

class NewsInfoCompanion extends UpdateCompanion<NewsData> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> summary;
  final Value<String> newsCategorg;
  final Value<String> imageUrl;
  final Value<DateTime> dateCreated;
  final Value<int> rowid;
  const NewsInfoCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.summary = const Value.absent(),
    this.newsCategorg = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.dateCreated = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  NewsInfoCompanion.insert({
    required String id,
    required String title,
    required String summary,
    required String newsCategorg,
    required String imageUrl,
    required DateTime dateCreated,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title),
       summary = Value(summary),
       newsCategorg = Value(newsCategorg),
       imageUrl = Value(imageUrl),
       dateCreated = Value(dateCreated);
  static Insertable<NewsData> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? summary,
    Expression<String>? newsCategorg,
    Expression<String>? imageUrl,
    Expression<DateTime>? dateCreated,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (summary != null) 'summary': summary,
      if (newsCategorg != null) 'news_categorg': newsCategorg,
      if (imageUrl != null) 'image_url': imageUrl,
      if (dateCreated != null) 'date_created': dateCreated,
      if (rowid != null) 'rowid': rowid,
    });
  }

  NewsInfoCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<String>? summary,
    Value<String>? newsCategorg,
    Value<String>? imageUrl,
    Value<DateTime>? dateCreated,
    Value<int>? rowid,
  }) {
    return NewsInfoCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      summary: summary ?? this.summary,
      newsCategorg: newsCategorg ?? this.newsCategorg,
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
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (summary.present) {
      map['summary'] = Variable<String>(summary.value);
    }
    if (newsCategorg.present) {
      map['news_categorg'] = Variable<String>(newsCategorg.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (dateCreated.present) {
      map['date_created'] = Variable<DateTime>(dateCreated.value);
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
          ..write('title: $title, ')
          ..write('summary: $summary, ')
          ..write('newsCategorg: $newsCategorg, ')
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
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'UNIQUE NOT NULL',
  );
  static const VerificationMeta _newsIdMeta = const VerificationMeta('newsId');
  @override
  late final GeneratedColumn<String> newsId = GeneratedColumn<String>(
    'news_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES news_info (id)',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 255,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _rationaleMeta = const VerificationMeta(
    'rationale',
  );
  @override
  late final GeneratedColumn<String> rationale = GeneratedColumn<String>(
    'rationale',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, newsId, name, rationale];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recommendations';
  @override
  VerificationContext validateIntegrity(
    Insertable<RecommendationData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('news_id')) {
      context.handle(
        _newsIdMeta,
        newsId.isAcceptableOrUnknown(data['news_id']!, _newsIdMeta),
      );
    } else if (isInserting) {
      context.missing(_newsIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('rationale')) {
      context.handle(
        _rationaleMeta,
        rationale.isAcceptableOrUnknown(data['rationale']!, _rationaleMeta),
      );
    } else if (isInserting) {
      context.missing(_rationaleMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RecommendationData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecommendationData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}id'],
          )!,
      newsId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}news_id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      rationale:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}rationale'],
          )!,
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
  final String name;
  final String rationale;
  const RecommendationData({
    required this.id,
    required this.newsId,
    required this.name,
    required this.rationale,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['news_id'] = Variable<String>(newsId);
    map['name'] = Variable<String>(name);
    map['rationale'] = Variable<String>(rationale);
    return map;
  }

  RecommendationsCompanion toCompanion(bool nullToAbsent) {
    return RecommendationsCompanion(
      id: Value(id),
      newsId: Value(newsId),
      name: Value(name),
      rationale: Value(rationale),
    );
  }

  factory RecommendationData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecommendationData(
      id: serializer.fromJson<String>(json['id']),
      newsId: serializer.fromJson<String>(json['newsId']),
      name: serializer.fromJson<String>(json['name']),
      rationale: serializer.fromJson<String>(json['rationale']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'newsId': serializer.toJson<String>(newsId),
      'name': serializer.toJson<String>(name),
      'rationale': serializer.toJson<String>(rationale),
    };
  }

  RecommendationData copyWith({
    String? id,
    String? newsId,
    String? name,
    String? rationale,
  }) => RecommendationData(
    id: id ?? this.id,
    newsId: newsId ?? this.newsId,
    name: name ?? this.name,
    rationale: rationale ?? this.rationale,
  );
  RecommendationData copyWithCompanion(RecommendationsCompanion data) {
    return RecommendationData(
      id: data.id.present ? data.id.value : this.id,
      newsId: data.newsId.present ? data.newsId.value : this.newsId,
      name: data.name.present ? data.name.value : this.name,
      rationale: data.rationale.present ? data.rationale.value : this.rationale,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RecommendationData(')
          ..write('id: $id, ')
          ..write('newsId: $newsId, ')
          ..write('name: $name, ')
          ..write('rationale: $rationale')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, newsId, name, rationale);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecommendationData &&
          other.id == this.id &&
          other.newsId == this.newsId &&
          other.name == this.name &&
          other.rationale == this.rationale);
}

class RecommendationsCompanion extends UpdateCompanion<RecommendationData> {
  final Value<String> id;
  final Value<String> newsId;
  final Value<String> name;
  final Value<String> rationale;
  final Value<int> rowid;
  const RecommendationsCompanion({
    this.id = const Value.absent(),
    this.newsId = const Value.absent(),
    this.name = const Value.absent(),
    this.rationale = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RecommendationsCompanion.insert({
    required String id,
    required String newsId,
    required String name,
    required String rationale,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       newsId = Value(newsId),
       name = Value(name),
       rationale = Value(rationale);
  static Insertable<RecommendationData> custom({
    Expression<String>? id,
    Expression<String>? newsId,
    Expression<String>? name,
    Expression<String>? rationale,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (newsId != null) 'news_id': newsId,
      if (name != null) 'name': name,
      if (rationale != null) 'rationale': rationale,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RecommendationsCompanion copyWith({
    Value<String>? id,
    Value<String>? newsId,
    Value<String>? name,
    Value<String>? rationale,
    Value<int>? rowid,
  }) {
    return RecommendationsCompanion(
      id: id ?? this.id,
      newsId: newsId ?? this.newsId,
      name: name ?? this.name,
      rationale: rationale ?? this.rationale,
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
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (rationale.present) {
      map['rationale'] = Variable<String>(rationale.value);
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
          ..write('name: $name, ')
          ..write('rationale: $rationale, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RecommendationOfferingsTable extends RecommendationOfferings
    with TableInfo<$RecommendationOfferingsTable, RecommendationOfferingData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecommendationOfferingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    $customConstraints: 'UNIQUE NOT NULL',
  );
  static const VerificationMeta _recommendationIdMeta = const VerificationMeta(
    'recommendationId',
  );
  @override
  late final GeneratedColumn<String> recommendationId = GeneratedColumn<String>(
    'recommendation_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES recommendations (id)',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 255,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _summaryMeta = const VerificationMeta(
    'summary',
  );
  @override
  late final GeneratedColumn<String> summary = GeneratedColumn<String>(
    'summary',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateRecommendatedMeta = const VerificationMeta(
    'dateRecommendated',
  );
  @override
  late final GeneratedColumn<DateTime> dateRecommendated =
      GeneratedColumn<DateTime>(
        'date_recommendated',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
        defaultValue: currentDateAndTime,
      );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    recommendationId,
    name,
    summary,
    dateRecommendated,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recommendation_offerings';
  @override
  VerificationContext validateIntegrity(
    Insertable<RecommendationOfferingData> instance, {
    bool isInserting = false,
  }) {
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
          data['recommendation_id']!,
          _recommendationIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_recommendationIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('summary')) {
      context.handle(
        _summaryMeta,
        summary.isAcceptableOrUnknown(data['summary']!, _summaryMeta),
      );
    } else if (isInserting) {
      context.missing(_summaryMeta);
    }
    if (data.containsKey('date_recommendated')) {
      context.handle(
        _dateRecommendatedMeta,
        dateRecommendated.isAcceptableOrUnknown(
          data['date_recommendated']!,
          _dateRecommendatedMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RecommendationOfferingData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecommendationOfferingData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}id'],
          )!,
      recommendationId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}recommendation_id'],
          )!,
      name:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}name'],
          )!,
      summary:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}summary'],
          )!,
      dateRecommendated:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}date_recommendated'],
          )!,
    );
  }

  @override
  $RecommendationOfferingsTable createAlias(String alias) {
    return $RecommendationOfferingsTable(attachedDatabase, alias);
  }
}

class RecommendationOfferingData extends DataClass
    implements Insertable<RecommendationOfferingData> {
  final String id;
  final String recommendationId;
  final String name;
  final String summary;
  final DateTime dateRecommendated;
  const RecommendationOfferingData({
    required this.id,
    required this.recommendationId,
    required this.name,
    required this.summary,
    required this.dateRecommendated,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['recommendation_id'] = Variable<String>(recommendationId);
    map['name'] = Variable<String>(name);
    map['summary'] = Variable<String>(summary);
    map['date_recommendated'] = Variable<DateTime>(dateRecommendated);
    return map;
  }

  RecommendationOfferingsCompanion toCompanion(bool nullToAbsent) {
    return RecommendationOfferingsCompanion(
      id: Value(id),
      recommendationId: Value(recommendationId),
      name: Value(name),
      summary: Value(summary),
      dateRecommendated: Value(dateRecommendated),
    );
  }

  factory RecommendationOfferingData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecommendationOfferingData(
      id: serializer.fromJson<String>(json['id']),
      recommendationId: serializer.fromJson<String>(json['recommendationId']),
      name: serializer.fromJson<String>(json['name']),
      summary: serializer.fromJson<String>(json['summary']),
      dateRecommendated: serializer.fromJson<DateTime>(
        json['dateRecommendated'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'recommendationId': serializer.toJson<String>(recommendationId),
      'name': serializer.toJson<String>(name),
      'summary': serializer.toJson<String>(summary),
      'dateRecommendated': serializer.toJson<DateTime>(dateRecommendated),
    };
  }

  RecommendationOfferingData copyWith({
    String? id,
    String? recommendationId,
    String? name,
    String? summary,
    DateTime? dateRecommendated,
  }) => RecommendationOfferingData(
    id: id ?? this.id,
    recommendationId: recommendationId ?? this.recommendationId,
    name: name ?? this.name,
    summary: summary ?? this.summary,
    dateRecommendated: dateRecommendated ?? this.dateRecommendated,
  );
  RecommendationOfferingData copyWithCompanion(
    RecommendationOfferingsCompanion data,
  ) {
    return RecommendationOfferingData(
      id: data.id.present ? data.id.value : this.id,
      recommendationId:
          data.recommendationId.present
              ? data.recommendationId.value
              : this.recommendationId,
      name: data.name.present ? data.name.value : this.name,
      summary: data.summary.present ? data.summary.value : this.summary,
      dateRecommendated:
          data.dateRecommendated.present
              ? data.dateRecommendated.value
              : this.dateRecommendated,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RecommendationOfferingData(')
          ..write('id: $id, ')
          ..write('recommendationId: $recommendationId, ')
          ..write('name: $name, ')
          ..write('summary: $summary, ')
          ..write('dateRecommendated: $dateRecommendated')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, recommendationId, name, summary, dateRecommendated);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecommendationOfferingData &&
          other.id == this.id &&
          other.recommendationId == this.recommendationId &&
          other.name == this.name &&
          other.summary == this.summary &&
          other.dateRecommendated == this.dateRecommendated);
}

class RecommendationOfferingsCompanion
    extends UpdateCompanion<RecommendationOfferingData> {
  final Value<String> id;
  final Value<String> recommendationId;
  final Value<String> name;
  final Value<String> summary;
  final Value<DateTime> dateRecommendated;
  final Value<int> rowid;
  const RecommendationOfferingsCompanion({
    this.id = const Value.absent(),
    this.recommendationId = const Value.absent(),
    this.name = const Value.absent(),
    this.summary = const Value.absent(),
    this.dateRecommendated = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RecommendationOfferingsCompanion.insert({
    required String id,
    required String recommendationId,
    required String name,
    required String summary,
    this.dateRecommendated = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       recommendationId = Value(recommendationId),
       name = Value(name),
       summary = Value(summary);
  static Insertable<RecommendationOfferingData> custom({
    Expression<String>? id,
    Expression<String>? recommendationId,
    Expression<String>? name,
    Expression<String>? summary,
    Expression<DateTime>? dateRecommendated,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (recommendationId != null) 'recommendation_id': recommendationId,
      if (name != null) 'name': name,
      if (summary != null) 'summary': summary,
      if (dateRecommendated != null) 'date_recommendated': dateRecommendated,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RecommendationOfferingsCompanion copyWith({
    Value<String>? id,
    Value<String>? recommendationId,
    Value<String>? name,
    Value<String>? summary,
    Value<DateTime>? dateRecommendated,
    Value<int>? rowid,
  }) {
    return RecommendationOfferingsCompanion(
      id: id ?? this.id,
      recommendationId: recommendationId ?? this.recommendationId,
      name: name ?? this.name,
      summary: summary ?? this.summary,
      dateRecommendated: dateRecommendated ?? this.dateRecommendated,
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
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (summary.present) {
      map['summary'] = Variable<String>(summary.value);
    }
    if (dateRecommendated.present) {
      map['date_recommendated'] = Variable<DateTime>(dateRecommendated.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecommendationOfferingsCompanion(')
          ..write('id: $id, ')
          ..write('recommendationId: $recommendationId, ')
          ..write('name: $name, ')
          ..write('summary: $summary, ')
          ..write('dateRecommendated: $dateRecommendated, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $TodoOfferingsTable extends TodoOfferings
    with TableInfo<$TodoOfferingsTable, TodoOfferingData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TodoOfferingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _offeringIdMeta = const VerificationMeta(
    'offeringId',
  );
  @override
  late final GeneratedColumn<String> offeringId = GeneratedColumn<String>(
    'offering_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES recommendation_offerings (id)',
    ),
  );
  static const VerificationMeta _offeringStatusMeta = const VerificationMeta(
    'offeringStatus',
  );
  @override
  late final GeneratedColumnWithTypeConverter<OfferingStatus, int>
  offeringStatus = GeneratedColumn<int>(
    'offering_status',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  ).withConverter<OfferingStatus>($TodoOfferingsTable.$converterofferingStatus);
  static const VerificationMeta _lastUpdatedMeta = const VerificationMeta(
    'lastUpdated',
  );
  @override
  late final GeneratedColumn<DateTime> lastUpdated = GeneratedColumn<DateTime>(
    'last_updated',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    offeringId,
    offeringStatus,
    lastUpdated,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'todo_offerings';
  @override
  VerificationContext validateIntegrity(
    Insertable<TodoOfferingData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('offering_id')) {
      context.handle(
        _offeringIdMeta,
        offeringId.isAcceptableOrUnknown(data['offering_id']!, _offeringIdMeta),
      );
    } else if (isInserting) {
      context.missing(_offeringIdMeta);
    }
    context.handle(_offeringStatusMeta, const VerificationResult.success());
    if (data.containsKey('last_updated')) {
      context.handle(
        _lastUpdatedMeta,
        lastUpdated.isAcceptableOrUnknown(
          data['last_updated']!,
          _lastUpdatedMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {offeringId};
  @override
  TodoOfferingData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return TodoOfferingData(
      offeringId:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}offering_id'],
          )!,
      offeringStatus: $TodoOfferingsTable.$converterofferingStatus.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}offering_status'],
        )!,
      ),
      lastUpdated:
          attachedDatabase.typeMapping.read(
            DriftSqlType.dateTime,
            data['${effectivePrefix}last_updated'],
          )!,
    );
  }

  @override
  $TodoOfferingsTable createAlias(String alias) {
    return $TodoOfferingsTable(attachedDatabase, alias);
  }

  static TypeConverter<OfferingStatus, int> $converterofferingStatus =
      const TodoOfferingStatusConverter();
}

class TodoOfferingData extends DataClass
    implements Insertable<TodoOfferingData> {
  final String offeringId;
  final OfferingStatus offeringStatus;
  final DateTime lastUpdated;
  const TodoOfferingData({
    required this.offeringId,
    required this.offeringStatus,
    required this.lastUpdated,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['offering_id'] = Variable<String>(offeringId);
    {
      map['offering_status'] = Variable<int>(
        $TodoOfferingsTable.$converterofferingStatus.toSql(offeringStatus),
      );
    }
    map['last_updated'] = Variable<DateTime>(lastUpdated);
    return map;
  }

  TodoOfferingsCompanion toCompanion(bool nullToAbsent) {
    return TodoOfferingsCompanion(
      offeringId: Value(offeringId),
      offeringStatus: Value(offeringStatus),
      lastUpdated: Value(lastUpdated),
    );
  }

  factory TodoOfferingData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return TodoOfferingData(
      offeringId: serializer.fromJson<String>(json['offeringId']),
      offeringStatus: serializer.fromJson<OfferingStatus>(
        json['offeringStatus'],
      ),
      lastUpdated: serializer.fromJson<DateTime>(json['lastUpdated']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'offeringId': serializer.toJson<String>(offeringId),
      'offeringStatus': serializer.toJson<OfferingStatus>(offeringStatus),
      'lastUpdated': serializer.toJson<DateTime>(lastUpdated),
    };
  }

  TodoOfferingData copyWith({
    String? offeringId,
    OfferingStatus? offeringStatus,
    DateTime? lastUpdated,
  }) => TodoOfferingData(
    offeringId: offeringId ?? this.offeringId,
    offeringStatus: offeringStatus ?? this.offeringStatus,
    lastUpdated: lastUpdated ?? this.lastUpdated,
  );
  TodoOfferingData copyWithCompanion(TodoOfferingsCompanion data) {
    return TodoOfferingData(
      offeringId:
          data.offeringId.present ? data.offeringId.value : this.offeringId,
      offeringStatus:
          data.offeringStatus.present
              ? data.offeringStatus.value
              : this.offeringStatus,
      lastUpdated:
          data.lastUpdated.present ? data.lastUpdated.value : this.lastUpdated,
    );
  }

  @override
  String toString() {
    return (StringBuffer('TodoOfferingData(')
          ..write('offeringId: $offeringId, ')
          ..write('offeringStatus: $offeringStatus, ')
          ..write('lastUpdated: $lastUpdated')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(offeringId, offeringStatus, lastUpdated);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TodoOfferingData &&
          other.offeringId == this.offeringId &&
          other.offeringStatus == this.offeringStatus &&
          other.lastUpdated == this.lastUpdated);
}

class TodoOfferingsCompanion extends UpdateCompanion<TodoOfferingData> {
  final Value<String> offeringId;
  final Value<OfferingStatus> offeringStatus;
  final Value<DateTime> lastUpdated;
  final Value<int> rowid;
  const TodoOfferingsCompanion({
    this.offeringId = const Value.absent(),
    this.offeringStatus = const Value.absent(),
    this.lastUpdated = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  TodoOfferingsCompanion.insert({
    required String offeringId,
    required OfferingStatus offeringStatus,
    this.lastUpdated = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : offeringId = Value(offeringId),
       offeringStatus = Value(offeringStatus);
  static Insertable<TodoOfferingData> custom({
    Expression<String>? offeringId,
    Expression<int>? offeringStatus,
    Expression<DateTime>? lastUpdated,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (offeringId != null) 'offering_id': offeringId,
      if (offeringStatus != null) 'offering_status': offeringStatus,
      if (lastUpdated != null) 'last_updated': lastUpdated,
      if (rowid != null) 'rowid': rowid,
    });
  }

  TodoOfferingsCompanion copyWith({
    Value<String>? offeringId,
    Value<OfferingStatus>? offeringStatus,
    Value<DateTime>? lastUpdated,
    Value<int>? rowid,
  }) {
    return TodoOfferingsCompanion(
      offeringId: offeringId ?? this.offeringId,
      offeringStatus: offeringStatus ?? this.offeringStatus,
      lastUpdated: lastUpdated ?? this.lastUpdated,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (offeringId.present) {
      map['offering_id'] = Variable<String>(offeringId.value);
    }
    if (offeringStatus.present) {
      map['offering_status'] = Variable<int>(
        $TodoOfferingsTable.$converterofferingStatus.toSql(
          offeringStatus.value,
        ),
      );
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
    return (StringBuffer('TodoOfferingsCompanion(')
          ..write('offeringId: $offeringId, ')
          ..write('offeringStatus: $offeringStatus, ')
          ..write('lastUpdated: $lastUpdated, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PreviousUserProfilesTable extends PreviousUserProfiles
    with TableInfo<$PreviousUserProfilesTable, PreviousUserProfileData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PreviousUserProfilesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _previousProfileMeta = const VerificationMeta(
    'previousProfile',
  );
  @override
  late final GeneratedColumnWithTypeConverter<Profile, String> previousProfile =
      GeneratedColumn<String>(
        'previous_profile',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<Profile>(
        $PreviousUserProfilesTable.$converterpreviousProfile,
      );
  @override
  List<GeneratedColumn> get $columns => [id, previousProfile];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'previous_user_profiles';
  @override
  VerificationContext validateIntegrity(
    Insertable<PreviousUserProfileData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    context.handle(_previousProfileMeta, const VerificationResult.success());
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PreviousUserProfileData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PreviousUserProfileData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}id'],
          )!,
      previousProfile: $PreviousUserProfilesTable.$converterpreviousProfile
          .fromSql(
            attachedDatabase.typeMapping.read(
              DriftSqlType.string,
              data['${effectivePrefix}previous_profile'],
            )!,
          ),
    );
  }

  @override
  $PreviousUserProfilesTable createAlias(String alias) {
    return $PreviousUserProfilesTable(attachedDatabase, alias);
  }

  static TypeConverter<Profile, String> $converterpreviousProfile =
      const PreviousProfileConverter();
}

class PreviousUserProfileData extends DataClass
    implements Insertable<PreviousUserProfileData> {
  final int id;
  final Profile previousProfile;
  const PreviousUserProfileData({
    required this.id,
    required this.previousProfile,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    {
      map['previous_profile'] = Variable<String>(
        $PreviousUserProfilesTable.$converterpreviousProfile.toSql(
          previousProfile,
        ),
      );
    }
    return map;
  }

  PreviousUserProfilesCompanion toCompanion(bool nullToAbsent) {
    return PreviousUserProfilesCompanion(
      id: Value(id),
      previousProfile: Value(previousProfile),
    );
  }

  factory PreviousUserProfileData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PreviousUserProfileData(
      id: serializer.fromJson<int>(json['id']),
      previousProfile: serializer.fromJson<Profile>(json['previousProfile']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'previousProfile': serializer.toJson<Profile>(previousProfile),
    };
  }

  PreviousUserProfileData copyWith({int? id, Profile? previousProfile}) =>
      PreviousUserProfileData(
        id: id ?? this.id,
        previousProfile: previousProfile ?? this.previousProfile,
      );
  PreviousUserProfileData copyWithCompanion(
    PreviousUserProfilesCompanion data,
  ) {
    return PreviousUserProfileData(
      id: data.id.present ? data.id.value : this.id,
      previousProfile:
          data.previousProfile.present
              ? data.previousProfile.value
              : this.previousProfile,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PreviousUserProfileData(')
          ..write('id: $id, ')
          ..write('previousProfile: $previousProfile')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, previousProfile);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PreviousUserProfileData &&
          other.id == this.id &&
          other.previousProfile == this.previousProfile);
}

class PreviousUserProfilesCompanion
    extends UpdateCompanion<PreviousUserProfileData> {
  final Value<int> id;
  final Value<Profile> previousProfile;
  const PreviousUserProfilesCompanion({
    this.id = const Value.absent(),
    this.previousProfile = const Value.absent(),
  });
  PreviousUserProfilesCompanion.insert({
    this.id = const Value.absent(),
    required Profile previousProfile,
  }) : previousProfile = Value(previousProfile);
  static Insertable<PreviousUserProfileData> custom({
    Expression<int>? id,
    Expression<String>? previousProfile,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (previousProfile != null) 'previous_profile': previousProfile,
    });
  }

  PreviousUserProfilesCompanion copyWith({
    Value<int>? id,
    Value<Profile>? previousProfile,
  }) {
    return PreviousUserProfilesCompanion(
      id: id ?? this.id,
      previousProfile: previousProfile ?? this.previousProfile,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (previousProfile.present) {
      map['previous_profile'] = Variable<String>(
        $PreviousUserProfilesTable.$converterpreviousProfile.toSql(
          previousProfile.value,
        ),
      );
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PreviousUserProfilesCompanion(')
          ..write('id: $id, ')
          ..write('previousProfile: $previousProfile')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UserProfilesTable userProfiles = $UserProfilesTable(this);
  late final $CompanyProfilesTable companyProfiles = $CompanyProfilesTable(
    this,
  );
  late final $GeigerScoresTable geigerScores = $GeigerScoresTable(this);
  late final $NewsInfoTable newsInfo = $NewsInfoTable(this);
  late final $RecommendationsTable recommendations = $RecommendationsTable(
    this,
  );
  late final $RecommendationOfferingsTable recommendationOfferings =
      $RecommendationOfferingsTable(this);
  late final $TodoOfferingsTable todoOfferings = $TodoOfferingsTable(this);
  late final $PreviousUserProfilesTable previousUserProfiles =
      $PreviousUserProfilesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    userProfiles,
    companyProfiles,
    geigerScores,
    newsInfo,
    recommendations,
    recommendationOfferings,
    todoOfferings,
    previousUserProfiles,
  ];
}

typedef $$UserProfilesTableCreateCompanionBuilder =
    UserProfilesCompanion Function({
      required String userId,
      Value<String?> name,
      Value<String?> email,
      Value<bool> owner,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });
typedef $$UserProfilesTableUpdateCompanionBuilder =
    UserProfilesCompanion Function({
      Value<String> userId,
      Value<String?> name,
      Value<String?> email,
      Value<bool> owner,
      Value<DateTime> createdAt,
      Value<int> rowid,
    });

final class $$UserProfilesTableReferences
    extends BaseReferences<_$AppDatabase, $UserProfilesTable, UserProfileData> {
  $$UserProfilesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$CompanyProfilesTable, List<CompanyProfileData>>
  _companyProfilesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.companyProfiles,
    aliasName: $_aliasNameGenerator(
      db.userProfiles.userId,
      db.companyProfiles.userId,
    ),
  );

  $$CompanyProfilesTableProcessedTableManager get companyProfilesRefs {
    final manager = $$CompanyProfilesTableTableManager(
      $_db,
      $_db.companyProfiles,
    ).filter(
      (f) => f.userId.userId.sqlEquals($_itemColumn<String>('user_id')!),
    );

    final cache = $_typedResult.readTableOrNull(
      _companyProfilesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$GeigerScoresTable, List<GeigerScoreData>>
  _geigerScoresRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.geigerScores,
    aliasName: $_aliasNameGenerator(
      db.userProfiles.userId,
      db.geigerScores.userId,
    ),
  );

  $$GeigerScoresTableProcessedTableManager get geigerScoresRefs {
    final manager = $$GeigerScoresTableTableManager(
      $_db,
      $_db.geigerScores,
    ).filter(
      (f) => f.userId.userId.sqlEquals($_itemColumn<String>('user_id')!),
    );

    final cache = $_typedResult.readTableOrNull(_geigerScoresRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$UserProfilesTableFilterComposer
    extends Composer<_$AppDatabase, $UserProfilesTable> {
  $$UserProfilesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get owner => $composableBuilder(
    column: $table.owner,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> companyProfilesRefs(
    Expression<bool> Function($$CompanyProfilesTableFilterComposer f) f,
  ) {
    final $$CompanyProfilesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.companyProfiles,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CompanyProfilesTableFilterComposer(
            $db: $db,
            $table: $db.companyProfiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> geigerScoresRefs(
    Expression<bool> Function($$GeigerScoresTableFilterComposer f) f,
  ) {
    final $$GeigerScoresTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.geigerScores,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GeigerScoresTableFilterComposer(
            $db: $db,
            $table: $db.geigerScores,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
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
  ColumnOrderings<String> get userId => $composableBuilder(
    column: $table.userId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get owner => $composableBuilder(
    column: $table.owner,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
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
  GeneratedColumn<String> get userId =>
      $composableBuilder(column: $table.userId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<bool> get owner =>
      $composableBuilder(column: $table.owner, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> companyProfilesRefs<T extends Object>(
    Expression<T> Function($$CompanyProfilesTableAnnotationComposer a) f,
  ) {
    final $$CompanyProfilesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.companyProfiles,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CompanyProfilesTableAnnotationComposer(
            $db: $db,
            $table: $db.companyProfiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> geigerScoresRefs<T extends Object>(
    Expression<T> Function($$GeigerScoresTableAnnotationComposer a) f,
  ) {
    final $$GeigerScoresTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.geigerScores,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GeigerScoresTableAnnotationComposer(
            $db: $db,
            $table: $db.geigerScores,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UserProfilesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UserProfilesTable,
          UserProfileData,
          $$UserProfilesTableFilterComposer,
          $$UserProfilesTableOrderingComposer,
          $$UserProfilesTableAnnotationComposer,
          $$UserProfilesTableCreateCompanionBuilder,
          $$UserProfilesTableUpdateCompanionBuilder,
          (UserProfileData, $$UserProfilesTableReferences),
          UserProfileData,
          PrefetchHooks Function({
            bool companyProfilesRefs,
            bool geigerScoresRefs,
          })
        > {
  $$UserProfilesTableTableManager(_$AppDatabase db, $UserProfilesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$UserProfilesTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$UserProfilesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () =>
                  $$UserProfilesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> userId = const Value.absent(),
                Value<String?> name = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<bool> owner = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UserProfilesCompanion(
                userId: userId,
                name: name,
                email: email,
                owner: owner,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String userId,
                Value<String?> name = const Value.absent(),
                Value<String?> email = const Value.absent(),
                Value<bool> owner = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => UserProfilesCompanion.insert(
                userId: userId,
                name: name,
                email: email,
                owner: owner,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$UserProfilesTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({
            companyProfilesRefs = false,
            geigerScoresRefs = false,
          }) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (companyProfilesRefs) db.companyProfiles,
                if (geigerScoresRefs) db.geigerScores,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (companyProfilesRefs)
                    await $_getPrefetchedData<
                      UserProfileData,
                      $UserProfilesTable,
                      CompanyProfileData
                    >(
                      currentTable: table,
                      referencedTable: $$UserProfilesTableReferences
                          ._companyProfilesRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$UserProfilesTableReferences(
                                db,
                                table,
                                p0,
                              ).companyProfilesRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.userId == item.userId,
                          ),
                      typedResults: items,
                    ),
                  if (geigerScoresRefs)
                    await $_getPrefetchedData<
                      UserProfileData,
                      $UserProfilesTable,
                      GeigerScoreData
                    >(
                      currentTable: table,
                      referencedTable: $$UserProfilesTableReferences
                          ._geigerScoresRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$UserProfilesTableReferences(
                                db,
                                table,
                                p0,
                              ).geigerScoresRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.userId == item.userId,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$UserProfilesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UserProfilesTable,
      UserProfileData,
      $$UserProfilesTableFilterComposer,
      $$UserProfilesTableOrderingComposer,
      $$UserProfilesTableAnnotationComposer,
      $$UserProfilesTableCreateCompanionBuilder,
      $$UserProfilesTableUpdateCompanionBuilder,
      (UserProfileData, $$UserProfilesTableReferences),
      UserProfileData,
      PrefetchHooks Function({bool companyProfilesRefs, bool geigerScoresRefs})
    >;
typedef $$CompanyProfilesTableCreateCompanionBuilder =
    CompanyProfilesCompanion Function({
      required String companyName,
      required String userId,
      required String location,
      required String description,
      Value<int> rowid,
    });
typedef $$CompanyProfilesTableUpdateCompanionBuilder =
    CompanyProfilesCompanion Function({
      Value<String> companyName,
      Value<String> userId,
      Value<String> location,
      Value<String> description,
      Value<int> rowid,
    });

final class $$CompanyProfilesTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $CompanyProfilesTable,
          CompanyProfileData
        > {
  $$CompanyProfilesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $UserProfilesTable _userIdTable(_$AppDatabase db) =>
      db.userProfiles.createAlias(
        $_aliasNameGenerator(db.companyProfiles.userId, db.userProfiles.userId),
      );

  $$UserProfilesTableProcessedTableManager get userId {
    final $_column = $_itemColumn<String>('user_id')!;

    final manager = $$UserProfilesTableTableManager(
      $_db,
      $_db.userProfiles,
    ).filter((f) => f.userId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CompanyProfilesTableFilterComposer
    extends Composer<_$AppDatabase, $CompanyProfilesTable> {
  $$CompanyProfilesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get companyName => $composableBuilder(
    column: $table.companyName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  $$UserProfilesTableFilterComposer get userId {
    final $$UserProfilesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.userProfiles,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserProfilesTableFilterComposer(
            $db: $db,
            $table: $db.userProfiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CompanyProfilesTableOrderingComposer
    extends Composer<_$AppDatabase, $CompanyProfilesTable> {
  $$CompanyProfilesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get companyName => $composableBuilder(
    column: $table.companyName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get location => $composableBuilder(
    column: $table.location,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  $$UserProfilesTableOrderingComposer get userId {
    final $$UserProfilesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.userProfiles,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserProfilesTableOrderingComposer(
            $db: $db,
            $table: $db.userProfiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CompanyProfilesTableAnnotationComposer
    extends Composer<_$AppDatabase, $CompanyProfilesTable> {
  $$CompanyProfilesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get companyName => $composableBuilder(
    column: $table.companyName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get location =>
      $composableBuilder(column: $table.location, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  $$UserProfilesTableAnnotationComposer get userId {
    final $$UserProfilesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.userProfiles,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserProfilesTableAnnotationComposer(
            $db: $db,
            $table: $db.userProfiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CompanyProfilesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CompanyProfilesTable,
          CompanyProfileData,
          $$CompanyProfilesTableFilterComposer,
          $$CompanyProfilesTableOrderingComposer,
          $$CompanyProfilesTableAnnotationComposer,
          $$CompanyProfilesTableCreateCompanionBuilder,
          $$CompanyProfilesTableUpdateCompanionBuilder,
          (CompanyProfileData, $$CompanyProfilesTableReferences),
          CompanyProfileData,
          PrefetchHooks Function({bool userId})
        > {
  $$CompanyProfilesTableTableManager(
    _$AppDatabase db,
    $CompanyProfilesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () =>
                  $$CompanyProfilesTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$CompanyProfilesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$CompanyProfilesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> companyName = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String> location = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => CompanyProfilesCompanion(
                companyName: companyName,
                userId: userId,
                location: location,
                description: description,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String companyName,
                required String userId,
                required String location,
                required String description,
                Value<int> rowid = const Value.absent(),
              }) => CompanyProfilesCompanion.insert(
                companyName: companyName,
                userId: userId,
                location: location,
                description: description,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$CompanyProfilesTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({userId = false}) {
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
                  dynamic
                >
              >(state) {
                if (userId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.userId,
                            referencedTable: $$CompanyProfilesTableReferences
                                ._userIdTable(db),
                            referencedColumn:
                                $$CompanyProfilesTableReferences
                                    ._userIdTable(db)
                                    .userId,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$CompanyProfilesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CompanyProfilesTable,
      CompanyProfileData,
      $$CompanyProfilesTableFilterComposer,
      $$CompanyProfilesTableOrderingComposer,
      $$CompanyProfilesTableAnnotationComposer,
      $$CompanyProfilesTableCreateCompanionBuilder,
      $$CompanyProfilesTableUpdateCompanionBuilder,
      (CompanyProfileData, $$CompanyProfilesTableReferences),
      CompanyProfileData,
      PrefetchHooks Function({bool userId})
    >;
typedef $$GeigerScoresTableCreateCompanionBuilder =
    GeigerScoresCompanion Function({
      Value<int> id,
      required String userId,
      required String reason,
      required String interpretation,
      required int score,
      Value<DateTime> lastUpdated,
    });
typedef $$GeigerScoresTableUpdateCompanionBuilder =
    GeigerScoresCompanion Function({
      Value<int> id,
      Value<String> userId,
      Value<String> reason,
      Value<String> interpretation,
      Value<int> score,
      Value<DateTime> lastUpdated,
    });

final class $$GeigerScoresTableReferences
    extends BaseReferences<_$AppDatabase, $GeigerScoresTable, GeigerScoreData> {
  $$GeigerScoresTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UserProfilesTable _userIdTable(_$AppDatabase db) =>
      db.userProfiles.createAlias(
        $_aliasNameGenerator(db.geigerScores.userId, db.userProfiles.userId),
      );

  $$UserProfilesTableProcessedTableManager get userId {
    final $_column = $_itemColumn<String>('user_id')!;

    final manager = $$UserProfilesTableTableManager(
      $_db,
      $_db.userProfiles,
    ).filter((f) => f.userId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
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
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get reason => $composableBuilder(
    column: $table.reason,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get interpretation => $composableBuilder(
    column: $table.interpretation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get score => $composableBuilder(
    column: $table.score,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastUpdated => $composableBuilder(
    column: $table.lastUpdated,
    builder: (column) => ColumnFilters(column),
  );

  $$UserProfilesTableFilterComposer get userId {
    final $$UserProfilesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.userProfiles,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserProfilesTableFilterComposer(
            $db: $db,
            $table: $db.userProfiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
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
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get reason => $composableBuilder(
    column: $table.reason,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get interpretation => $composableBuilder(
    column: $table.interpretation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get score => $composableBuilder(
    column: $table.score,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastUpdated => $composableBuilder(
    column: $table.lastUpdated,
    builder: (column) => ColumnOrderings(column),
  );

  $$UserProfilesTableOrderingComposer get userId {
    final $$UserProfilesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.userProfiles,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserProfilesTableOrderingComposer(
            $db: $db,
            $table: $db.userProfiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
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
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get reason =>
      $composableBuilder(column: $table.reason, builder: (column) => column);

  GeneratedColumn<String> get interpretation => $composableBuilder(
    column: $table.interpretation,
    builder: (column) => column,
  );

  GeneratedColumn<int> get score =>
      $composableBuilder(column: $table.score, builder: (column) => column);

  GeneratedColumn<DateTime> get lastUpdated => $composableBuilder(
    column: $table.lastUpdated,
    builder: (column) => column,
  );

  $$UserProfilesTableAnnotationComposer get userId {
    final $$UserProfilesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.userProfiles,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UserProfilesTableAnnotationComposer(
            $db: $db,
            $table: $db.userProfiles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$GeigerScoresTableTableManager
    extends
        RootTableManager<
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
          PrefetchHooks Function({bool userId})
        > {
  $$GeigerScoresTableTableManager(_$AppDatabase db, $GeigerScoresTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$GeigerScoresTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$GeigerScoresTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () =>
                  $$GeigerScoresTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> userId = const Value.absent(),
                Value<String> reason = const Value.absent(),
                Value<String> interpretation = const Value.absent(),
                Value<int> score = const Value.absent(),
                Value<DateTime> lastUpdated = const Value.absent(),
              }) => GeigerScoresCompanion(
                id: id,
                userId: userId,
                reason: reason,
                interpretation: interpretation,
                score: score,
                lastUpdated: lastUpdated,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String userId,
                required String reason,
                required String interpretation,
                required int score,
                Value<DateTime> lastUpdated = const Value.absent(),
              }) => GeigerScoresCompanion.insert(
                id: id,
                userId: userId,
                reason: reason,
                interpretation: interpretation,
                score: score,
                lastUpdated: lastUpdated,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$GeigerScoresTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({userId = false}) {
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
                  dynamic
                >
              >(state) {
                if (userId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.userId,
                            referencedTable: $$GeigerScoresTableReferences
                                ._userIdTable(db),
                            referencedColumn:
                                $$GeigerScoresTableReferences
                                    ._userIdTable(db)
                                    .userId,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$GeigerScoresTableProcessedTableManager =
    ProcessedTableManager<
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
      PrefetchHooks Function({bool userId})
    >;
typedef $$NewsInfoTableCreateCompanionBuilder =
    NewsInfoCompanion Function({
      required String id,
      required String title,
      required String summary,
      required String newsCategorg,
      required String imageUrl,
      required DateTime dateCreated,
      Value<int> rowid,
    });
typedef $$NewsInfoTableUpdateCompanionBuilder =
    NewsInfoCompanion Function({
      Value<String> id,
      Value<String> title,
      Value<String> summary,
      Value<String> newsCategorg,
      Value<String> imageUrl,
      Value<DateTime> dateCreated,
      Value<int> rowid,
    });

final class $$NewsInfoTableReferences
    extends BaseReferences<_$AppDatabase, $NewsInfoTable, NewsData> {
  $$NewsInfoTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$RecommendationsTable, List<RecommendationData>>
  _recommendationsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.recommendations,
    aliasName: $_aliasNameGenerator(db.newsInfo.id, db.recommendations.newsId),
  );

  $$RecommendationsTableProcessedTableManager get recommendationsRefs {
    final manager = $$RecommendationsTableTableManager(
      $_db,
      $_db.recommendations,
    ).filter((f) => f.newsId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _recommendationsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
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
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get summary => $composableBuilder(
    column: $table.summary,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get newsCategorg => $composableBuilder(
    column: $table.newsCategorg,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dateCreated => $composableBuilder(
    column: $table.dateCreated,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> recommendationsRefs(
    Expression<bool> Function($$RecommendationsTableFilterComposer f) f,
  ) {
    final $$RecommendationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.recommendations,
      getReferencedColumn: (t) => t.newsId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecommendationsTableFilterComposer(
            $db: $db,
            $table: $db.recommendations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
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
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get summary => $composableBuilder(
    column: $table.summary,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get newsCategorg => $composableBuilder(
    column: $table.newsCategorg,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dateCreated => $composableBuilder(
    column: $table.dateCreated,
    builder: (column) => ColumnOrderings(column),
  );
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

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get summary =>
      $composableBuilder(column: $table.summary, builder: (column) => column);

  GeneratedColumn<String> get newsCategorg => $composableBuilder(
    column: $table.newsCategorg,
    builder: (column) => column,
  );

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<DateTime> get dateCreated => $composableBuilder(
    column: $table.dateCreated,
    builder: (column) => column,
  );

  Expression<T> recommendationsRefs<T extends Object>(
    Expression<T> Function($$RecommendationsTableAnnotationComposer a) f,
  ) {
    final $$RecommendationsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.recommendations,
      getReferencedColumn: (t) => t.newsId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecommendationsTableAnnotationComposer(
            $db: $db,
            $table: $db.recommendations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$NewsInfoTableTableManager
    extends
        RootTableManager<
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
          PrefetchHooks Function({bool recommendationsRefs})
        > {
  $$NewsInfoTableTableManager(_$AppDatabase db, $NewsInfoTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$NewsInfoTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$NewsInfoTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$NewsInfoTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> summary = const Value.absent(),
                Value<String> newsCategorg = const Value.absent(),
                Value<String> imageUrl = const Value.absent(),
                Value<DateTime> dateCreated = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => NewsInfoCompanion(
                id: id,
                title: title,
                summary: summary,
                newsCategorg: newsCategorg,
                imageUrl: imageUrl,
                dateCreated: dateCreated,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String title,
                required String summary,
                required String newsCategorg,
                required String imageUrl,
                required DateTime dateCreated,
                Value<int> rowid = const Value.absent(),
              }) => NewsInfoCompanion.insert(
                id: id,
                title: title,
                summary: summary,
                newsCategorg: newsCategorg,
                imageUrl: imageUrl,
                dateCreated: dateCreated,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$NewsInfoTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({recommendationsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (recommendationsRefs) db.recommendations,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (recommendationsRefs)
                    await $_getPrefetchedData<
                      NewsData,
                      $NewsInfoTable,
                      RecommendationData
                    >(
                      currentTable: table,
                      referencedTable: $$NewsInfoTableReferences
                          ._recommendationsRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$NewsInfoTableReferences(
                                db,
                                table,
                                p0,
                              ).recommendationsRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) =>
                              referencedItems.where((e) => e.newsId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$NewsInfoTableProcessedTableManager =
    ProcessedTableManager<
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
      PrefetchHooks Function({bool recommendationsRefs})
    >;
typedef $$RecommendationsTableCreateCompanionBuilder =
    RecommendationsCompanion Function({
      required String id,
      required String newsId,
      required String name,
      required String rationale,
      Value<int> rowid,
    });
typedef $$RecommendationsTableUpdateCompanionBuilder =
    RecommendationsCompanion Function({
      Value<String> id,
      Value<String> newsId,
      Value<String> name,
      Value<String> rationale,
      Value<int> rowid,
    });

final class $$RecommendationsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $RecommendationsTable,
          RecommendationData
        > {
  $$RecommendationsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $NewsInfoTable _newsIdTable(_$AppDatabase db) =>
      db.newsInfo.createAlias(
        $_aliasNameGenerator(db.recommendations.newsId, db.newsInfo.id),
      );

  $$NewsInfoTableProcessedTableManager get newsId {
    final $_column = $_itemColumn<String>('news_id')!;

    final manager = $$NewsInfoTableTableManager(
      $_db,
      $_db.newsInfo,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_newsIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<
    $RecommendationOfferingsTable,
    List<RecommendationOfferingData>
  >
  _recommendationOfferingsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.recommendationOfferings,
        aliasName: $_aliasNameGenerator(
          db.recommendations.id,
          db.recommendationOfferings.recommendationId,
        ),
      );

  $$RecommendationOfferingsTableProcessedTableManager
  get recommendationOfferingsRefs {
    final manager = $$RecommendationOfferingsTableTableManager(
      $_db,
      $_db.recommendationOfferings,
    ).filter(
      (f) => f.recommendationId.id.sqlEquals($_itemColumn<String>('id')!),
    );

    final cache = $_typedResult.readTableOrNull(
      _recommendationOfferingsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
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
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get rationale => $composableBuilder(
    column: $table.rationale,
    builder: (column) => ColumnFilters(column),
  );

  $$NewsInfoTableFilterComposer get newsId {
    final $$NewsInfoTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.newsId,
      referencedTable: $db.newsInfo,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NewsInfoTableFilterComposer(
            $db: $db,
            $table: $db.newsInfo,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> recommendationOfferingsRefs(
    Expression<bool> Function($$RecommendationOfferingsTableFilterComposer f) f,
  ) {
    final $$RecommendationOfferingsTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.recommendationOfferings,
          getReferencedColumn: (t) => t.recommendationId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RecommendationOfferingsTableFilterComposer(
                $db: $db,
                $table: $db.recommendationOfferings,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
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
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get rationale => $composableBuilder(
    column: $table.rationale,
    builder: (column) => ColumnOrderings(column),
  );

  $$NewsInfoTableOrderingComposer get newsId {
    final $$NewsInfoTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.newsId,
      referencedTable: $db.newsInfo,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NewsInfoTableOrderingComposer(
            $db: $db,
            $table: $db.newsInfo,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
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

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get rationale =>
      $composableBuilder(column: $table.rationale, builder: (column) => column);

  $$NewsInfoTableAnnotationComposer get newsId {
    final $$NewsInfoTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.newsId,
      referencedTable: $db.newsInfo,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$NewsInfoTableAnnotationComposer(
            $db: $db,
            $table: $db.newsInfo,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> recommendationOfferingsRefs<T extends Object>(
    Expression<T> Function($$RecommendationOfferingsTableAnnotationComposer a)
    f,
  ) {
    final $$RecommendationOfferingsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.recommendationOfferings,
          getReferencedColumn: (t) => t.recommendationId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RecommendationOfferingsTableAnnotationComposer(
                $db: $db,
                $table: $db.recommendationOfferings,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$RecommendationsTableTableManager
    extends
        RootTableManager<
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
          PrefetchHooks Function({
            bool newsId,
            bool recommendationOfferingsRefs,
          })
        > {
  $$RecommendationsTableTableManager(
    _$AppDatabase db,
    $RecommendationsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () =>
                  $$RecommendationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$RecommendationsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$RecommendationsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> newsId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> rationale = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RecommendationsCompanion(
                id: id,
                newsId: newsId,
                name: name,
                rationale: rationale,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String newsId,
                required String name,
                required String rationale,
                Value<int> rowid = const Value.absent(),
              }) => RecommendationsCompanion.insert(
                id: id,
                newsId: newsId,
                name: name,
                rationale: rationale,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$RecommendationsTableReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({
            newsId = false,
            recommendationOfferingsRefs = false,
          }) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (recommendationOfferingsRefs) db.recommendationOfferings,
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
                  dynamic
                >
              >(state) {
                if (newsId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.newsId,
                            referencedTable: $$RecommendationsTableReferences
                                ._newsIdTable(db),
                            referencedColumn:
                                $$RecommendationsTableReferences
                                    ._newsIdTable(db)
                                    .id,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (recommendationOfferingsRefs)
                    await $_getPrefetchedData<
                      RecommendationData,
                      $RecommendationsTable,
                      RecommendationOfferingData
                    >(
                      currentTable: table,
                      referencedTable: $$RecommendationsTableReferences
                          ._recommendationOfferingsRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$RecommendationsTableReferences(
                                db,
                                table,
                                p0,
                              ).recommendationOfferingsRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.recommendationId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$RecommendationsTableProcessedTableManager =
    ProcessedTableManager<
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
      PrefetchHooks Function({bool newsId, bool recommendationOfferingsRefs})
    >;
typedef $$RecommendationOfferingsTableCreateCompanionBuilder =
    RecommendationOfferingsCompanion Function({
      required String id,
      required String recommendationId,
      required String name,
      required String summary,
      Value<DateTime> dateRecommendated,
      Value<int> rowid,
    });
typedef $$RecommendationOfferingsTableUpdateCompanionBuilder =
    RecommendationOfferingsCompanion Function({
      Value<String> id,
      Value<String> recommendationId,
      Value<String> name,
      Value<String> summary,
      Value<DateTime> dateRecommendated,
      Value<int> rowid,
    });

final class $$RecommendationOfferingsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $RecommendationOfferingsTable,
          RecommendationOfferingData
        > {
  $$RecommendationOfferingsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $RecommendationsTable _recommendationIdTable(_$AppDatabase db) =>
      db.recommendations.createAlias(
        $_aliasNameGenerator(
          db.recommendationOfferings.recommendationId,
          db.recommendations.id,
        ),
      );

  $$RecommendationsTableProcessedTableManager get recommendationId {
    final $_column = $_itemColumn<String>('recommendation_id')!;

    final manager = $$RecommendationsTableTableManager(
      $_db,
      $_db.recommendations,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_recommendationIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$TodoOfferingsTable, List<TodoOfferingData>>
  _todoOfferingsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.todoOfferings,
    aliasName: $_aliasNameGenerator(
      db.recommendationOfferings.id,
      db.todoOfferings.offeringId,
    ),
  );

  $$TodoOfferingsTableProcessedTableManager get todoOfferingsRefs {
    final manager = $$TodoOfferingsTableTableManager(
      $_db,
      $_db.todoOfferings,
    ).filter((f) => f.offeringId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_todoOfferingsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$RecommendationOfferingsTableFilterComposer
    extends Composer<_$AppDatabase, $RecommendationOfferingsTable> {
  $$RecommendationOfferingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get summary => $composableBuilder(
    column: $table.summary,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get dateRecommendated => $composableBuilder(
    column: $table.dateRecommendated,
    builder: (column) => ColumnFilters(column),
  );

  $$RecommendationsTableFilterComposer get recommendationId {
    final $$RecommendationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recommendationId,
      referencedTable: $db.recommendations,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecommendationsTableFilterComposer(
            $db: $db,
            $table: $db.recommendations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> todoOfferingsRefs(
    Expression<bool> Function($$TodoOfferingsTableFilterComposer f) f,
  ) {
    final $$TodoOfferingsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.todoOfferings,
      getReferencedColumn: (t) => t.offeringId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TodoOfferingsTableFilterComposer(
            $db: $db,
            $table: $db.todoOfferings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RecommendationOfferingsTableOrderingComposer
    extends Composer<_$AppDatabase, $RecommendationOfferingsTable> {
  $$RecommendationOfferingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get summary => $composableBuilder(
    column: $table.summary,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get dateRecommendated => $composableBuilder(
    column: $table.dateRecommendated,
    builder: (column) => ColumnOrderings(column),
  );

  $$RecommendationsTableOrderingComposer get recommendationId {
    final $$RecommendationsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recommendationId,
      referencedTable: $db.recommendations,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecommendationsTableOrderingComposer(
            $db: $db,
            $table: $db.recommendations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RecommendationOfferingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $RecommendationOfferingsTable> {
  $$RecommendationOfferingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get summary =>
      $composableBuilder(column: $table.summary, builder: (column) => column);

  GeneratedColumn<DateTime> get dateRecommendated => $composableBuilder(
    column: $table.dateRecommendated,
    builder: (column) => column,
  );

  $$RecommendationsTableAnnotationComposer get recommendationId {
    final $$RecommendationsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recommendationId,
      referencedTable: $db.recommendations,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecommendationsTableAnnotationComposer(
            $db: $db,
            $table: $db.recommendations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> todoOfferingsRefs<T extends Object>(
    Expression<T> Function($$TodoOfferingsTableAnnotationComposer a) f,
  ) {
    final $$TodoOfferingsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.todoOfferings,
      getReferencedColumn: (t) => t.offeringId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$TodoOfferingsTableAnnotationComposer(
            $db: $db,
            $table: $db.todoOfferings,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RecommendationOfferingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RecommendationOfferingsTable,
          RecommendationOfferingData,
          $$RecommendationOfferingsTableFilterComposer,
          $$RecommendationOfferingsTableOrderingComposer,
          $$RecommendationOfferingsTableAnnotationComposer,
          $$RecommendationOfferingsTableCreateCompanionBuilder,
          $$RecommendationOfferingsTableUpdateCompanionBuilder,
          (
            RecommendationOfferingData,
            $$RecommendationOfferingsTableReferences,
          ),
          RecommendationOfferingData,
          PrefetchHooks Function({
            bool recommendationId,
            bool todoOfferingsRefs,
          })
        > {
  $$RecommendationOfferingsTableTableManager(
    _$AppDatabase db,
    $RecommendationOfferingsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$RecommendationOfferingsTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer:
              () => $$RecommendationOfferingsTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$RecommendationOfferingsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> recommendationId = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> summary = const Value.absent(),
                Value<DateTime> dateRecommendated = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RecommendationOfferingsCompanion(
                id: id,
                recommendationId: recommendationId,
                name: name,
                summary: summary,
                dateRecommendated: dateRecommendated,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String recommendationId,
                required String name,
                required String summary,
                Value<DateTime> dateRecommendated = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RecommendationOfferingsCompanion.insert(
                id: id,
                recommendationId: recommendationId,
                name: name,
                summary: summary,
                dateRecommendated: dateRecommendated,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$RecommendationOfferingsTableReferences(
                            db,
                            table,
                            e,
                          ),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: ({
            recommendationId = false,
            todoOfferingsRefs = false,
          }) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (todoOfferingsRefs) db.todoOfferings,
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
                  dynamic
                >
              >(state) {
                if (recommendationId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.recommendationId,
                            referencedTable:
                                $$RecommendationOfferingsTableReferences
                                    ._recommendationIdTable(db),
                            referencedColumn:
                                $$RecommendationOfferingsTableReferences
                                    ._recommendationIdTable(db)
                                    .id,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (todoOfferingsRefs)
                    await $_getPrefetchedData<
                      RecommendationOfferingData,
                      $RecommendationOfferingsTable,
                      TodoOfferingData
                    >(
                      currentTable: table,
                      referencedTable: $$RecommendationOfferingsTableReferences
                          ._todoOfferingsRefsTable(db),
                      managerFromTypedResult:
                          (p0) =>
                              $$RecommendationOfferingsTableReferences(
                                db,
                                table,
                                p0,
                              ).todoOfferingsRefs,
                      referencedItemsForCurrentItem:
                          (item, referencedItems) => referencedItems.where(
                            (e) => e.offeringId == item.id,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$RecommendationOfferingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RecommendationOfferingsTable,
      RecommendationOfferingData,
      $$RecommendationOfferingsTableFilterComposer,
      $$RecommendationOfferingsTableOrderingComposer,
      $$RecommendationOfferingsTableAnnotationComposer,
      $$RecommendationOfferingsTableCreateCompanionBuilder,
      $$RecommendationOfferingsTableUpdateCompanionBuilder,
      (RecommendationOfferingData, $$RecommendationOfferingsTableReferences),
      RecommendationOfferingData,
      PrefetchHooks Function({bool recommendationId, bool todoOfferingsRefs})
    >;
typedef $$TodoOfferingsTableCreateCompanionBuilder =
    TodoOfferingsCompanion Function({
      required String offeringId,
      required OfferingStatus offeringStatus,
      Value<DateTime> lastUpdated,
      Value<int> rowid,
    });
typedef $$TodoOfferingsTableUpdateCompanionBuilder =
    TodoOfferingsCompanion Function({
      Value<String> offeringId,
      Value<OfferingStatus> offeringStatus,
      Value<DateTime> lastUpdated,
      Value<int> rowid,
    });

final class $$TodoOfferingsTableReferences
    extends
        BaseReferences<_$AppDatabase, $TodoOfferingsTable, TodoOfferingData> {
  $$TodoOfferingsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $RecommendationOfferingsTable _offeringIdTable(_$AppDatabase db) =>
      db.recommendationOfferings.createAlias(
        $_aliasNameGenerator(
          db.todoOfferings.offeringId,
          db.recommendationOfferings.id,
        ),
      );

  $$RecommendationOfferingsTableProcessedTableManager get offeringId {
    final $_column = $_itemColumn<String>('offering_id')!;

    final manager = $$RecommendationOfferingsTableTableManager(
      $_db,
      $_db.recommendationOfferings,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_offeringIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$TodoOfferingsTableFilterComposer
    extends Composer<_$AppDatabase, $TodoOfferingsTable> {
  $$TodoOfferingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnWithTypeConverterFilters<OfferingStatus, OfferingStatus, int>
  get offeringStatus => $composableBuilder(
    column: $table.offeringStatus,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnFilters<DateTime> get lastUpdated => $composableBuilder(
    column: $table.lastUpdated,
    builder: (column) => ColumnFilters(column),
  );

  $$RecommendationOfferingsTableFilterComposer get offeringId {
    final $$RecommendationOfferingsTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.offeringId,
          referencedTable: $db.recommendationOfferings,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RecommendationOfferingsTableFilterComposer(
                $db: $db,
                $table: $db.recommendationOfferings,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$TodoOfferingsTableOrderingComposer
    extends Composer<_$AppDatabase, $TodoOfferingsTable> {
  $$TodoOfferingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get offeringStatus => $composableBuilder(
    column: $table.offeringStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastUpdated => $composableBuilder(
    column: $table.lastUpdated,
    builder: (column) => ColumnOrderings(column),
  );

  $$RecommendationOfferingsTableOrderingComposer get offeringId {
    final $$RecommendationOfferingsTableOrderingComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.offeringId,
          referencedTable: $db.recommendationOfferings,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RecommendationOfferingsTableOrderingComposer(
                $db: $db,
                $table: $db.recommendationOfferings,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$TodoOfferingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $TodoOfferingsTable> {
  $$TodoOfferingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumnWithTypeConverter<OfferingStatus, int> get offeringStatus =>
      $composableBuilder(
        column: $table.offeringStatus,
        builder: (column) => column,
      );

  GeneratedColumn<DateTime> get lastUpdated => $composableBuilder(
    column: $table.lastUpdated,
    builder: (column) => column,
  );

  $$RecommendationOfferingsTableAnnotationComposer get offeringId {
    final $$RecommendationOfferingsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.offeringId,
          referencedTable: $db.recommendationOfferings,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RecommendationOfferingsTableAnnotationComposer(
                $db: $db,
                $table: $db.recommendationOfferings,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$TodoOfferingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $TodoOfferingsTable,
          TodoOfferingData,
          $$TodoOfferingsTableFilterComposer,
          $$TodoOfferingsTableOrderingComposer,
          $$TodoOfferingsTableAnnotationComposer,
          $$TodoOfferingsTableCreateCompanionBuilder,
          $$TodoOfferingsTableUpdateCompanionBuilder,
          (TodoOfferingData, $$TodoOfferingsTableReferences),
          TodoOfferingData,
          PrefetchHooks Function({bool offeringId})
        > {
  $$TodoOfferingsTableTableManager(_$AppDatabase db, $TodoOfferingsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$TodoOfferingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () =>
                  $$TodoOfferingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$TodoOfferingsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> offeringId = const Value.absent(),
                Value<OfferingStatus> offeringStatus = const Value.absent(),
                Value<DateTime> lastUpdated = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TodoOfferingsCompanion(
                offeringId: offeringId,
                offeringStatus: offeringStatus,
                lastUpdated: lastUpdated,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String offeringId,
                required OfferingStatus offeringStatus,
                Value<DateTime> lastUpdated = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => TodoOfferingsCompanion.insert(
                offeringId: offeringId,
                offeringStatus: offeringStatus,
                lastUpdated: lastUpdated,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          $$TodoOfferingsTableReferences(db, table, e),
                        ),
                      )
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
                  dynamic
                >
              >(state) {
                if (offeringId) {
                  state =
                      state.withJoin(
                            currentTable: table,
                            currentColumn: table.offeringId,
                            referencedTable: $$TodoOfferingsTableReferences
                                ._offeringIdTable(db),
                            referencedColumn:
                                $$TodoOfferingsTableReferences
                                    ._offeringIdTable(db)
                                    .id,
                          )
                          as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$TodoOfferingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $TodoOfferingsTable,
      TodoOfferingData,
      $$TodoOfferingsTableFilterComposer,
      $$TodoOfferingsTableOrderingComposer,
      $$TodoOfferingsTableAnnotationComposer,
      $$TodoOfferingsTableCreateCompanionBuilder,
      $$TodoOfferingsTableUpdateCompanionBuilder,
      (TodoOfferingData, $$TodoOfferingsTableReferences),
      TodoOfferingData,
      PrefetchHooks Function({bool offeringId})
    >;
typedef $$PreviousUserProfilesTableCreateCompanionBuilder =
    PreviousUserProfilesCompanion Function({
      Value<int> id,
      required Profile previousProfile,
    });
typedef $$PreviousUserProfilesTableUpdateCompanionBuilder =
    PreviousUserProfilesCompanion Function({
      Value<int> id,
      Value<Profile> previousProfile,
    });

class $$PreviousUserProfilesTableFilterComposer
    extends Composer<_$AppDatabase, $PreviousUserProfilesTable> {
  $$PreviousUserProfilesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<Profile, Profile, String>
  get previousProfile => $composableBuilder(
    column: $table.previousProfile,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );
}

class $$PreviousUserProfilesTableOrderingComposer
    extends Composer<_$AppDatabase, $PreviousUserProfilesTable> {
  $$PreviousUserProfilesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get previousProfile => $composableBuilder(
    column: $table.previousProfile,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PreviousUserProfilesTableAnnotationComposer
    extends Composer<_$AppDatabase, $PreviousUserProfilesTable> {
  $$PreviousUserProfilesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Profile, String> get previousProfile =>
      $composableBuilder(
        column: $table.previousProfile,
        builder: (column) => column,
      );
}

class $$PreviousUserProfilesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PreviousUserProfilesTable,
          PreviousUserProfileData,
          $$PreviousUserProfilesTableFilterComposer,
          $$PreviousUserProfilesTableOrderingComposer,
          $$PreviousUserProfilesTableAnnotationComposer,
          $$PreviousUserProfilesTableCreateCompanionBuilder,
          $$PreviousUserProfilesTableUpdateCompanionBuilder,
          (
            PreviousUserProfileData,
            BaseReferences<
              _$AppDatabase,
              $PreviousUserProfilesTable,
              PreviousUserProfileData
            >,
          ),
          PreviousUserProfileData,
          PrefetchHooks Function()
        > {
  $$PreviousUserProfilesTableTableManager(
    _$AppDatabase db,
    $PreviousUserProfilesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$PreviousUserProfilesTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer:
              () => $$PreviousUserProfilesTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer:
              () => $$PreviousUserProfilesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<Profile> previousProfile = const Value.absent(),
              }) => PreviousUserProfilesCompanion(
                id: id,
                previousProfile: previousProfile,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required Profile previousProfile,
              }) => PreviousUserProfilesCompanion.insert(
                id: id,
                previousProfile: previousProfile,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PreviousUserProfilesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PreviousUserProfilesTable,
      PreviousUserProfileData,
      $$PreviousUserProfilesTableFilterComposer,
      $$PreviousUserProfilesTableOrderingComposer,
      $$PreviousUserProfilesTableAnnotationComposer,
      $$PreviousUserProfilesTableCreateCompanionBuilder,
      $$PreviousUserProfilesTableUpdateCompanionBuilder,
      (
        PreviousUserProfileData,
        BaseReferences<
          _$AppDatabase,
          $PreviousUserProfilesTable,
          PreviousUserProfileData
        >,
      ),
      PreviousUserProfileData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UserProfilesTableTableManager get userProfiles =>
      $$UserProfilesTableTableManager(_db, _db.userProfiles);
  $$CompanyProfilesTableTableManager get companyProfiles =>
      $$CompanyProfilesTableTableManager(_db, _db.companyProfiles);
  $$GeigerScoresTableTableManager get geigerScores =>
      $$GeigerScoresTableTableManager(_db, _db.geigerScores);
  $$NewsInfoTableTableManager get newsInfo =>
      $$NewsInfoTableTableManager(_db, _db.newsInfo);
  $$RecommendationsTableTableManager get recommendations =>
      $$RecommendationsTableTableManager(_db, _db.recommendations);
  $$RecommendationOfferingsTableTableManager get recommendationOfferings =>
      $$RecommendationOfferingsTableTableManager(
        _db,
        _db.recommendationOfferings,
      );
  $$TodoOfferingsTableTableManager get todoOfferings =>
      $$TodoOfferingsTableTableManager(_db, _db.todoOfferings);
  $$PreviousUserProfilesTableTableManager get previousUserProfiles =>
      $$PreviousUserProfilesTableTableManager(_db, _db.previousUserProfiles);
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$appDatabaseHash() => r'52151ad477bef133eeac77644e4c369c875c6c2c';

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
