// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$packageRepositoryHash() => r'c6f440794e4542e9dc6e7af38ce6563059cb33f2';

/// See also [packageRepository].
@ProviderFor(packageRepository)
final packageRepositoryProvider =
    AutoDisposeProvider<PackageRepository>.internal(
  packageRepository,
  name: r'packageRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$packageRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PackageRepositoryRef = AutoDisposeProviderRef<PackageRepository>;
String _$fetchPackagesByCategoryHash() =>
    r'd54b08995993abec0a1b9e40effe9a5ea70458e9';

/// See also [fetchPackagesByCategory].
@ProviderFor(fetchPackagesByCategory)
final fetchPackagesByCategoryProvider =
    AutoDisposeFutureProvider<PackagesByCategory>.internal(
  fetchPackagesByCategory,
  name: r'fetchPackagesByCategoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchPackagesByCategoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchPackagesByCategoryRef
    = AutoDisposeFutureProviderRef<PackagesByCategory>;
String _$fetchPackagesHash() => r'764ae9e20842c6c5c875e661a275a9fc64e64a11';

/// See also [fetchPackages].
@ProviderFor(fetchPackages)
final fetchPackagesProvider = AutoDisposeFutureProvider<Packages>.internal(
  fetchPackages,
  name: r'fetchPackagesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchPackagesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchPackagesRef = AutoDisposeFutureProviderRef<Packages>;
String _$getPackageDetailHash() => r'25da19f7220923627b1b078e792d3ee623232366';

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

/// See also [getPackageDetail].
@ProviderFor(getPackageDetail)
const getPackageDetailProvider = GetPackageDetailFamily();

/// See also [getPackageDetail].
class GetPackageDetailFamily extends Family<AsyncValue<PackageDetail>> {
  /// See also [getPackageDetail].
  const GetPackageDetailFamily();

  /// See also [getPackageDetail].
  GetPackageDetailProvider call({
    required int id,
  }) {
    return GetPackageDetailProvider(
      id: id,
    );
  }

  @override
  GetPackageDetailProvider getProviderOverride(
    covariant GetPackageDetailProvider provider,
  ) {
    return call(
      id: provider.id,
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
  String? get name => r'getPackageDetailProvider';
}

/// See also [getPackageDetail].
class GetPackageDetailProvider
    extends AutoDisposeFutureProvider<PackageDetail> {
  /// See also [getPackageDetail].
  GetPackageDetailProvider({
    required int id,
  }) : this._internal(
          (ref) => getPackageDetail(
            ref as GetPackageDetailRef,
            id: id,
          ),
          from: getPackageDetailProvider,
          name: r'getPackageDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getPackageDetailHash,
          dependencies: GetPackageDetailFamily._dependencies,
          allTransitiveDependencies:
              GetPackageDetailFamily._allTransitiveDependencies,
          id: id,
        );

  GetPackageDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<PackageDetail> Function(GetPackageDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetPackageDetailProvider._internal(
        (ref) => create(ref as GetPackageDetailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<PackageDetail> createElement() {
    return _GetPackageDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetPackageDetailProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetPackageDetailRef on AutoDisposeFutureProviderRef<PackageDetail> {
  /// The parameter `id` of this provider.
  int get id;
}

class _GetPackageDetailProviderElement
    extends AutoDisposeFutureProviderElement<PackageDetail>
    with GetPackageDetailRef {
  _GetPackageDetailProviderElement(super.provider);

  @override
  int get id => (origin as GetPackageDetailProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
