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
  String? get locale => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  String get companyName => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

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
      {String? locale,
      String location,
      String companyName,
      String? description});
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
    Object? locale = freezed,
    Object? location = null,
    Object? companyName = null,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      locale: freezed == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String?,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
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
      {String? locale,
      String location,
      String companyName,
      String? description});
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
    Object? locale = freezed,
    Object? location = null,
    Object? companyName = null,
    Object? description = freezed,
  }) {
    return _then(_$ProfileImpl(
      locale: freezed == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as String?,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileImpl implements _Profile {
  const _$ProfileImpl(
      {this.locale = "en",
      required this.location,
      required this.companyName,
      this.description});

  factory _$ProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileImplFromJson(json);

  @override
  @JsonKey()
  final String? locale;
  @override
  final String location;
  @override
  final String companyName;
  @override
  final String? description;

  @override
  String toString() {
    return 'Profile(locale: $locale, location: $location, companyName: $companyName, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileImpl &&
            (identical(other.locale, locale) || other.locale == locale) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, locale, location, companyName, description);

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
      {final String? locale,
      required final String location,
      required final String companyName,
      final String? description}) = _$ProfileImpl;

  factory _Profile.fromJson(Map<String, dynamic> json) = _$ProfileImpl.fromJson;

  @override
  String? get locale;
  @override
  String get location;
  @override
  String get companyName;
  @override
  String? get description;

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileImplCopyWith<_$ProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DigitalInfrastructure _$DigitalInfrastructureFromJson(
    Map<String, dynamic> json) {
  return _DigitalInfrastructure.fromJson(json);
}

/// @nodoc
mixin _$DigitalInfrastructure {
  List<String> get infoAbout => throw _privateConstructorUsedError;

  /// Serializes this DigitalInfrastructure to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DigitalInfrastructure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DigitalInfrastructureCopyWith<DigitalInfrastructure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DigitalInfrastructureCopyWith<$Res> {
  factory $DigitalInfrastructureCopyWith(DigitalInfrastructure value,
          $Res Function(DigitalInfrastructure) then) =
      _$DigitalInfrastructureCopyWithImpl<$Res, DigitalInfrastructure>;
  @useResult
  $Res call({List<String> infoAbout});
}

/// @nodoc
class _$DigitalInfrastructureCopyWithImpl<$Res,
        $Val extends DigitalInfrastructure>
    implements $DigitalInfrastructureCopyWith<$Res> {
  _$DigitalInfrastructureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DigitalInfrastructure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? infoAbout = null,
  }) {
    return _then(_value.copyWith(
      infoAbout: null == infoAbout
          ? _value.infoAbout
          : infoAbout // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DigitalInfrastructureImplCopyWith<$Res>
    implements $DigitalInfrastructureCopyWith<$Res> {
  factory _$$DigitalInfrastructureImplCopyWith(
          _$DigitalInfrastructureImpl value,
          $Res Function(_$DigitalInfrastructureImpl) then) =
      __$$DigitalInfrastructureImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> infoAbout});
}

/// @nodoc
class __$$DigitalInfrastructureImplCopyWithImpl<$Res>
    extends _$DigitalInfrastructureCopyWithImpl<$Res,
        _$DigitalInfrastructureImpl>
    implements _$$DigitalInfrastructureImplCopyWith<$Res> {
  __$$DigitalInfrastructureImplCopyWithImpl(_$DigitalInfrastructureImpl _value,
      $Res Function(_$DigitalInfrastructureImpl) _then)
      : super(_value, _then);

  /// Create a copy of DigitalInfrastructure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? infoAbout = null,
  }) {
    return _then(_$DigitalInfrastructureImpl(
      infoAbout: null == infoAbout
          ? _value._infoAbout
          : infoAbout // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DigitalInfrastructureImpl implements _DigitalInfrastructure {
  const _$DigitalInfrastructureImpl({required final List<String> infoAbout})
      : _infoAbout = infoAbout;

  factory _$DigitalInfrastructureImpl.fromJson(Map<String, dynamic> json) =>
      _$$DigitalInfrastructureImplFromJson(json);

  final List<String> _infoAbout;
  @override
  List<String> get infoAbout {
    if (_infoAbout is EqualUnmodifiableListView) return _infoAbout;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_infoAbout);
  }

  @override
  String toString() {
    return 'DigitalInfrastructure(infoAbout: $infoAbout)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DigitalInfrastructureImpl &&
            const DeepCollectionEquality()
                .equals(other._infoAbout, _infoAbout));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_infoAbout));

  /// Create a copy of DigitalInfrastructure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DigitalInfrastructureImplCopyWith<_$DigitalInfrastructureImpl>
      get copyWith => __$$DigitalInfrastructureImplCopyWithImpl<
          _$DigitalInfrastructureImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DigitalInfrastructureImplToJson(
      this,
    );
  }
}

abstract class _DigitalInfrastructure implements DigitalInfrastructure {
  const factory _DigitalInfrastructure(
      {required final List<String> infoAbout}) = _$DigitalInfrastructureImpl;

  factory _DigitalInfrastructure.fromJson(Map<String, dynamic> json) =
      _$DigitalInfrastructureImpl.fromJson;

  @override
  List<String> get infoAbout;

  /// Create a copy of DigitalInfrastructure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DigitalInfrastructureImplCopyWith<_$DigitalInfrastructureImpl>
      get copyWith => throw _privateConstructorUsedError;
}
