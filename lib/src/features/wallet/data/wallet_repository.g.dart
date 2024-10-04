// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$walletRepositoryHash() => r'0306baea7fbd62718f75b8b112364e7eae2aa52b';

/// See also [walletRepository].
@ProviderFor(walletRepository)
final walletRepositoryProvider = AutoDisposeProvider<WalletRepository>.internal(
  walletRepository,
  name: r'walletRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$walletRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef WalletRepositoryRef = AutoDisposeProviderRef<WalletRepository>;
String _$fetchProfileHash() => r'17329dd6db7388da3aea11c8689be2f49395e4b2';

/// See also [fetchProfile].
@ProviderFor(fetchProfile)
final fetchProfileProvider = AutoDisposeFutureProvider<Balance>.internal(
  fetchProfile,
  name: r'fetchProfileProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$fetchProfileHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchProfileRef = AutoDisposeFutureProviderRef<Balance>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
