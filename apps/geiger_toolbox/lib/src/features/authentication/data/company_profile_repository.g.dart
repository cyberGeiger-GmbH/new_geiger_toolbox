// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_profile_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$companyProfileRepositoryHash() =>
    r'10e72e0ef4625caf97459ba5af3cb93ecbffbbe5';

/// See also [companyProfileRepository].
@ProviderFor(companyProfileRepository)
final companyProfileRepositoryProvider =
    Provider<CompanyProfileRepository>.internal(
  companyProfileRepository,
  name: r'companyProfileRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$companyProfileRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CompanyProfileRepositoryRef = ProviderRef<CompanyProfileRepository>;
String _$watchCompanyHash() => r'd3a7d97739b6c267348b8339b4ae08c8d3f9eb34';

/// See also [watchCompany].
@ProviderFor(watchCompany)
final watchCompanyProvider = AutoDisposeStreamProvider<Company?>.internal(
  watchCompany,
  name: r'watchCompanyProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$watchCompanyHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef WatchCompanyRef = AutoDisposeStreamProviderRef<Company?>;
String _$fetchCompanyHash() => r'ac74d76cc1675a5e7399c639c33bfdfc9646e9c2';

/// See also [fetchCompany].
@ProviderFor(fetchCompany)
final fetchCompanyProvider = FutureProvider<Company?>.internal(
  fetchCompany,
  name: r'fetchCompanyProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$fetchCompanyHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef FetchCompanyRef = FutureProviderRef<Company?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
