// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$profileRepositoryHash() => r'76146eb1cf145873afed03c1d5c7a9e790e1acc2';

/// See also [profileRepository].
@ProviderFor(profileRepository)
final profileRepositoryProvider =
    AutoDisposeProvider<ProfileRepository>.internal(
  profileRepository,
  name: r'profileRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$profileRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ProfileRepositoryRef = AutoDisposeProviderRef<ProfileRepository>;
String _$fetchProfileHash() => r'34a7bf8858ae3853f73c642c79398b3bdccfc9d8';

/// See also [fetchProfile].
@ProviderFor(fetchProfile)
final fetchProfileProvider = AutoDisposeFutureProvider<Profile>.internal(
  fetchProfile,
  name: r'fetchProfileProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$fetchProfileHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchProfileRef = AutoDisposeFutureProviderRef<Profile>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
