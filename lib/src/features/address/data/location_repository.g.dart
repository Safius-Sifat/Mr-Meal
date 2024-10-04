// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$locationRepositoryHash() =>
    r'3fa0af4681c06cc44166798250041a1056a2274e';

/// See also [locationRepository].
@ProviderFor(locationRepository)
final locationRepositoryProvider =
    AutoDisposeProvider<LocationRepository>.internal(
  locationRepository,
  name: r'locationRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$locationRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LocationRepositoryRef = AutoDisposeProviderRef<LocationRepository>;
String _$fetchAddressHash() => r'8d85e7c1b9aafab58cdd70a5784c5a2bc1af4f3a';

/// See also [fetchAddress].
@ProviderFor(fetchAddress)
final fetchAddressProvider = AutoDisposeFutureProvider<Address>.internal(
  fetchAddress,
  name: r'fetchAddressProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$fetchAddressHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchAddressRef = AutoDisposeFutureProviderRef<Address>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
