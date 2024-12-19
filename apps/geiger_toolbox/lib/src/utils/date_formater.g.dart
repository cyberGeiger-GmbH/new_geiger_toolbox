// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'date_formater.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$formattedDateHash() => r'f40ce6e854b559eae576fa03ff1f8c77f6131f11';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [formattedDate].
@ProviderFor(formattedDate)
const formattedDateProvider = FormattedDateFamily();

/// See also [formattedDate].
class FormattedDateFamily extends Family<String> {
  /// See also [formattedDate].
  const FormattedDateFamily();

  /// See also [formattedDate].
  FormattedDateProvider call({
    required String inputDate,
  }) {
    return FormattedDateProvider(
      inputDate: inputDate,
    );
  }

  @override
  FormattedDateProvider getProviderOverride(
    covariant FormattedDateProvider provider,
  ) {
    return call(
      inputDate: provider.inputDate,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'formattedDateProvider';
}

/// See also [formattedDate].
class FormattedDateProvider extends AutoDisposeProvider<String> {
  /// See also [formattedDate].
  FormattedDateProvider({
    required String inputDate,
  }) : this._internal(
          (ref) => formattedDate(
            ref as FormattedDateRef,
            inputDate: inputDate,
          ),
          from: formattedDateProvider,
          name: r'formattedDateProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$formattedDateHash,
          dependencies: FormattedDateFamily._dependencies,
          allTransitiveDependencies:
              FormattedDateFamily._allTransitiveDependencies,
          inputDate: inputDate,
        );

  FormattedDateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.inputDate,
  }) : super.internal();

  final String inputDate;

  @override
  Override overrideWith(
    String Function(FormattedDateRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FormattedDateProvider._internal(
        (ref) => create(ref as FormattedDateRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        inputDate: inputDate,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<String> createElement() {
    return _FormattedDateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FormattedDateProvider && other.inputDate == inputDate;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, inputDate.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FormattedDateRef on AutoDisposeProviderRef<String> {
  /// The parameter `inputDate` of this provider.
  String get inputDate;
}

class _FormattedDateProviderElement extends AutoDisposeProviderElement<String>
    with FormattedDateRef {
  _FormattedDateProviderElement(super.provider);

  @override
  String get inputDate => (origin as FormattedDateProvider).inputDate;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
