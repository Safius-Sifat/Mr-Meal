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
String _$fetchSlidersHash() => r'e5fb5cc0295190b63f7651484a5ee4293b5a4995';

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
String _$fetchItemsHash() => r'a5595f6485434a7022f61be654a43b53a1448a5e';

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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
