// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$taskServiceHash() => r'070bf5da602bbc1fe079d744f26a892846864d81';

/// See also [taskService].
@ProviderFor(taskService)
final taskServiceProvider = AutoDisposeProvider<TaskService>.internal(
  taskService,
  name: r'taskServiceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$taskServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TaskServiceRef = AutoDisposeProviderRef<TaskService>;
String _$taskStreamHash() => r'84ce48e10d85e12129760b4c6977e260baea34db';

/// See also [taskStream].
@ProviderFor(taskStream)
final taskStreamProvider = StreamProvider<Task>.internal(
  taskStream,
  name: r'taskStreamProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$taskStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TaskStreamRef = StreamProviderRef<Task>;
String _$filterProtectListHash() => r'8cf15433c9ab9d3ac849da4df981a7797e4419a7';

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

/// See also [filterProtectList].
@ProviderFor(filterProtectList)
const filterProtectListProvider = FilterProtectListFamily();

/// See also [filterProtectList].
class FilterProtectListFamily extends Family<AsyncValue<Task>> {
  /// See also [filterProtectList].
  const FilterProtectListFamily();

  /// See also [filterProtectList].
  FilterProtectListProvider call({
    required List<TodoTask> todoTask,
  }) {
    return FilterProtectListProvider(
      todoTask: todoTask,
    );
  }

  @override
  FilterProtectListProvider getProviderOverride(
    covariant FilterProtectListProvider provider,
  ) {
    return call(
      todoTask: provider.todoTask,
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
  String? get name => r'filterProtectListProvider';
}

/// See also [filterProtectList].
class FilterProtectListProvider extends AutoDisposeFutureProvider<Task> {
  /// See also [filterProtectList].
  FilterProtectListProvider({
    required List<TodoTask> todoTask,
  }) : this._internal(
          (ref) => filterProtectList(
            ref as FilterProtectListRef,
            todoTask: todoTask,
          ),
          from: filterProtectListProvider,
          name: r'filterProtectListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$filterProtectListHash,
          dependencies: FilterProtectListFamily._dependencies,
          allTransitiveDependencies:
              FilterProtectListFamily._allTransitiveDependencies,
          todoTask: todoTask,
        );

  FilterProtectListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.todoTask,
  }) : super.internal();

  final List<TodoTask> todoTask;

  @override
  Override overrideWith(
    FutureOr<Task> Function(FilterProtectListRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FilterProtectListProvider._internal(
        (ref) => create(ref as FilterProtectListRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        todoTask: todoTask,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Task> createElement() {
    return _FilterProtectListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FilterProtectListProvider && other.todoTask == todoTask;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, todoTask.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FilterProtectListRef on AutoDisposeFutureProviderRef<Task> {
  /// The parameter `todoTask` of this provider.
  List<TodoTask> get todoTask;
}

class _FilterProtectListProviderElement
    extends AutoDisposeFutureProviderElement<Task> with FilterProtectListRef {
  _FilterProtectListProviderElement(super.provider);

  @override
  List<TodoTask> get todoTask => (origin as FilterProtectListProvider).todoTask;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
