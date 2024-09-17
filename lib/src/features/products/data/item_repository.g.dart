// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$itemRepositoryHash() => r'229016b7cb4b4d622bbed1f2403665ec3e471201';

/// See also [itemRepository].
@ProviderFor(itemRepository)
final itemRepositoryProvider = AutoDisposeProvider<ItemRepository>.internal(
  itemRepository,
  name: r'itemRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$itemRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ItemRepositoryRef = AutoDisposeProviderRef<ItemRepository>;
String _$fetchSlidersHash() => r'54977564b71ddacafe71d42113722dd04f3c6385';

/// See also [fetchSliders].
@ProviderFor(fetchSliders)
final fetchSlidersProvider =
    AutoDisposeFutureProvider<List<SliderModel>>.internal(
  fetchSliders,
  name: r'fetchSlidersProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$fetchSlidersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchSlidersRef = AutoDisposeFutureProviderRef<List<SliderModel>>;
String _$fetchItemsHash() => r'341fb0a56a78e599bc083d90039bcf7fd1b543c8';

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

/// See also [fetchItems].
@ProviderFor(fetchItems)
const fetchItemsProvider = FetchItemsFamily();

/// See also [fetchItems].
class FetchItemsFamily extends Family<AsyncValue<Items>> {
  /// See also [fetchItems].
  const FetchItemsFamily();

  /// See also [fetchItems].
  FetchItemsProvider call({
    required int page,
  }) {
    return FetchItemsProvider(
      page: page,
    );
  }

  @override
  FetchItemsProvider getProviderOverride(
    covariant FetchItemsProvider provider,
  ) {
    return call(
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
  String? get name => r'fetchItemsProvider';
}

/// See also [fetchItems].
class FetchItemsProvider extends AutoDisposeFutureProvider<Items> {
  /// See also [fetchItems].
  FetchItemsProvider({
    required int page,
  }) : this._internal(
          (ref) => fetchItems(
            ref as FetchItemsRef,
            page: page,
          ),
          from: fetchItemsProvider,
          name: r'fetchItemsProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchItemsHash,
          dependencies: FetchItemsFamily._dependencies,
          allTransitiveDependencies:
              FetchItemsFamily._allTransitiveDependencies,
          page: page,
        );

  FetchItemsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.page,
  }) : super.internal();

  final int page;

  @override
  Override overrideWith(
    FutureOr<Items> Function(FetchItemsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchItemsProvider._internal(
        (ref) => create(ref as FetchItemsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        page: page,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Items> createElement() {
    return _FetchItemsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchItemsProvider && other.page == page;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, page.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin FetchItemsRef on AutoDisposeFutureProviderRef<Items> {
  /// The parameter `page` of this provider.
  int get page;
}

class _FetchItemsProviderElement extends AutoDisposeFutureProviderElement<Items>
    with FetchItemsRef {
  _FetchItemsProviderElement(super.provider);

  @override
  int get page => (origin as FetchItemsProvider).page;
}

String _$getItemDetailHash() => r'7dcdbc91efd9676044034eaa7797e5fcb86c2901';

/// See also [getItemDetail].
@ProviderFor(getItemDetail)
const getItemDetailProvider = GetItemDetailFamily();

/// See also [getItemDetail].
class GetItemDetailFamily extends Family<AsyncValue<ItemDetail>> {
  /// See also [getItemDetail].
  const GetItemDetailFamily();

  /// See also [getItemDetail].
  GetItemDetailProvider call({
    required int id,
  }) {
    return GetItemDetailProvider(
      id: id,
    );
  }

  @override
  GetItemDetailProvider getProviderOverride(
    covariant GetItemDetailProvider provider,
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
  String? get name => r'getItemDetailProvider';
}

/// See also [getItemDetail].
class GetItemDetailProvider extends AutoDisposeFutureProvider<ItemDetail> {
  /// See also [getItemDetail].
  GetItemDetailProvider({
    required int id,
  }) : this._internal(
          (ref) => getItemDetail(
            ref as GetItemDetailRef,
            id: id,
          ),
          from: getItemDetailProvider,
          name: r'getItemDetailProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getItemDetailHash,
          dependencies: GetItemDetailFamily._dependencies,
          allTransitiveDependencies:
              GetItemDetailFamily._allTransitiveDependencies,
          id: id,
        );

  GetItemDetailProvider._internal(
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
    FutureOr<ItemDetail> Function(GetItemDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetItemDetailProvider._internal(
        (ref) => create(ref as GetItemDetailRef),
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
  AutoDisposeFutureProviderElement<ItemDetail> createElement() {
    return _GetItemDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetItemDetailProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetItemDetailRef on AutoDisposeFutureProviderRef<ItemDetail> {
  /// The parameter `id` of this provider.
  int get id;
}

class _GetItemDetailProviderElement
    extends AutoDisposeFutureProviderElement<ItemDetail> with GetItemDetailRef {
  _GetItemDetailProviderElement(super.provider);

  @override
  int get id => (origin as GetItemDetailProvider).id;
}

String _$fetchItemsByCategoryHash() =>
    r'986c9a116d6011a99ea115b3ee6444e00ac00ab4';

/// See also [fetchItemsByCategory].
@ProviderFor(fetchItemsByCategory)
final fetchItemsByCategoryProvider =
    AutoDisposeFutureProvider<ItemsByCategory>.internal(
  fetchItemsByCategory,
  name: r'fetchItemsByCategoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$fetchItemsByCategoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FetchItemsByCategoryRef = AutoDisposeFutureProviderRef<ItemsByCategory>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
