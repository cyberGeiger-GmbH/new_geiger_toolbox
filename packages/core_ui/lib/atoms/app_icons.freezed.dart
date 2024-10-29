// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_icons.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AppIconData {
  String get fontFamily =>
      throw _privateConstructorUsedError; //required String fontPackage,
  AppIconCharactersData get character => throw _privateConstructorUsedError;
  AppIconSizesData get sizes => throw _privateConstructorUsedError;

  /// Create a copy of AppIconData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppIconDataCopyWith<AppIconData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppIconDataCopyWith<$Res> {
  factory $AppIconDataCopyWith(
          AppIconData value, $Res Function(AppIconData) then) =
      _$AppIconDataCopyWithImpl<$Res, AppIconData>;
  @useResult
  $Res call(
      {String fontFamily,
      AppIconCharactersData character,
      AppIconSizesData sizes});

  $AppIconCharactersDataCopyWith<$Res> get character;
  $AppIconSizesDataCopyWith<$Res> get sizes;
}

/// @nodoc
class _$AppIconDataCopyWithImpl<$Res, $Val extends AppIconData>
    implements $AppIconDataCopyWith<$Res> {
  _$AppIconDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppIconData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fontFamily = null,
    Object? character = null,
    Object? sizes = null,
  }) {
    return _then(_value.copyWith(
      fontFamily: null == fontFamily
          ? _value.fontFamily
          : fontFamily // ignore: cast_nullable_to_non_nullable
              as String,
      character: null == character
          ? _value.character
          : character // ignore: cast_nullable_to_non_nullable
              as AppIconCharactersData,
      sizes: null == sizes
          ? _value.sizes
          : sizes // ignore: cast_nullable_to_non_nullable
              as AppIconSizesData,
    ) as $Val);
  }

  /// Create a copy of AppIconData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppIconCharactersDataCopyWith<$Res> get character {
    return $AppIconCharactersDataCopyWith<$Res>(_value.character, (value) {
      return _then(_value.copyWith(character: value) as $Val);
    });
  }

  /// Create a copy of AppIconData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $AppIconSizesDataCopyWith<$Res> get sizes {
    return $AppIconSizesDataCopyWith<$Res>(_value.sizes, (value) {
      return _then(_value.copyWith(sizes: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AppIconDataImplCopyWith<$Res>
    implements $AppIconDataCopyWith<$Res> {
  factory _$$AppIconDataImplCopyWith(
          _$AppIconDataImpl value, $Res Function(_$AppIconDataImpl) then) =
      __$$AppIconDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String fontFamily,
      AppIconCharactersData character,
      AppIconSizesData sizes});

  @override
  $AppIconCharactersDataCopyWith<$Res> get character;
  @override
  $AppIconSizesDataCopyWith<$Res> get sizes;
}

/// @nodoc
class __$$AppIconDataImplCopyWithImpl<$Res>
    extends _$AppIconDataCopyWithImpl<$Res, _$AppIconDataImpl>
    implements _$$AppIconDataImplCopyWith<$Res> {
  __$$AppIconDataImplCopyWithImpl(
      _$AppIconDataImpl _value, $Res Function(_$AppIconDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppIconData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fontFamily = null,
    Object? character = null,
    Object? sizes = null,
  }) {
    return _then(_$AppIconDataImpl(
      fontFamily: null == fontFamily
          ? _value.fontFamily
          : fontFamily // ignore: cast_nullable_to_non_nullable
              as String,
      character: null == character
          ? _value.character
          : character // ignore: cast_nullable_to_non_nullable
              as AppIconCharactersData,
      sizes: null == sizes
          ? _value.sizes
          : sizes // ignore: cast_nullable_to_non_nullable
              as AppIconSizesData,
    ));
  }
}

/// @nodoc

class _$AppIconDataImpl extends _AppIconData {
  _$AppIconDataImpl(
      {required this.fontFamily, required this.character, required this.sizes})
      : super._();

  @override
  final String fontFamily;
//required String fontPackage,
  @override
  final AppIconCharactersData character;
  @override
  final AppIconSizesData sizes;

  @override
  String toString() {
    return 'AppIconData(fontFamily: $fontFamily, character: $character, sizes: $sizes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppIconDataImpl &&
            (identical(other.fontFamily, fontFamily) ||
                other.fontFamily == fontFamily) &&
            (identical(other.character, character) ||
                other.character == character) &&
            (identical(other.sizes, sizes) || other.sizes == sizes));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fontFamily, character, sizes);

  /// Create a copy of AppIconData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppIconDataImplCopyWith<_$AppIconDataImpl> get copyWith =>
      __$$AppIconDataImplCopyWithImpl<_$AppIconDataImpl>(this, _$identity);
}

abstract class _AppIconData extends AppIconData {
  factory _AppIconData(
      {required final String fontFamily,
      required final AppIconCharactersData character,
      required final AppIconSizesData sizes}) = _$AppIconDataImpl;
  _AppIconData._() : super._();

  @override
  String get fontFamily; //required String fontPackage,
  @override
  AppIconCharactersData get character;
  @override
  AppIconSizesData get sizes;

  /// Create a copy of AppIconData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppIconDataImplCopyWith<_$AppIconDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AppIconCharactersData {
  String get awareness => throw _privateConstructorUsedError;
  String get search => throw _privateConstructorUsedError;
  String get dataProtection => throw _privateConstructorUsedError;
  String get threat => throw _privateConstructorUsedError;

  /// Create a copy of AppIconCharactersData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppIconCharactersDataCopyWith<AppIconCharactersData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppIconCharactersDataCopyWith<$Res> {
  factory $AppIconCharactersDataCopyWith(AppIconCharactersData value,
          $Res Function(AppIconCharactersData) then) =
      _$AppIconCharactersDataCopyWithImpl<$Res, AppIconCharactersData>;
  @useResult
  $Res call(
      {String awareness, String search, String dataProtection, String threat});
}

/// @nodoc
class _$AppIconCharactersDataCopyWithImpl<$Res,
        $Val extends AppIconCharactersData>
    implements $AppIconCharactersDataCopyWith<$Res> {
  _$AppIconCharactersDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppIconCharactersData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? awareness = null,
    Object? search = null,
    Object? dataProtection = null,
    Object? threat = null,
  }) {
    return _then(_value.copyWith(
      awareness: null == awareness
          ? _value.awareness
          : awareness // ignore: cast_nullable_to_non_nullable
              as String,
      search: null == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String,
      dataProtection: null == dataProtection
          ? _value.dataProtection
          : dataProtection // ignore: cast_nullable_to_non_nullable
              as String,
      threat: null == threat
          ? _value.threat
          : threat // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppIconCharactersDataImplCopyWith<$Res>
    implements $AppIconCharactersDataCopyWith<$Res> {
  factory _$$AppIconCharactersDataImplCopyWith(
          _$AppIconCharactersDataImpl value,
          $Res Function(_$AppIconCharactersDataImpl) then) =
      __$$AppIconCharactersDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String awareness, String search, String dataProtection, String threat});
}

/// @nodoc
class __$$AppIconCharactersDataImplCopyWithImpl<$Res>
    extends _$AppIconCharactersDataCopyWithImpl<$Res,
        _$AppIconCharactersDataImpl>
    implements _$$AppIconCharactersDataImplCopyWith<$Res> {
  __$$AppIconCharactersDataImplCopyWithImpl(_$AppIconCharactersDataImpl _value,
      $Res Function(_$AppIconCharactersDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppIconCharactersData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? awareness = null,
    Object? search = null,
    Object? dataProtection = null,
    Object? threat = null,
  }) {
    return _then(_$AppIconCharactersDataImpl(
      awareness: null == awareness
          ? _value.awareness
          : awareness // ignore: cast_nullable_to_non_nullable
              as String,
      search: null == search
          ? _value.search
          : search // ignore: cast_nullable_to_non_nullable
              as String,
      dataProtection: null == dataProtection
          ? _value.dataProtection
          : dataProtection // ignore: cast_nullable_to_non_nullable
              as String,
      threat: null == threat
          ? _value.threat
          : threat // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AppIconCharactersDataImpl extends _AppIconCharactersData {
  _$AppIconCharactersDataImpl(
      {required this.awareness,
      required this.search,
      required this.dataProtection,
      required this.threat})
      : super._();

  @override
  final String awareness;
  @override
  final String search;
  @override
  final String dataProtection;
  @override
  final String threat;

  @override
  String toString() {
    return 'AppIconCharactersData(awareness: $awareness, search: $search, dataProtection: $dataProtection, threat: $threat)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppIconCharactersDataImpl &&
            (identical(other.awareness, awareness) ||
                other.awareness == awareness) &&
            (identical(other.search, search) || other.search == search) &&
            (identical(other.dataProtection, dataProtection) ||
                other.dataProtection == dataProtection) &&
            (identical(other.threat, threat) || other.threat == threat));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, awareness, search, dataProtection, threat);

  /// Create a copy of AppIconCharactersData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppIconCharactersDataImplCopyWith<_$AppIconCharactersDataImpl>
      get copyWith => __$$AppIconCharactersDataImplCopyWithImpl<
          _$AppIconCharactersDataImpl>(this, _$identity);
}

abstract class _AppIconCharactersData extends AppIconCharactersData {
  factory _AppIconCharactersData(
      {required final String awareness,
      required final String search,
      required final String dataProtection,
      required final String threat}) = _$AppIconCharactersDataImpl;
  _AppIconCharactersData._() : super._();

  @override
  String get awareness;
  @override
  String get search;
  @override
  String get dataProtection;
  @override
  String get threat;

  /// Create a copy of AppIconCharactersData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppIconCharactersDataImplCopyWith<_$AppIconCharactersDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AppIconSizesData {
  double get small => throw _privateConstructorUsedError;
  double get medium => throw _privateConstructorUsedError;
  double get large => throw _privateConstructorUsedError;

  /// Create a copy of AppIconSizesData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppIconSizesDataCopyWith<AppIconSizesData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppIconSizesDataCopyWith<$Res> {
  factory $AppIconSizesDataCopyWith(
          AppIconSizesData value, $Res Function(AppIconSizesData) then) =
      _$AppIconSizesDataCopyWithImpl<$Res, AppIconSizesData>;
  @useResult
  $Res call({double small, double medium, double large});
}

/// @nodoc
class _$AppIconSizesDataCopyWithImpl<$Res, $Val extends AppIconSizesData>
    implements $AppIconSizesDataCopyWith<$Res> {
  _$AppIconSizesDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppIconSizesData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? small = null,
    Object? medium = null,
    Object? large = null,
  }) {
    return _then(_value.copyWith(
      small: null == small
          ? _value.small
          : small // ignore: cast_nullable_to_non_nullable
              as double,
      medium: null == medium
          ? _value.medium
          : medium // ignore: cast_nullable_to_non_nullable
              as double,
      large: null == large
          ? _value.large
          : large // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppIconSizeDataImplCopyWith<$Res>
    implements $AppIconSizesDataCopyWith<$Res> {
  factory _$$AppIconSizeDataImplCopyWith(_$AppIconSizeDataImpl value,
          $Res Function(_$AppIconSizeDataImpl) then) =
      __$$AppIconSizeDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double small, double medium, double large});
}

/// @nodoc
class __$$AppIconSizeDataImplCopyWithImpl<$Res>
    extends _$AppIconSizesDataCopyWithImpl<$Res, _$AppIconSizeDataImpl>
    implements _$$AppIconSizeDataImplCopyWith<$Res> {
  __$$AppIconSizeDataImplCopyWithImpl(
      _$AppIconSizeDataImpl _value, $Res Function(_$AppIconSizeDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppIconSizesData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? small = null,
    Object? medium = null,
    Object? large = null,
  }) {
    return _then(_$AppIconSizeDataImpl(
      small: null == small
          ? _value.small
          : small // ignore: cast_nullable_to_non_nullable
              as double,
      medium: null == medium
          ? _value.medium
          : medium // ignore: cast_nullable_to_non_nullable
              as double,
      large: null == large
          ? _value.large
          : large // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$AppIconSizeDataImpl extends _AppIconSizeData {
  _$AppIconSizeDataImpl(
      {required this.small, required this.medium, required this.large})
      : super._();

  @override
  final double small;
  @override
  final double medium;
  @override
  final double large;

  @override
  String toString() {
    return 'AppIconSizesData(small: $small, medium: $medium, large: $large)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppIconSizeDataImpl &&
            (identical(other.small, small) || other.small == small) &&
            (identical(other.medium, medium) || other.medium == medium) &&
            (identical(other.large, large) || other.large == large));
  }

  @override
  int get hashCode => Object.hash(runtimeType, small, medium, large);

  /// Create a copy of AppIconSizesData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppIconSizeDataImplCopyWith<_$AppIconSizeDataImpl> get copyWith =>
      __$$AppIconSizeDataImplCopyWithImpl<_$AppIconSizeDataImpl>(
          this, _$identity);
}

abstract class _AppIconSizeData extends AppIconSizesData {
  factory _AppIconSizeData(
      {required final double small,
      required final double medium,
      required final double large}) = _$AppIconSizeDataImpl;
  _AppIconSizeData._() : super._();

  @override
  double get small;
  @override
  double get medium;
  @override
  double get large;

  /// Create a copy of AppIconSizesData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppIconSizeDataImplCopyWith<_$AppIconSizeDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
