// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Profile _$ProfileFromJson(Map<String, dynamic> json) {
  return _Profile.fromJson(json);
}

/// @nodoc
mixin _$Profile {
  String get id => throw _privateConstructorUsedError;
  Actor? get actor => throw _privateConstructorUsedError;
  Verb get verb => throw _privateConstructorUsedError;
  Acting? get object => throw _privateConstructorUsedError;
  Result? get result => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;

  /// Serializes this Profile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileCopyWith<Profile> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileCopyWith<$Res> {
  factory $ProfileCopyWith(Profile value, $Res Function(Profile) then) =
      _$ProfileCopyWithImpl<$Res, Profile>;
  @useResult
  $Res call(
      {String id,
      Actor? actor,
      Verb verb,
      Acting? object,
      Result? result,
      DateTime timestamp});

  $ActorCopyWith<$Res>? get actor;
  $VerbCopyWith<$Res> get verb;
  $ActingCopyWith<$Res>? get object;
  $ResultCopyWith<$Res>? get result;
}

/// @nodoc
class _$ProfileCopyWithImpl<$Res, $Val extends Profile>
    implements $ProfileCopyWith<$Res> {
  _$ProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? actor = freezed,
    Object? verb = null,
    Object? object = freezed,
    Object? result = freezed,
    Object? timestamp = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      actor: freezed == actor
          ? _value.actor
          : actor // ignore: cast_nullable_to_non_nullable
              as Actor?,
      verb: null == verb
          ? _value.verb
          : verb // ignore: cast_nullable_to_non_nullable
              as Verb,
      object: freezed == object
          ? _value.object
          : object // ignore: cast_nullable_to_non_nullable
              as Acting?,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as Result?,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ActorCopyWith<$Res>? get actor {
    if (_value.actor == null) {
      return null;
    }

    return $ActorCopyWith<$Res>(_value.actor!, (value) {
      return _then(_value.copyWith(actor: value) as $Val);
    });
  }

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VerbCopyWith<$Res> get verb {
    return $VerbCopyWith<$Res>(_value.verb, (value) {
      return _then(_value.copyWith(verb: value) as $Val);
    });
  }

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ActingCopyWith<$Res>? get object {
    if (_value.object == null) {
      return null;
    }

    return $ActingCopyWith<$Res>(_value.object!, (value) {
      return _then(_value.copyWith(object: value) as $Val);
    });
  }

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResultCopyWith<$Res>? get result {
    if (_value.result == null) {
      return null;
    }

    return $ResultCopyWith<$Res>(_value.result!, (value) {
      return _then(_value.copyWith(result: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProfileImplCopyWith<$Res> implements $ProfileCopyWith<$Res> {
  factory _$$ProfileImplCopyWith(
          _$ProfileImpl value, $Res Function(_$ProfileImpl) then) =
      __$$ProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      Actor? actor,
      Verb verb,
      Acting? object,
      Result? result,
      DateTime timestamp});

  @override
  $ActorCopyWith<$Res>? get actor;
  @override
  $VerbCopyWith<$Res> get verb;
  @override
  $ActingCopyWith<$Res>? get object;
  @override
  $ResultCopyWith<$Res>? get result;
}

/// @nodoc
class __$$ProfileImplCopyWithImpl<$Res>
    extends _$ProfileCopyWithImpl<$Res, _$ProfileImpl>
    implements _$$ProfileImplCopyWith<$Res> {
  __$$ProfileImplCopyWithImpl(
      _$ProfileImpl _value, $Res Function(_$ProfileImpl) _then)
      : super(_value, _then);

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? actor = freezed,
    Object? verb = null,
    Object? object = freezed,
    Object? result = freezed,
    Object? timestamp = null,
  }) {
    return _then(_$ProfileImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      actor: freezed == actor
          ? _value.actor
          : actor // ignore: cast_nullable_to_non_nullable
              as Actor?,
      verb: null == verb
          ? _value.verb
          : verb // ignore: cast_nullable_to_non_nullable
              as Verb,
      object: freezed == object
          ? _value.object
          : object // ignore: cast_nullable_to_non_nullable
              as Acting?,
      result: freezed == result
          ? _value.result
          : result // ignore: cast_nullable_to_non_nullable
              as Result?,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileImpl implements _Profile {
  const _$ProfileImpl(
      {required this.id,
      this.actor,
      required this.verb,
      this.object,
      this.result,
      required this.timestamp});

  factory _$ProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileImplFromJson(json);

  @override
  final String id;
  @override
  final Actor? actor;
  @override
  final Verb verb;
  @override
  final Acting? object;
  @override
  final Result? result;
  @override
  final DateTime timestamp;

  @override
  String toString() {
    return 'Profile(id: $id, actor: $actor, verb: $verb, object: $object, result: $result, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.actor, actor) || other.actor == actor) &&
            (identical(other.verb, verb) || other.verb == verb) &&
            (identical(other.object, object) || other.object == object) &&
            (identical(other.result, result) || other.result == result) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, actor, verb, object, result, timestamp);

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileImplCopyWith<_$ProfileImpl> get copyWith =>
      __$$ProfileImplCopyWithImpl<_$ProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileImplToJson(
      this,
    );
  }
}

abstract class _Profile implements Profile {
  const factory _Profile(
      {required final String id,
      final Actor? actor,
      required final Verb verb,
      final Acting? object,
      final Result? result,
      required final DateTime timestamp}) = _$ProfileImpl;

  factory _Profile.fromJson(Map<String, dynamic> json) = _$ProfileImpl.fromJson;

  @override
  String get id;
  @override
  Actor? get actor;
  @override
  Verb get verb;
  @override
  Acting? get object;
  @override
  Result? get result;
  @override
  DateTime get timestamp;

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileImplCopyWith<_$ProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Actor _$ActorFromJson(Map<String, dynamic> json) {
  return _Actor.fromJson(json);
}

/// @nodoc
mixin _$Actor {
  String? get companyName => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  String? get locale => throw _privateConstructorUsedError;
  String? get companyDescription => throw _privateConstructorUsedError;
  bool? get smeOwner => throw _privateConstructorUsedError;
  List<Asset> get assets => throw _privateConstructorUsedError;

  /// Serializes this Actor to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Actor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ActorCopyWith<Actor> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActorCopyWith<$Res> {
  factory $ActorCopyWith(Actor value, $Res Function(Actor) then) =
      _$ActorCopyWithImpl<$Res, Actor>;
  @useResult
  $Res call(
      {String? companyName,
      String? location,
      String? locale,
      String? companyDescription,
      bool? smeOwner,
      List<Asset> assets});
}

/// @nodoc
class _$ActorCopyWithImpl<$Res, $Val extends Actor>
    implements $ActorCopyWith<$Res> {
  _$ActorCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Actor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? companyName = freezed,
    Object? location = freezed,
    Object? locale = freezed,
    Object? companyDescription = freezed,
    Object? smeOwner = freezed,
    Object? assets = null,
  }) {
    return _then(_value.copyWith(
      companyName: freezed == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      locale: freezed == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String?,
      companyDescription: freezed == companyDescription
          ? _value.companyDescription
          : companyDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      smeOwner: freezed == smeOwner
          ? _value.smeOwner
          : smeOwner // ignore: cast_nullable_to_non_nullable
              as bool?,
      assets: null == assets
          ? _value.assets
          : assets // ignore: cast_nullable_to_non_nullable
              as List<Asset>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ActorImplCopyWith<$Res> implements $ActorCopyWith<$Res> {
  factory _$$ActorImplCopyWith(
          _$ActorImpl value, $Res Function(_$ActorImpl) then) =
      __$$ActorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? companyName,
      String? location,
      String? locale,
      String? companyDescription,
      bool? smeOwner,
      List<Asset> assets});
}

/// @nodoc
class __$$ActorImplCopyWithImpl<$Res>
    extends _$ActorCopyWithImpl<$Res, _$ActorImpl>
    implements _$$ActorImplCopyWith<$Res> {
  __$$ActorImplCopyWithImpl(
      _$ActorImpl _value, $Res Function(_$ActorImpl) _then)
      : super(_value, _then);

  /// Create a copy of Actor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? companyName = freezed,
    Object? location = freezed,
    Object? locale = freezed,
    Object? companyDescription = freezed,
    Object? smeOwner = freezed,
    Object? assets = null,
  }) {
    return _then(_$ActorImpl(
      companyName: freezed == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String?,
      locale: freezed == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String?,
      companyDescription: freezed == companyDescription
          ? _value.companyDescription
          : companyDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      smeOwner: freezed == smeOwner
          ? _value.smeOwner
          : smeOwner // ignore: cast_nullable_to_non_nullable
              as bool?,
      assets: null == assets
          ? _value._assets
          : assets // ignore: cast_nullable_to_non_nullable
              as List<Asset>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ActorImpl implements _Actor {
  const _$ActorImpl(
      {this.companyName,
      this.location,
      this.locale = "en",
      this.companyDescription,
      this.smeOwner = true,
      required final List<Asset> assets})
      : _assets = assets;

  factory _$ActorImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActorImplFromJson(json);

  @override
  final String? companyName;
  @override
  final String? location;
  @override
  @JsonKey()
  final String? locale;
  @override
  final String? companyDescription;
  @override
  @JsonKey()
  final bool? smeOwner;
  final List<Asset> _assets;
  @override
  List<Asset> get assets {
    if (_assets is EqualUnmodifiableListView) return _assets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assets);
  }

  @override
  String toString() {
    return 'Actor(companyName: $companyName, location: $location, locale: $locale, companyDescription: $companyDescription, smeOwner: $smeOwner, assets: $assets)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActorImpl &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.companyDescription, companyDescription) ||
                other.companyDescription == companyDescription) &&
            (identical(other.smeOwner, smeOwner) ||
                other.smeOwner == smeOwner) &&
            const DeepCollectionEquality().equals(other._assets, _assets));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      companyName,
      location,
      locale,
      companyDescription,
      smeOwner,
      const DeepCollectionEquality().hash(_assets));

  /// Create a copy of Actor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActorImplCopyWith<_$ActorImpl> get copyWith =>
      __$$ActorImplCopyWithImpl<_$ActorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActorImplToJson(
      this,
    );
  }
}

abstract class _Actor implements Actor {
  const factory _Actor(
      {final String? companyName,
      final String? location,
      final String? locale,
      final String? companyDescription,
      final bool? smeOwner,
      required final List<Asset> assets}) = _$ActorImpl;

  factory _Actor.fromJson(Map<String, dynamic> json) = _$ActorImpl.fromJson;

  @override
  String? get companyName;
  @override
  String? get location;
  @override
  String? get locale;
  @override
  String? get companyDescription;
  @override
  bool? get smeOwner;
  @override
  List<Asset> get assets;

  /// Create a copy of Actor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActorImplCopyWith<_$ActorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Asset _$AssetFromJson(Map<String, dynamic> json) {
  return _Asset.fromJson(json);
}

/// @nodoc
mixin _$Asset {
  String get type => throw _privateConstructorUsedError;
  String get version => throw _privateConstructorUsedError;
  String get model => throw _privateConstructorUsedError;

  /// Serializes this Asset to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Asset
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AssetCopyWith<Asset> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssetCopyWith<$Res> {
  factory $AssetCopyWith(Asset value, $Res Function(Asset) then) =
      _$AssetCopyWithImpl<$Res, Asset>;
  @useResult
  $Res call({String type, String version, String model});
}

/// @nodoc
class _$AssetCopyWithImpl<$Res, $Val extends Asset>
    implements $AssetCopyWith<$Res> {
  _$AssetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Asset
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? version = null,
    Object? model = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AssetImplCopyWith<$Res> implements $AssetCopyWith<$Res> {
  factory _$$AssetImplCopyWith(
          _$AssetImpl value, $Res Function(_$AssetImpl) then) =
      __$$AssetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String type, String version, String model});
}

/// @nodoc
class __$$AssetImplCopyWithImpl<$Res>
    extends _$AssetCopyWithImpl<$Res, _$AssetImpl>
    implements _$$AssetImplCopyWith<$Res> {
  __$$AssetImplCopyWithImpl(
      _$AssetImpl _value, $Res Function(_$AssetImpl) _then)
      : super(_value, _then);

  /// Create a copy of Asset
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? version = null,
    Object? model = null,
  }) {
    return _then(_$AssetImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      version: null == version
          ? _value.version
          : version // ignore: cast_nullable_to_non_nullable
              as String,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AssetImpl implements _Asset {
  const _$AssetImpl(
      {required this.type, required this.version, required this.model});

  factory _$AssetImpl.fromJson(Map<String, dynamic> json) =>
      _$$AssetImplFromJson(json);

  @override
  final String type;
  @override
  final String version;
  @override
  final String model;

  @override
  String toString() {
    return 'Asset(type: $type, version: $version, model: $model)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssetImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.version, version) || other.version == version) &&
            (identical(other.model, model) || other.model == model));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, type, version, model);

  /// Create a copy of Asset
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AssetImplCopyWith<_$AssetImpl> get copyWith =>
      __$$AssetImplCopyWithImpl<_$AssetImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AssetImplToJson(
      this,
    );
  }
}

abstract class _Asset implements Asset {
  const factory _Asset(
      {required final String type,
      required final String version,
      required final String model}) = _$AssetImpl;

  factory _Asset.fromJson(Map<String, dynamic> json) = _$AssetImpl.fromJson;

  @override
  String get type;
  @override
  String get version;
  @override
  String get model;

  /// Create a copy of Asset
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AssetImplCopyWith<_$AssetImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Verb _$VerbFromJson(Map<String, dynamic> json) {
  return _Verb.fromJson(json);
}

/// @nodoc
mixin _$Verb {
  String get name => throw _privateConstructorUsedError;

  /// Serializes this Verb to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Verb
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VerbCopyWith<Verb> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerbCopyWith<$Res> {
  factory $VerbCopyWith(Verb value, $Res Function(Verb) then) =
      _$VerbCopyWithImpl<$Res, Verb>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class _$VerbCopyWithImpl<$Res, $Val extends Verb>
    implements $VerbCopyWith<$Res> {
  _$VerbCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Verb
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VerbImplCopyWith<$Res> implements $VerbCopyWith<$Res> {
  factory _$$VerbImplCopyWith(
          _$VerbImpl value, $Res Function(_$VerbImpl) then) =
      __$$VerbImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$VerbImplCopyWithImpl<$Res>
    extends _$VerbCopyWithImpl<$Res, _$VerbImpl>
    implements _$$VerbImplCopyWith<$Res> {
  __$$VerbImplCopyWithImpl(_$VerbImpl _value, $Res Function(_$VerbImpl) _then)
      : super(_value, _then);

  /// Create a copy of Verb
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$VerbImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$VerbImpl implements _Verb {
  const _$VerbImpl({required this.name});

  factory _$VerbImpl.fromJson(Map<String, dynamic> json) =>
      _$$VerbImplFromJson(json);

  @override
  final String name;

  @override
  String toString() {
    return 'Verb(name: $name)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerbImpl &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name);

  /// Create a copy of Verb
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerbImplCopyWith<_$VerbImpl> get copyWith =>
      __$$VerbImplCopyWithImpl<_$VerbImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VerbImplToJson(
      this,
    );
  }
}

abstract class _Verb implements Verb {
  const factory _Verb({required final String name}) = _$VerbImpl;

  factory _Verb.fromJson(Map<String, dynamic> json) = _$VerbImpl.fromJson;

  @override
  String get name;

  /// Create a copy of Verb
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerbImplCopyWith<_$VerbImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Acting _$ActingFromJson(Map<String, dynamic> json) {
  return _Acting.fromJson(json);
}

/// @nodoc
mixin _$Acting {
  Definition get definition => throw _privateConstructorUsedError;

  /// Serializes this Acting to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Acting
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ActingCopyWith<Acting> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActingCopyWith<$Res> {
  factory $ActingCopyWith(Acting value, $Res Function(Acting) then) =
      _$ActingCopyWithImpl<$Res, Acting>;
  @useResult
  $Res call({Definition definition});

  $DefinitionCopyWith<$Res> get definition;
}

/// @nodoc
class _$ActingCopyWithImpl<$Res, $Val extends Acting>
    implements $ActingCopyWith<$Res> {
  _$ActingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Acting
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? definition = null,
  }) {
    return _then(_value.copyWith(
      definition: null == definition
          ? _value.definition
          : definition // ignore: cast_nullable_to_non_nullable
              as Definition,
    ) as $Val);
  }

  /// Create a copy of Acting
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DefinitionCopyWith<$Res> get definition {
    return $DefinitionCopyWith<$Res>(_value.definition, (value) {
      return _then(_value.copyWith(definition: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ActingImplCopyWith<$Res> implements $ActingCopyWith<$Res> {
  factory _$$ActingImplCopyWith(
          _$ActingImpl value, $Res Function(_$ActingImpl) then) =
      __$$ActingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Definition definition});

  @override
  $DefinitionCopyWith<$Res> get definition;
}

/// @nodoc
class __$$ActingImplCopyWithImpl<$Res>
    extends _$ActingCopyWithImpl<$Res, _$ActingImpl>
    implements _$$ActingImplCopyWith<$Res> {
  __$$ActingImplCopyWithImpl(
      _$ActingImpl _value, $Res Function(_$ActingImpl) _then)
      : super(_value, _then);

  /// Create a copy of Acting
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? definition = null,
  }) {
    return _then(_$ActingImpl(
      definition: null == definition
          ? _value.definition
          : definition // ignore: cast_nullable_to_non_nullable
              as Definition,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ActingImpl implements _Acting {
  const _$ActingImpl({required this.definition});

  factory _$ActingImpl.fromJson(Map<String, dynamic> json) =>
      _$$ActingImplFromJson(json);

  @override
  final Definition definition;

  @override
  String toString() {
    return 'Acting(definition: $definition)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActingImpl &&
            (identical(other.definition, definition) ||
                other.definition == definition));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, definition);

  /// Create a copy of Acting
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActingImplCopyWith<_$ActingImpl> get copyWith =>
      __$$ActingImplCopyWithImpl<_$ActingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActingImplToJson(
      this,
    );
  }
}

abstract class _Acting implements Acting {
  const factory _Acting({required final Definition definition}) = _$ActingImpl;

  factory _Acting.fromJson(Map<String, dynamic> json) = _$ActingImpl.fromJson;

  @override
  Definition get definition;

  /// Create a copy of Acting
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActingImplCopyWith<_$ActingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Definition _$DefinitionFromJson(Map<String, dynamic> json) {
  return _Definition.fromJson(json);
}

/// @nodoc
mixin _$Definition {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  List<DefinitionExtension> get extensions =>
      throw _privateConstructorUsedError;

  /// Serializes this Definition to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Definition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DefinitionCopyWith<Definition> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DefinitionCopyWith<$Res> {
  factory $DefinitionCopyWith(
          Definition value, $Res Function(Definition) then) =
      _$DefinitionCopyWithImpl<$Res, Definition>;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String type,
      List<DefinitionExtension> extensions});
}

/// @nodoc
class _$DefinitionCopyWithImpl<$Res, $Val extends Definition>
    implements $DefinitionCopyWith<$Res> {
  _$DefinitionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Definition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? type = null,
    Object? extensions = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      extensions: null == extensions
          ? _value.extensions
          : extensions // ignore: cast_nullable_to_non_nullable
              as List<DefinitionExtension>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DefinitionImplCopyWith<$Res>
    implements $DefinitionCopyWith<$Res> {
  factory _$$DefinitionImplCopyWith(
          _$DefinitionImpl value, $Res Function(_$DefinitionImpl) then) =
      __$$DefinitionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String type,
      List<DefinitionExtension> extensions});
}

/// @nodoc
class __$$DefinitionImplCopyWithImpl<$Res>
    extends _$DefinitionCopyWithImpl<$Res, _$DefinitionImpl>
    implements _$$DefinitionImplCopyWith<$Res> {
  __$$DefinitionImplCopyWithImpl(
      _$DefinitionImpl _value, $Res Function(_$DefinitionImpl) _then)
      : super(_value, _then);

  /// Create a copy of Definition
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? type = null,
    Object? extensions = null,
  }) {
    return _then(_$DefinitionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      extensions: null == extensions
          ? _value._extensions
          : extensions // ignore: cast_nullable_to_non_nullable
              as List<DefinitionExtension>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DefinitionImpl implements _Definition {
  const _$DefinitionImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.type,
      required final List<DefinitionExtension> extensions})
      : _extensions = extensions;

  factory _$DefinitionImpl.fromJson(Map<String, dynamic> json) =>
      _$$DefinitionImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String type;
  final List<DefinitionExtension> _extensions;
  @override
  List<DefinitionExtension> get extensions {
    if (_extensions is EqualUnmodifiableListView) return _extensions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_extensions);
  }

  @override
  String toString() {
    return 'Definition(id: $id, name: $name, description: $description, type: $type, extensions: $extensions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DefinitionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality()
                .equals(other._extensions, _extensions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description, type,
      const DeepCollectionEquality().hash(_extensions));

  /// Create a copy of Definition
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DefinitionImplCopyWith<_$DefinitionImpl> get copyWith =>
      __$$DefinitionImplCopyWithImpl<_$DefinitionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DefinitionImplToJson(
      this,
    );
  }
}

abstract class _Definition implements Definition {
  const factory _Definition(
      {required final String id,
      required final String name,
      required final String description,
      required final String type,
      required final List<DefinitionExtension> extensions}) = _$DefinitionImpl;

  factory _Definition.fromJson(Map<String, dynamic> json) =
      _$DefinitionImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String get type;
  @override
  List<DefinitionExtension> get extensions;

  /// Create a copy of Definition
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DefinitionImplCopyWith<_$DefinitionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DefinitionExtension _$DefinitionExtensionFromJson(Map<String, dynamic> json) {
  return _DefinitionExtension.fromJson(json);
}

/// @nodoc
mixin _$DefinitionExtension {
  String get name => throw _privateConstructorUsedError;
  String get summary => throw _privateConstructorUsedError;

  /// Serializes this DefinitionExtension to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DefinitionExtension
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DefinitionExtensionCopyWith<DefinitionExtension> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DefinitionExtensionCopyWith<$Res> {
  factory $DefinitionExtensionCopyWith(
          DefinitionExtension value, $Res Function(DefinitionExtension) then) =
      _$DefinitionExtensionCopyWithImpl<$Res, DefinitionExtension>;
  @useResult
  $Res call({String name, String summary});
}

/// @nodoc
class _$DefinitionExtensionCopyWithImpl<$Res, $Val extends DefinitionExtension>
    implements $DefinitionExtensionCopyWith<$Res> {
  _$DefinitionExtensionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DefinitionExtension
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? summary = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DefinitionExtensionImplCopyWith<$Res>
    implements $DefinitionExtensionCopyWith<$Res> {
  factory _$$DefinitionExtensionImplCopyWith(_$DefinitionExtensionImpl value,
          $Res Function(_$DefinitionExtensionImpl) then) =
      __$$DefinitionExtensionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String summary});
}

/// @nodoc
class __$$DefinitionExtensionImplCopyWithImpl<$Res>
    extends _$DefinitionExtensionCopyWithImpl<$Res, _$DefinitionExtensionImpl>
    implements _$$DefinitionExtensionImplCopyWith<$Res> {
  __$$DefinitionExtensionImplCopyWithImpl(_$DefinitionExtensionImpl _value,
      $Res Function(_$DefinitionExtensionImpl) _then)
      : super(_value, _then);

  /// Create a copy of DefinitionExtension
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? summary = null,
  }) {
    return _then(_$DefinitionExtensionImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      summary: null == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DefinitionExtensionImpl implements _DefinitionExtension {
  const _$DefinitionExtensionImpl({required this.name, required this.summary});

  factory _$DefinitionExtensionImpl.fromJson(Map<String, dynamic> json) =>
      _$$DefinitionExtensionImplFromJson(json);

  @override
  final String name;
  @override
  final String summary;

  @override
  String toString() {
    return 'DefinitionExtension(name: $name, summary: $summary)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DefinitionExtensionImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.summary, summary) || other.summary == summary));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, summary);

  /// Create a copy of DefinitionExtension
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DefinitionExtensionImplCopyWith<_$DefinitionExtensionImpl> get copyWith =>
      __$$DefinitionExtensionImplCopyWithImpl<_$DefinitionExtensionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DefinitionExtensionImplToJson(
      this,
    );
  }
}

abstract class _DefinitionExtension implements DefinitionExtension {
  const factory _DefinitionExtension(
      {required final String name,
      required final String summary}) = _$DefinitionExtensionImpl;

  factory _DefinitionExtension.fromJson(Map<String, dynamic> json) =
      _$DefinitionExtensionImpl.fromJson;

  @override
  String get name;
  @override
  String get summary;

  /// Create a copy of DefinitionExtension
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DefinitionExtensionImplCopyWith<_$DefinitionExtensionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Result _$ResultFromJson(Map<String, dynamic> json) {
  return _Result.fromJson(json);
}

/// @nodoc
mixin _$Result {
  bool get success => throw _privateConstructorUsedError;
  bool get completions => throw _privateConstructorUsedError;
  ResultExtensions get extensions => throw _privateConstructorUsedError;

  /// Serializes this Result to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Result
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResultCopyWith<Result> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultCopyWith<$Res> {
  factory $ResultCopyWith(Result value, $Res Function(Result) then) =
      _$ResultCopyWithImpl<$Res, Result>;
  @useResult
  $Res call({bool success, bool completions, ResultExtensions extensions});

  $ResultExtensionsCopyWith<$Res> get extensions;
}

/// @nodoc
class _$ResultCopyWithImpl<$Res, $Val extends Result>
    implements $ResultCopyWith<$Res> {
  _$ResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Result
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? completions = null,
    Object? extensions = null,
  }) {
    return _then(_value.copyWith(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      completions: null == completions
          ? _value.completions
          : completions // ignore: cast_nullable_to_non_nullable
              as bool,
      extensions: null == extensions
          ? _value.extensions
          : extensions // ignore: cast_nullable_to_non_nullable
              as ResultExtensions,
    ) as $Val);
  }

  /// Create a copy of Result
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResultExtensionsCopyWith<$Res> get extensions {
    return $ResultExtensionsCopyWith<$Res>(_value.extensions, (value) {
      return _then(_value.copyWith(extensions: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ResultImplCopyWith<$Res> implements $ResultCopyWith<$Res> {
  factory _$$ResultImplCopyWith(
          _$ResultImpl value, $Res Function(_$ResultImpl) then) =
      __$$ResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool success, bool completions, ResultExtensions extensions});

  @override
  $ResultExtensionsCopyWith<$Res> get extensions;
}

/// @nodoc
class __$$ResultImplCopyWithImpl<$Res>
    extends _$ResultCopyWithImpl<$Res, _$ResultImpl>
    implements _$$ResultImplCopyWith<$Res> {
  __$$ResultImplCopyWithImpl(
      _$ResultImpl _value, $Res Function(_$ResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of Result
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? success = null,
    Object? completions = null,
    Object? extensions = null,
  }) {
    return _then(_$ResultImpl(
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
      completions: null == completions
          ? _value.completions
          : completions // ignore: cast_nullable_to_non_nullable
              as bool,
      extensions: null == extensions
          ? _value.extensions
          : extensions // ignore: cast_nullable_to_non_nullable
              as ResultExtensions,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResultImpl implements _Result {
  const _$ResultImpl(
      {required this.success,
      required this.completions,
      required this.extensions});

  factory _$ResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResultImplFromJson(json);

  @override
  final bool success;
  @override
  final bool completions;
  @override
  final ResultExtensions extensions;

  @override
  String toString() {
    return 'Result(success: $success, completions: $completions, extensions: $extensions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultImpl &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.completions, completions) ||
                other.completions == completions) &&
            (identical(other.extensions, extensions) ||
                other.extensions == extensions));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, success, completions, extensions);

  /// Create a copy of Result
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultImplCopyWith<_$ResultImpl> get copyWith =>
      __$$ResultImplCopyWithImpl<_$ResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResultImplToJson(
      this,
    );
  }
}

abstract class _Result implements Result {
  const factory _Result(
      {required final bool success,
      required final bool completions,
      required final ResultExtensions extensions}) = _$ResultImpl;

  factory _Result.fromJson(Map<String, dynamic> json) = _$ResultImpl.fromJson;

  @override
  bool get success;
  @override
  bool get completions;
  @override
  ResultExtensions get extensions;

  /// Create a copy of Result
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResultImplCopyWith<_$ResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ResultExtensions _$ResultExtensionsFromJson(Map<String, dynamic> json) {
  return _ResultExtensions.fromJson(json);
}

/// @nodoc
mixin _$ResultExtensions {
  String get geigerScore => throw _privateConstructorUsedError;
  DateTime get lastUpdated => throw _privateConstructorUsedError;
  List<String> get reason => throw _privateConstructorUsedError;

  /// Serializes this ResultExtensions to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResultExtensions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResultExtensionsCopyWith<ResultExtensions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultExtensionsCopyWith<$Res> {
  factory $ResultExtensionsCopyWith(
          ResultExtensions value, $Res Function(ResultExtensions) then) =
      _$ResultExtensionsCopyWithImpl<$Res, ResultExtensions>;
  @useResult
  $Res call({String geigerScore, DateTime lastUpdated, List<String> reason});
}

/// @nodoc
class _$ResultExtensionsCopyWithImpl<$Res, $Val extends ResultExtensions>
    implements $ResultExtensionsCopyWith<$Res> {
  _$ResultExtensionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResultExtensions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? geigerScore = null,
    Object? lastUpdated = null,
    Object? reason = null,
  }) {
    return _then(_value.copyWith(
      geigerScore: null == geigerScore
          ? _value.geigerScore
          : geigerScore // ignore: cast_nullable_to_non_nullable
              as String,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResultExtensionsImplCopyWith<$Res>
    implements $ResultExtensionsCopyWith<$Res> {
  factory _$$ResultExtensionsImplCopyWith(_$ResultExtensionsImpl value,
          $Res Function(_$ResultExtensionsImpl) then) =
      __$$ResultExtensionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String geigerScore, DateTime lastUpdated, List<String> reason});
}

/// @nodoc
class __$$ResultExtensionsImplCopyWithImpl<$Res>
    extends _$ResultExtensionsCopyWithImpl<$Res, _$ResultExtensionsImpl>
    implements _$$ResultExtensionsImplCopyWith<$Res> {
  __$$ResultExtensionsImplCopyWithImpl(_$ResultExtensionsImpl _value,
      $Res Function(_$ResultExtensionsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ResultExtensions
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? geigerScore = null,
    Object? lastUpdated = null,
    Object? reason = null,
  }) {
    return _then(_$ResultExtensionsImpl(
      geigerScore: null == geigerScore
          ? _value.geigerScore
          : geigerScore // ignore: cast_nullable_to_non_nullable
              as String,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      reason: null == reason
          ? _value._reason
          : reason // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResultExtensionsImpl implements _ResultExtensions {
  const _$ResultExtensionsImpl(
      {required this.geigerScore,
      required this.lastUpdated,
      required final List<String> reason})
      : _reason = reason;

  factory _$ResultExtensionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResultExtensionsImplFromJson(json);

  @override
  final String geigerScore;
  @override
  final DateTime lastUpdated;
  final List<String> _reason;
  @override
  List<String> get reason {
    if (_reason is EqualUnmodifiableListView) return _reason;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_reason);
  }

  @override
  String toString() {
    return 'ResultExtensions(geigerScore: $geigerScore, lastUpdated: $lastUpdated, reason: $reason)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResultExtensionsImpl &&
            (identical(other.geigerScore, geigerScore) ||
                other.geigerScore == geigerScore) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated) &&
            const DeepCollectionEquality().equals(other._reason, _reason));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, geigerScore, lastUpdated,
      const DeepCollectionEquality().hash(_reason));

  /// Create a copy of ResultExtensions
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResultExtensionsImplCopyWith<_$ResultExtensionsImpl> get copyWith =>
      __$$ResultExtensionsImplCopyWithImpl<_$ResultExtensionsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResultExtensionsImplToJson(
      this,
    );
  }
}

abstract class _ResultExtensions implements ResultExtensions {
  const factory _ResultExtensions(
      {required final String geigerScore,
      required final DateTime lastUpdated,
      required final List<String> reason}) = _$ResultExtensionsImpl;

  factory _ResultExtensions.fromJson(Map<String, dynamic> json) =
      _$ResultExtensionsImpl.fromJson;

  @override
  String get geigerScore;
  @override
  DateTime get lastUpdated;
  @override
  List<String> get reason;

  /// Create a copy of ResultExtensions
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResultExtensionsImplCopyWith<_$ResultExtensionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
