// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$cartServiceHash() => r'db56fab553dde3f2dafbe456c14e199a66bab2d5';

/// See also [cartService].
@ProviderFor(cartService)
final cartServiceProvider = Provider<CartService>.internal(
  cartService,
  name: r'cartServiceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$cartServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CartServiceRef = ProviderRef<CartService>;
String _$cartHash() => r'dc4a246830c1718d60ab0f2807a063824fce16cf';

/// See also [cart].
@ProviderFor(cart)
final cartProvider = StreamProvider<RemoteCart>.internal(
  cart,
  name: r'cartProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$cartHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CartRef = StreamProviderRef<RemoteCart>;
String _$cartItemsCountHash() => r'54617f31ae1ee3d22c9753317ac09ed0023aec23';

/// See also [cartItemsCount].
@ProviderFor(cartItemsCount)
final cartItemsCountProvider = Provider<int>.internal(
  cartItemsCount,
  name: r'cartItemsCountProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$cartItemsCountHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CartItemsCountRef = ProviderRef<int>;
String _$cartTotalHash() => r'227479b7a71a799cfba8d4461ce7be53a715c880';

/// See also [cartTotal].
@ProviderFor(cartTotal)
final cartTotalProvider = AutoDisposeProvider<double>.internal(
  cartTotal,
  name: r'cartTotalProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$cartTotalHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CartTotalRef = AutoDisposeProviderRef<double>;
String _$itemAvailableQuantityHash() =>
    r'89e247cd76ca7272ff3e6d8ea628e1f7041697b8';

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

/// See also [itemAvailableQuantity].
@ProviderFor(itemAvailableQuantity)
const itemAvailableQuantityProvider = ItemAvailableQuantityFamily();

/// See also [itemAvailableQuantity].
class ItemAvailableQuantityFamily extends Family<int> {
  /// See also [itemAvailableQuantity].
  const ItemAvailableQuantityFamily();

  /// See also [itemAvailableQuantity].
  ItemAvailableQuantityProvider call([
    ItemDetail? product,
    PackageDetail? package,
  ]) {
    return ItemAvailableQuantityProvider(
      product,
      package,
    );
  }

  @override
  ItemAvailableQuantityProvider getProviderOverride(
    covariant ItemAvailableQuantityProvider provider,
  ) {
    return call(
      provider.product,
      provider.package,
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
  String? get name => r'itemAvailableQuantityProvider';
}

/// See also [itemAvailableQuantity].
class ItemAvailableQuantityProvider extends AutoDisposeProvider<int> {
  /// See also [itemAvailableQuantity].
  ItemAvailableQuantityProvider([
    ItemDetail? product,
    PackageDetail? package,
  ]) : this._internal(
          (ref) => itemAvailableQuantity(
            ref as ItemAvailableQuantityRef,
            product,
            package,
          ),
          from: itemAvailableQuantityProvider,
          name: r'itemAvailableQuantityProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$itemAvailableQuantityHash,
          dependencies: ItemAvailableQuantityFamily._dependencies,
          allTransitiveDependencies:
              ItemAvailableQuantityFamily._allTransitiveDependencies,
          product: product,
          package: package,
        );

  ItemAvailableQuantityProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.product,
    required this.package,
  }) : super.internal();

  final ItemDetail? product;
  final PackageDetail? package;

  @override
  Override overrideWith(
    int Function(ItemAvailableQuantityRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ItemAvailableQuantityProvider._internal(
        (ref) => create(ref as ItemAvailableQuantityRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        product: product,
        package: package,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<int> createElement() {
    return _ItemAvailableQuantityProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ItemAvailableQuantityProvider &&
        other.product == product &&
        other.package == package;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, product.hashCode);
    hash = _SystemHash.combine(hash, package.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ItemAvailableQuantityRef on AutoDisposeProviderRef<int> {
  /// The parameter `product` of this provider.
  ItemDetail? get product;

  /// The parameter `package` of this provider.
  PackageDetail? get package;
}

class _ItemAvailableQuantityProviderElement
    extends AutoDisposeProviderElement<int> with ItemAvailableQuantityRef {
  _ItemAvailableQuantityProviderElement(super.provider);

  @override
  ItemDetail? get product => (origin as ItemAvailableQuantityProvider).product;
  @override
  PackageDetail? get package =>
      (origin as ItemAvailableQuantityProvider).package;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
