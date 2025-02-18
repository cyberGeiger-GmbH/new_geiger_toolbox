// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

UserProfileModel _$UserProfileModelFromJson(Map<String, dynamic> json) {
  return _UserProfileModel.fromJson(json);
}

/// @nodoc
mixin _$UserProfileModel {
  Profile get currentUserProfile => throw _privateConstructorUsedError;
  Profile? get previousUserProfile => throw _privateConstructorUsedError;

  /// Serializes this UserProfileModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserProfileModelCopyWith<UserProfileModel> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileModelCopyWith<$Res> {
  factory $UserProfileModelCopyWith(UserProfileModel value, $Res Function(UserProfileModel) then) =
      _$UserProfileModelCopyWithImpl<$Res, UserProfileModel>;
  @useResult
  $Res call({Profile currentUserProfile, Profile? previousUserProfile});

  $ProfileCopyWith<$Res> get currentUserProfile;
  $ProfileCopyWith<$Res>? get previousUserProfile;
}

/// @nodoc
class _$UserProfileModelCopyWithImpl<$Res, $Val extends UserProfileModel> implements $UserProfileModelCopyWith<$Res> {
  _$UserProfileModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? currentUserProfile = null, Object? previousUserProfile = freezed}) {
    return _then(
      _value.copyWith(
            currentUserProfile:
                null == currentUserProfile
                    ? _value.currentUserProfile
                    : currentUserProfile // ignore: cast_nullable_to_non_nullable
                        as Profile,
            previousUserProfile:
                freezed == previousUserProfile
                    ? _value.previousUserProfile
                    : previousUserProfile // ignore: cast_nullable_to_non_nullable
                        as Profile?,
          )
          as $Val,
    );
  }

  /// Create a copy of UserProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<$Res> get currentUserProfile {
    return $ProfileCopyWith<$Res>(_value.currentUserProfile, (value) {
      return _then(_value.copyWith(currentUserProfile: value) as $Val);
    });
  }

  /// Create a copy of UserProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<$Res>? get previousUserProfile {
    if (_value.previousUserProfile == null) {
      return null;
    }

    return $ProfileCopyWith<$Res>(_value.previousUserProfile!, (value) {
      return _then(_value.copyWith(previousUserProfile: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserProfileModelImplCopyWith<$Res> implements $UserProfileModelCopyWith<$Res> {
  factory _$$UserProfileModelImplCopyWith(_$UserProfileModelImpl value, $Res Function(_$UserProfileModelImpl) then) =
      __$$UserProfileModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Profile currentUserProfile, Profile? previousUserProfile});

  @override
  $ProfileCopyWith<$Res> get currentUserProfile;
  @override
  $ProfileCopyWith<$Res>? get previousUserProfile;
}

/// @nodoc
class __$$UserProfileModelImplCopyWithImpl<$Res> extends _$UserProfileModelCopyWithImpl<$Res, _$UserProfileModelImpl>
    implements _$$UserProfileModelImplCopyWith<$Res> {
  __$$UserProfileModelImplCopyWithImpl(_$UserProfileModelImpl _value, $Res Function(_$UserProfileModelImpl) _then)
    : super(_value, _then);

  /// Create a copy of UserProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? currentUserProfile = null, Object? previousUserProfile = freezed}) {
    return _then(
      _$UserProfileModelImpl(
        currentUserProfile:
            null == currentUserProfile
                ? _value.currentUserProfile
                : currentUserProfile // ignore: cast_nullable_to_non_nullable
                    as Profile,
        previousUserProfile:
            freezed == previousUserProfile
                ? _value.previousUserProfile
                : previousUserProfile // ignore: cast_nullable_to_non_nullable
                    as Profile?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$UserProfileModelImpl implements _UserProfileModel {
  const _$UserProfileModelImpl({required this.currentUserProfile, this.previousUserProfile});

  factory _$UserProfileModelImpl.fromJson(Map<String, dynamic> json) => _$$UserProfileModelImplFromJson(json);

  @override
  final Profile currentUserProfile;
  @override
  final Profile? previousUserProfile;

  @override
  String toString() {
    return 'UserProfileModel(currentUserProfile: $currentUserProfile, previousUserProfile: $previousUserProfile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfileModelImpl &&
            (identical(other.currentUserProfile, currentUserProfile) ||
                other.currentUserProfile == currentUserProfile) &&
            (identical(other.previousUserProfile, previousUserProfile) ||
                other.previousUserProfile == previousUserProfile));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, currentUserProfile, previousUserProfile);

  /// Create a copy of UserProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProfileModelImplCopyWith<_$UserProfileModelImpl> get copyWith =>
      __$$UserProfileModelImplCopyWithImpl<_$UserProfileModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserProfileModelImplToJson(this);
  }
}

abstract class _UserProfileModel implements UserProfileModel {
  const factory _UserProfileModel({required final Profile currentUserProfile, final Profile? previousUserProfile}) =
      _$UserProfileModelImpl;

  factory _UserProfileModel.fromJson(Map<String, dynamic> json) = _$UserProfileModelImpl.fromJson;

  @override
  Profile get currentUserProfile;
  @override
  Profile? get previousUserProfile;

  /// Create a copy of UserProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserProfileModelImplCopyWith<_$UserProfileModelImpl> get copyWith => throw _privateConstructorUsedError;
}

Profile _$ProfileFromJson(Map<String, dynamic> json) {
  return _Profile.fromJson(json);
}

/// @nodoc
mixin _$Profile {
  String get id => throw _privateConstructorUsedError;
  Actor get actor => throw _privateConstructorUsedError;
  List<NewsActicle> get news => throw _privateConstructorUsedError;

  /// Serializes this Profile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileCopyWith<Profile> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileCopyWith<$Res> {
  factory $ProfileCopyWith(Profile value, $Res Function(Profile) then) = _$ProfileCopyWithImpl<$Res, Profile>;
  @useResult
  $Res call({String id, Actor actor, List<NewsActicle> news});

  $ActorCopyWith<$Res> get actor;
}

/// @nodoc
class _$ProfileCopyWithImpl<$Res, $Val extends Profile> implements $ProfileCopyWith<$Res> {
  _$ProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? actor = null, Object? news = null}) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            actor:
                null == actor
                    ? _value.actor
                    : actor // ignore: cast_nullable_to_non_nullable
                        as Actor,
            news:
                null == news
                    ? _value.news
                    : news // ignore: cast_nullable_to_non_nullable
                        as List<NewsActicle>,
          )
          as $Val,
    );
  }

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ActorCopyWith<$Res> get actor {
    return $ActorCopyWith<$Res>(_value.actor, (value) {
      return _then(_value.copyWith(actor: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ProfileImplCopyWith<$Res> implements $ProfileCopyWith<$Res> {
  factory _$$ProfileImplCopyWith(_$ProfileImpl value, $Res Function(_$ProfileImpl) then) =
      __$$ProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, Actor actor, List<NewsActicle> news});

  @override
  $ActorCopyWith<$Res> get actor;
}

/// @nodoc
class __$$ProfileImplCopyWithImpl<$Res> extends _$ProfileCopyWithImpl<$Res, _$ProfileImpl>
    implements _$$ProfileImplCopyWith<$Res> {
  __$$ProfileImplCopyWithImpl(_$ProfileImpl _value, $Res Function(_$ProfileImpl) _then) : super(_value, _then);

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? id = null, Object? actor = null, Object? news = null}) {
    return _then(
      _$ProfileImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        actor:
            null == actor
                ? _value.actor
                : actor // ignore: cast_nullable_to_non_nullable
                    as Actor,
        news:
            null == news
                ? _value._news
                : news // ignore: cast_nullable_to_non_nullable
                    as List<NewsActicle>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileImpl implements _Profile {
  const _$ProfileImpl({required this.id, required this.actor, required final List<NewsActicle> news}) : _news = news;

  factory _$ProfileImpl.fromJson(Map<String, dynamic> json) => _$$ProfileImplFromJson(json);

  @override
  final String id;
  @override
  final Actor actor;
  final List<NewsActicle> _news;
  @override
  List<NewsActicle> get news {
    if (_news is EqualUnmodifiableListView) return _news;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_news);
  }

  @override
  String toString() {
    return 'Profile(id: $id, actor: $actor, news: $news)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.actor, actor) || other.actor == actor) &&
            const DeepCollectionEquality().equals(other._news, _news));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, actor, const DeepCollectionEquality().hash(_news));

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileImplCopyWith<_$ProfileImpl> get copyWith => __$$ProfileImplCopyWithImpl<_$ProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileImplToJson(this);
  }
}

abstract class _Profile implements Profile {
  const factory _Profile({
    required final String id,
    required final Actor actor,
    required final List<NewsActicle> news,
  }) = _$ProfileImpl;

  factory _Profile.fromJson(Map<String, dynamic> json) = _$ProfileImpl.fromJson;

  @override
  String get id;
  @override
  Actor get actor;
  @override
  List<NewsActicle> get news;

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileImplCopyWith<_$ProfileImpl> get copyWith => throw _privateConstructorUsedError;
}

Actor _$ActorFromJson(Map<String, dynamic> json) {
  return _Actor.fromJson(json);
}

/// @nodoc
mixin _$Actor {
  String? get companyName => throw _privateConstructorUsedError;
  String? get location => throw _privateConstructorUsedError;
  String? get companyDescription => throw _privateConstructorUsedError;
  Asset get userDevice => throw _privateConstructorUsedError;
  String? get score => throw _privateConstructorUsedError;
  String get locale => throw _privateConstructorUsedError;
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
  factory $ActorCopyWith(Actor value, $Res Function(Actor) then) = _$ActorCopyWithImpl<$Res, Actor>;
  @useResult
  $Res call({
    String? companyName,
    String? location,
    String? companyDescription,
    Asset userDevice,
    String? score,
    String locale,
    List<Asset> assets,
  });

  $AssetCopyWith<$Res> get userDevice;
}

/// @nodoc
class _$ActorCopyWithImpl<$Res, $Val extends Actor> implements $ActorCopyWith<$Res> {
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
    Object? companyDescription = freezed,
    Object? userDevice = null,
    Object? score = freezed,
    Object? locale = null,
    Object? assets = null,
  }) {
    return _then(
      _value.copyWith(
            companyName:
                freezed == companyName
                    ? _value.companyName
                    : companyName // ignore: cast_nullable_to_non_nullable
                        as String?,
            location:
                freezed == location
                    ? _value.location
                    : location // ignore: cast_nullable_to_non_nullable
                        as String?,
            companyDescription:
                freezed == companyDescription
                    ? _value.companyDescription
                    : companyDescription // ignore: cast_nullable_to_non_nullable
                        as String?,
            userDevice:
                null == userDevice
                    ? _value.userDevice
                    : userDevice // ignore: cast_nullable_to_non_nullable
                        as Asset,
            score:
                freezed == score
                    ? _value.score
                    : score // ignore: cast_nullable_to_non_nullable
                        as String?,
            locale:
                null == locale
                    ? _value.locale
                    : locale // ignore: cast_nullable_to_non_nullable
                        as String,
            assets:
                null == assets
                    ? _value.assets
                    : assets // ignore: cast_nullable_to_non_nullable
                        as List<Asset>,
          )
          as $Val,
    );
  }

  /// Create a copy of Actor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AssetCopyWith<$Res> get userDevice {
    return $AssetCopyWith<$Res>(_value.userDevice, (value) {
      return _then(_value.copyWith(userDevice: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ActorImplCopyWith<$Res> implements $ActorCopyWith<$Res> {
  factory _$$ActorImplCopyWith(_$ActorImpl value, $Res Function(_$ActorImpl) then) = __$$ActorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    String? companyName,
    String? location,
    String? companyDescription,
    Asset userDevice,
    String? score,
    String locale,
    List<Asset> assets,
  });

  @override
  $AssetCopyWith<$Res> get userDevice;
}

/// @nodoc
class __$$ActorImplCopyWithImpl<$Res> extends _$ActorCopyWithImpl<$Res, _$ActorImpl>
    implements _$$ActorImplCopyWith<$Res> {
  __$$ActorImplCopyWithImpl(_$ActorImpl _value, $Res Function(_$ActorImpl) _then) : super(_value, _then);

  /// Create a copy of Actor
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? companyName = freezed,
    Object? location = freezed,
    Object? companyDescription = freezed,
    Object? userDevice = null,
    Object? score = freezed,
    Object? locale = null,
    Object? assets = null,
  }) {
    return _then(
      _$ActorImpl(
        companyName:
            freezed == companyName
                ? _value.companyName
                : companyName // ignore: cast_nullable_to_non_nullable
                    as String?,
        location:
            freezed == location
                ? _value.location
                : location // ignore: cast_nullable_to_non_nullable
                    as String?,
        companyDescription:
            freezed == companyDescription
                ? _value.companyDescription
                : companyDescription // ignore: cast_nullable_to_non_nullable
                    as String?,
        userDevice:
            null == userDevice
                ? _value.userDevice
                : userDevice // ignore: cast_nullable_to_non_nullable
                    as Asset,
        score:
            freezed == score
                ? _value.score
                : score // ignore: cast_nullable_to_non_nullable
                    as String?,
        locale:
            null == locale
                ? _value.locale
                : locale // ignore: cast_nullable_to_non_nullable
                    as String,
        assets:
            null == assets
                ? _value._assets
                : assets // ignore: cast_nullable_to_non_nullable
                    as List<Asset>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ActorImpl implements _Actor {
  const _$ActorImpl({
    this.companyName,
    this.location,
    this.companyDescription,
    required this.userDevice,
    this.score,
    required this.locale,
    required final List<Asset> assets,
  }) : _assets = assets;

  factory _$ActorImpl.fromJson(Map<String, dynamic> json) => _$$ActorImplFromJson(json);

  @override
  final String? companyName;
  @override
  final String? location;
  @override
  final String? companyDescription;
  @override
  final Asset userDevice;
  @override
  final String? score;
  @override
  final String locale;
  final List<Asset> _assets;
  @override
  List<Asset> get assets {
    if (_assets is EqualUnmodifiableListView) return _assets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_assets);
  }

  @override
  String toString() {
    return 'Actor(companyName: $companyName, location: $location, companyDescription: $companyDescription, userDevice: $userDevice, score: $score, locale: $locale, assets: $assets)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ActorImpl &&
            (identical(other.companyName, companyName) || other.companyName == companyName) &&
            (identical(other.location, location) || other.location == location) &&
            (identical(other.companyDescription, companyDescription) ||
                other.companyDescription == companyDescription) &&
            (identical(other.userDevice, userDevice) || other.userDevice == userDevice) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.locale, locale) || other.locale == locale) &&
            const DeepCollectionEquality().equals(other._assets, _assets));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    companyName,
    location,
    companyDescription,
    userDevice,
    score,
    locale,
    const DeepCollectionEquality().hash(_assets),
  );

  /// Create a copy of Actor
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ActorImplCopyWith<_$ActorImpl> get copyWith => __$$ActorImplCopyWithImpl<_$ActorImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ActorImplToJson(this);
  }
}

abstract class _Actor implements Actor {
  const factory _Actor({
    final String? companyName,
    final String? location,
    final String? companyDescription,
    required final Asset userDevice,
    final String? score,
    required final String locale,
    required final List<Asset> assets,
  }) = _$ActorImpl;

  factory _Actor.fromJson(Map<String, dynamic> json) = _$ActorImpl.fromJson;

  @override
  String? get companyName;
  @override
  String? get location;
  @override
  String? get companyDescription;
  @override
  Asset get userDevice;
  @override
  String? get score;
  @override
  String get locale;
  @override
  List<Asset> get assets;

  /// Create a copy of Actor
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ActorImplCopyWith<_$ActorImpl> get copyWith => throw _privateConstructorUsedError;
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
  factory $AssetCopyWith(Asset value, $Res Function(Asset) then) = _$AssetCopyWithImpl<$Res, Asset>;
  @useResult
  $Res call({String type, String version, String model});
}

/// @nodoc
class _$AssetCopyWithImpl<$Res, $Val extends Asset> implements $AssetCopyWith<$Res> {
  _$AssetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Asset
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? type = null, Object? version = null, Object? model = null}) {
    return _then(
      _value.copyWith(
            type:
                null == type
                    ? _value.type
                    : type // ignore: cast_nullable_to_non_nullable
                        as String,
            version:
                null == version
                    ? _value.version
                    : version // ignore: cast_nullable_to_non_nullable
                        as String,
            model:
                null == model
                    ? _value.model
                    : model // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$AssetImplCopyWith<$Res> implements $AssetCopyWith<$Res> {
  factory _$$AssetImplCopyWith(_$AssetImpl value, $Res Function(_$AssetImpl) then) = __$$AssetImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String type, String version, String model});
}

/// @nodoc
class __$$AssetImplCopyWithImpl<$Res> extends _$AssetCopyWithImpl<$Res, _$AssetImpl>
    implements _$$AssetImplCopyWith<$Res> {
  __$$AssetImplCopyWithImpl(_$AssetImpl _value, $Res Function(_$AssetImpl) _then) : super(_value, _then);

  /// Create a copy of Asset
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? type = null, Object? version = null, Object? model = null}) {
    return _then(
      _$AssetImpl(
        type:
            null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                    as String,
        version:
            null == version
                ? _value.version
                : version // ignore: cast_nullable_to_non_nullable
                    as String,
        model:
            null == model
                ? _value.model
                : model // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$AssetImpl implements _Asset {
  const _$AssetImpl({required this.type, required this.version, required this.model});

  factory _$AssetImpl.fromJson(Map<String, dynamic> json) => _$$AssetImplFromJson(json);

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
  _$$AssetImplCopyWith<_$AssetImpl> get copyWith => __$$AssetImplCopyWithImpl<_$AssetImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AssetImplToJson(this);
  }
}

abstract class _Asset implements Asset {
  const factory _Asset({required final String type, required final String version, required final String model}) =
      _$AssetImpl;

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
  _$$AssetImplCopyWith<_$AssetImpl> get copyWith => throw _privateConstructorUsedError;
}

NewsActicle _$NewsActicleFromJson(Map<String, dynamic> json) {
  return _Definition.fromJson(json);
}

/// @nodoc
mixin _$NewsActicle {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  List<Protection> get protection => throw _privateConstructorUsedError;

  /// Serializes this NewsActicle to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NewsActicle
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NewsActicleCopyWith<NewsActicle> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsActicleCopyWith<$Res> {
  factory $NewsActicleCopyWith(NewsActicle value, $Res Function(NewsActicle) then) =
      _$NewsActicleCopyWithImpl<$Res, NewsActicle>;
  @useResult
  $Res call({String id, String name, String description, String type, List<Protection> protection});
}

/// @nodoc
class _$NewsActicleCopyWithImpl<$Res, $Val extends NewsActicle> implements $NewsActicleCopyWith<$Res> {
  _$NewsActicleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NewsActicle
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? type = null,
    Object? protection = null,
  }) {
    return _then(
      _value.copyWith(
            id:
                null == id
                    ? _value.id
                    : id // ignore: cast_nullable_to_non_nullable
                        as String,
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
            description:
                null == description
                    ? _value.description
                    : description // ignore: cast_nullable_to_non_nullable
                        as String,
            type:
                null == type
                    ? _value.type
                    : type // ignore: cast_nullable_to_non_nullable
                        as String,
            protection:
                null == protection
                    ? _value.protection
                    : protection // ignore: cast_nullable_to_non_nullable
                        as List<Protection>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DefinitionImplCopyWith<$Res> implements $NewsActicleCopyWith<$Res> {
  factory _$$DefinitionImplCopyWith(_$DefinitionImpl value, $Res Function(_$DefinitionImpl) then) =
      __$$DefinitionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String description, String type, List<Protection> protection});
}

/// @nodoc
class __$$DefinitionImplCopyWithImpl<$Res> extends _$NewsActicleCopyWithImpl<$Res, _$DefinitionImpl>
    implements _$$DefinitionImplCopyWith<$Res> {
  __$$DefinitionImplCopyWithImpl(_$DefinitionImpl _value, $Res Function(_$DefinitionImpl) _then) : super(_value, _then);

  /// Create a copy of NewsActicle
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? type = null,
    Object? protection = null,
  }) {
    return _then(
      _$DefinitionImpl(
        id:
            null == id
                ? _value.id
                : id // ignore: cast_nullable_to_non_nullable
                    as String,
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
        description:
            null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                    as String,
        type:
            null == type
                ? _value.type
                : type // ignore: cast_nullable_to_non_nullable
                    as String,
        protection:
            null == protection
                ? _value._protection
                : protection // ignore: cast_nullable_to_non_nullable
                    as List<Protection>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DefinitionImpl implements _Definition {
  const _$DefinitionImpl({
    required this.id,
    required this.name,
    required this.description,
    required this.type,
    required final List<Protection> protection,
  }) : _protection = protection;

  factory _$DefinitionImpl.fromJson(Map<String, dynamic> json) => _$$DefinitionImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String type;
  final List<Protection> _protection;
  @override
  List<Protection> get protection {
    if (_protection is EqualUnmodifiableListView) return _protection;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_protection);
  }

  @override
  String toString() {
    return 'NewsActicle(id: $id, name: $name, description: $description, type: $type, protection: $protection)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DefinitionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) || other.description == description) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._protection, _protection));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, description, type, const DeepCollectionEquality().hash(_protection));

  /// Create a copy of NewsActicle
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DefinitionImplCopyWith<_$DefinitionImpl> get copyWith =>
      __$$DefinitionImplCopyWithImpl<_$DefinitionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DefinitionImplToJson(this);
  }
}

abstract class _Definition implements NewsActicle {
  const factory _Definition({
    required final String id,
    required final String name,
    required final String description,
    required final String type,
    required final List<Protection> protection,
  }) = _$DefinitionImpl;

  factory _Definition.fromJson(Map<String, dynamic> json) = _$DefinitionImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String get type;
  @override
  List<Protection> get protection;

  /// Create a copy of NewsActicle
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DefinitionImplCopyWith<_$DefinitionImpl> get copyWith => throw _privateConstructorUsedError;
}

Protection _$ProtectionFromJson(Map<String, dynamic> json) {
  return _Protection.fromJson(json);
}

/// @nodoc
mixin _$Protection {
  String get name => throw _privateConstructorUsedError;
  String get summary => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  /// Serializes this Protection to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Protection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProtectionCopyWith<Protection> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProtectionCopyWith<$Res> {
  factory $ProtectionCopyWith(Protection value, $Res Function(Protection) then) =
      _$ProtectionCopyWithImpl<$Res, Protection>;
  @useResult
  $Res call({String name, String summary, String status});
}

/// @nodoc
class _$ProtectionCopyWithImpl<$Res, $Val extends Protection> implements $ProtectionCopyWith<$Res> {
  _$ProtectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Protection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = null, Object? summary = null, Object? status = null}) {
    return _then(
      _value.copyWith(
            name:
                null == name
                    ? _value.name
                    : name // ignore: cast_nullable_to_non_nullable
                        as String,
            summary:
                null == summary
                    ? _value.summary
                    : summary // ignore: cast_nullable_to_non_nullable
                        as String,
            status:
                null == status
                    ? _value.status
                    : status // ignore: cast_nullable_to_non_nullable
                        as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ProtectionImplCopyWith<$Res> implements $ProtectionCopyWith<$Res> {
  factory _$$ProtectionImplCopyWith(_$ProtectionImpl value, $Res Function(_$ProtectionImpl) then) =
      __$$ProtectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String summary, String status});
}

/// @nodoc
class __$$ProtectionImplCopyWithImpl<$Res> extends _$ProtectionCopyWithImpl<$Res, _$ProtectionImpl>
    implements _$$ProtectionImplCopyWith<$Res> {
  __$$ProtectionImplCopyWithImpl(_$ProtectionImpl _value, $Res Function(_$ProtectionImpl) _then) : super(_value, _then);

  /// Create a copy of Protection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? name = null, Object? summary = null, Object? status = null}) {
    return _then(
      _$ProtectionImpl(
        name:
            null == name
                ? _value.name
                : name // ignore: cast_nullable_to_non_nullable
                    as String,
        summary:
            null == summary
                ? _value.summary
                : summary // ignore: cast_nullable_to_non_nullable
                    as String,
        status:
            null == status
                ? _value.status
                : status // ignore: cast_nullable_to_non_nullable
                    as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ProtectionImpl implements _Protection {
  const _$ProtectionImpl({required this.name, required this.summary, required this.status});

  factory _$ProtectionImpl.fromJson(Map<String, dynamic> json) => _$$ProtectionImplFromJson(json);

  @override
  final String name;
  @override
  final String summary;
  @override
  final String status;

  @override
  String toString() {
    return 'Protection(name: $name, summary: $summary, status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProtectionImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.summary, summary) || other.summary == summary) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, summary, status);

  /// Create a copy of Protection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProtectionImplCopyWith<_$ProtectionImpl> get copyWith =>
      __$$ProtectionImplCopyWithImpl<_$ProtectionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProtectionImplToJson(this);
  }
}

abstract class _Protection implements Protection {
  const factory _Protection({required final String name, required final String summary, required final String status}) =
      _$ProtectionImpl;

  factory _Protection.fromJson(Map<String, dynamic> json) = _$ProtectionImpl.fromJson;

  @override
  String get name;
  @override
  String get summary;
  @override
  String get status;

  /// Create a copy of Protection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProtectionImplCopyWith<_$ProtectionImpl> get copyWith => throw _privateConstructorUsedError;
}
