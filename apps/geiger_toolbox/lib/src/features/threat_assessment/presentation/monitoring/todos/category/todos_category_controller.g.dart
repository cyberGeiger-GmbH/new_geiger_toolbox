// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todos_category_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$todosCategoryControllerHash() =>
    r'5ff7057219f227bbc028be4edef1b0c40f4ebe50';

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

abstract class _$TodosCategoryController
    extends BuildlessNotifier<TodoOfferingCategory> {
  late final TodoOfferingCategory category;

  TodoOfferingCategory build(TodoOfferingCategory category);
}

/// See also [TodosCategoryController].
@ProviderFor(TodosCategoryController)
const todosCategoryControllerProvider = TodosCategoryControllerFamily();

/// See also [TodosCategoryController].
class TodosCategoryControllerFamily extends Family<TodoOfferingCategory> {
  /// See also [TodosCategoryController].
  const TodosCategoryControllerFamily();

  /// See also [TodosCategoryController].
  TodosCategoryControllerProvider call(TodoOfferingCategory category) {
    return TodosCategoryControllerProvider(category);
  }

  @override
  TodosCategoryControllerProvider getProviderOverride(
    covariant TodosCategoryControllerProvider provider,
  ) {
    return call(provider.category);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'todosCategoryControllerProvider';
}

/// See also [TodosCategoryController].
class TodosCategoryControllerProvider
    extends
        NotifierProviderImpl<TodosCategoryController, TodoOfferingCategory> {
  /// See also [TodosCategoryController].
  TodosCategoryControllerProvider(TodoOfferingCategory category)
    : this._internal(
        () => TodosCategoryController()..category = category,
        from: todosCategoryControllerProvider,
        name: r'todosCategoryControllerProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$todosCategoryControllerHash,
        dependencies: TodosCategoryControllerFamily._dependencies,
        allTransitiveDependencies:
            TodosCategoryControllerFamily._allTransitiveDependencies,
        category: category,
      );

  TodosCategoryControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.category,
  }) : super.internal();

  final TodoOfferingCategory category;

  @override
  TodoOfferingCategory runNotifierBuild(
    covariant TodosCategoryController notifier,
  ) {
    return notifier.build(category);
  }

  @override
  Override overrideWith(TodosCategoryController Function() create) {
    return ProviderOverride(
      origin: this,
      override: TodosCategoryControllerProvider._internal(
        () => create()..category = category,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        category: category,
      ),
    );
  }

  @override
  NotifierProviderElement<TodosCategoryController, TodoOfferingCategory>
  createElement() {
    return _TodosCategoryControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TodosCategoryControllerProvider &&
        other.category == category;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, category.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin TodosCategoryControllerRef on NotifierProviderRef<TodoOfferingCategory> {
  /// The parameter `category` of this provider.
  TodoOfferingCategory get category;
}

class _TodosCategoryControllerProviderElement
    extends
        NotifierProviderElement<TodosCategoryController, TodoOfferingCategory>
    with TodosCategoryControllerRef {
  _TodosCategoryControllerProviderElement(super.provider);

  @override
  TodoOfferingCategory get category =>
      (origin as TodosCategoryControllerProvider).category;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
