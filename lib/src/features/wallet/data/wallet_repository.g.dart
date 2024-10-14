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
String _$fetchBalanceHash() => r'765faf22bbc6aee49efa69a9c2e103c4e20be148';

/// See also [fetchBalance].
@ProviderFor(fetchBalance)
final fetchBalanceProvider = AutoDisposeFutureProvider<Balance>.internal(
  fetchBalance,
  name: r'fetchBalanceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$fetchBalanceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchBalanceRef = AutoDisposeFutureProviderRef<Balance>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
