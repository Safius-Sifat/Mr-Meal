// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_to_cart_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$addToCartControllerHash() =>
    r'e4b028f745d2a4df286368ffc4ac253192e11c3d';

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

abstract class _$AddToCartController
    extends BuildlessAutoDisposeAsyncNotifier<void> {
  late final int id;

  FutureOr<void> build(
    int id,
  );
}

/// See also [AddToCartController].
@ProviderFor(AddToCartController)
const addToCartControllerProvider = AddToCartControllerFamily();

/// See also [AddToCartController].
class AddToCartControllerFamily extends Family<AsyncValue<void>> {
  /// See also [AddToCartController].
  const AddToCartControllerFamily();

  /// See also [AddToCartController].
  AddToCartControllerProvider call(
    int id,
  ) {
    return AddToCartControllerProvider(
      id,
    );
  }

  @override
  AddToCartControllerProvider getProviderOverride(
    covariant AddToCartControllerProvider provider,
  ) {
    return call(
      provider.id,
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
  String? get name => r'addToCartControllerProvider';
}

/// See also [AddToCartController].
class AddToCartControllerProvider
    extends AutoDisposeAsyncNotifierProviderImpl<AddToCartController, void> {
  /// See also [AddToCartController].
  AddToCartControllerProvider(
    int id,
  ) : this._internal(
          () => AddToCartController()..id = id,
          from: addToCartControllerProvider,
          name: r'addToCartControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$addToCartControllerHash,
          dependencies: AddToCartControllerFamily._dependencies,
          allTransitiveDependencies:
              AddToCartControllerFamily._allTransitiveDependencies,
          id: id,
        );

  AddToCartControllerProvider._internal(
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
  FutureOr<void> runNotifierBuild(
    covariant AddToCartController notifier,
  ) {
    return notifier.build(
      id,
    );
  }

  @override
  Override overrideWith(AddToCartController Function() create) {
    return ProviderOverride(
      origin: this,
      override: AddToCartControllerProvider._internal(
        () => create()..id = id,
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
  AutoDisposeAsyncNotifierProviderElement<AddToCartController, void>
      createElement() {
    return _AddToCartControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AddToCartControllerProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AddToCartControllerRef on AutoDisposeAsyncNotifierProviderRef<void> {
  /// The parameter `id` of this provider.
  int get id;
}

class _AddToCartControllerProviderElement
    extends AutoDisposeAsyncNotifierProviderElement<AddToCartController, void>
    with AddToCartControllerRef {
  _AddToCartControllerProviderElement(super.provider);

  @override
  int get id => (origin as AddToCartControllerProvider).id;
}

String _$itemQuantityControllerHash() =>
    r'e3aebb6b912ee6ef8fd2ff6b1ab26201380f7862';

/// See also [ItemQuantityController].
@ProviderFor(ItemQuantityController)
final itemQuantityControllerProvider =
    AutoDisposeNotifierProvider<ItemQuantityController, int>.internal(
  ItemQuantityController.new,
  name: r'itemQuantityControllerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$itemQuantityControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ItemQuantityController = AutoDisposeNotifier<int>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
