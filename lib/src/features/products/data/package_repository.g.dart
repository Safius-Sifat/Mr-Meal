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
    r'9abc955ff50cf2b6ed9f605e6a7739ea3c434c06';

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

/// See also [fetchPackagesByCategory].
@ProviderFor(fetchPackagesByCategory)
const fetchPackagesByCategoryProvider = FetchPackagesByCategoryFamily();

/// See also [fetchPackagesByCategory].
class FetchPackagesByCategoryFamily extends Family<AsyncValue<Packages>> {
  /// See also [fetchPackagesByCategory].
  const FetchPackagesByCategoryFamily();

  /// See also [fetchPackagesByCategory].
  FetchPackagesByCategoryProvider call({
    required int categoryId,
    required int page,
  }) {
    return FetchPackagesByCategoryProvider(
      categoryId: categoryId,
      page: page,
    );
  }

  @override
  FetchPackagesByCategoryProvider getProviderOverride(
    covariant FetchPackagesByCategoryProvider provider,
  ) {
    return call(
      categoryId: provider.categoryId,
      page: provider.page,
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
  String? get name => r'fetchPackagesByCategoryProvider';
}

/// See also [fetchPackagesByCategory].
class FetchPackagesByCategoryProvider
    extends AutoDisposeFutureProvider<Packages> {
  /// See also [fetchPackagesByCategory].
  FetchPackagesByCategoryProvider({
    required int categoryId,
    required int page,
  }) : this._internal(
          (ref) => fetchPackagesByCategory(
            ref as FetchPackagesByCategoryRef,
            categoryId: categoryId,
            page: page,
          ),
          from: fetchPackagesByCategoryProvider,
          name: r'fetchPackagesByCategoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchPackagesByCategoryHash,
          dependencies: FetchPackagesByCategoryFamily._dependencies,
          allTransitiveDependencies:
              FetchPackagesByCategoryFamily._allTransitiveDependencies,
          categoryId: categoryId,
          page: page,
        );

  FetchPackagesByCategoryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.categoryId,
    required this.page,
  }) : super.internal();

  final int categoryId;
  final int page;

  @override
  Override overrideWith(
    FutureOr<Packages> Function(FetchPackagesByCategoryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchPackagesByCategoryProvider._internal(
        (ref) => create(ref as FetchPackagesByCategoryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        categoryId: categoryId,
        page: page,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Packages> createElement() {
    return _FetchPackagesByCategoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchPackagesByCategoryProvider &&
        other.categoryId == categoryId &&
        other.page == page;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, categoryId.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchPackagesByCategoryRef on AutoDisposeFutureProviderRef<Packages> {
  /// The parameter `categoryId` of this provider.
  int get categoryId;

  /// The parameter `page` of this provider.
  int get page;
}

class _FetchPackagesByCategoryProviderElement
    extends AutoDisposeFutureProviderElement<Packages>
    with FetchPackagesByCategoryRef {
  _FetchPackagesByCategoryProviderElement(super.provider);

  @override
  int get categoryId => (origin as FetchPackagesByCategoryProvider).categoryId;
  @override
  int get page => (origin as FetchPackagesByCategoryProvider).page;
}

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
String _$fetchPackageCategoriesHash() =>
    r'b2c030611f53be980834541f4b2adaa85ace1f86';

/// See also [fetchPackageCategories].
@ProviderFor(fetchPackageCategories)
final fetchPackageCategoriesProvider =
    AutoDisposeFutureProvider<List<PackageCategory>>.internal(
  fetchPackageCategories,
  name: r'fetchPackageCategoriesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchPackageCategoriesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchPackageCategoriesRef
    = AutoDisposeFutureProviderRef<List<PackageCategory>>;
String _$getPackageDetailHash() => r'25da19f7220923627b1b078e792d3ee623232366';

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
