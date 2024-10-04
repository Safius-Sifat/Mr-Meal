import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../exception/error_logger.dart';
import '../../authentication/data/auth_repository.dart';
import '../../authentication/domain/app_user.dart';
import '../data/local/local_cart_repository.dart';
import '../data/remote/remote_cart_repository.dart';
import '../domain/online_cart.dart';

part 'cart_sync_service.g.dart';

class CartSyncService {
  CartSyncService(this.ref) {
    _init();
  }
  final Ref ref;

  ProviderListenable<dynamic>? get productsRepositoryProvider => null;

  void _init() {
    ref.listen<AsyncValue<AppUser?>>(authStateChangesProvider,
        (previous, next) {
      final previousUser = previous?.value;
      final user = next.value;
      if (previousUser == null && user != null) {
        _moveItemsToRemoteCart(user.token);
      }
    });
  }

  // / moves all items from the local to the remote cart taking into account the
  // / available quantities
  Future<void> _moveItemsToRemoteCart(String uid) async {
    try {
      // Get the local cart data
      final localCartRepository = ref.read(localCartRepositoryProvider);
      final localCart = await localCartRepository.fetchCart();
      if (localCart.carts.isNotEmpty) {
        // Get the remote cart data
        final remoteCartRepository = ref.read(remoteCartRepositoryProvider);
        final remoteCart = await remoteCartRepository.fetchCart(token: uid);
        final localItemsToAdd =
            // await _getLocalItemsToAdd(localCart, remoteCart);
            // Add all the local items to the remote cart
            // final updatedRemoteCart = remoteCart.addItems(localItemsToAdd);
            // Write the updated remote cart data to the repository
            // await remoteCartRepository.setCart(uid, updatedRemoteCart);
            // Remove all items from the local cart
            await localCartRepository.setCart(const RemoteCart(carts: []));
      }
    } catch (e, st) {
      ref.read(errorLoggerProvider).logError(e, st);
    }
  }

  // Future<List<CartItem>> _getLocalItemsToAdd(
  //     Cart localCart, Cart remoteCart) async {
  //   // Get the list of products (needed to read the available quantities)
  //   final productsRepository = ref.read(itemRepositoryProvider);
  //   // ignore: avoid_dynamic_calls
  //   final products = await productsRepository.fetchItems(1, CancelToken());
  //   // Figure out which items need to be added
  //   final localItemsToAdd = <CartItem>[];
  //   for (final localItem in localCart.items.entries) {
  //     final productId = localItem.key;
  //     final localQuantity = localItem.value;
  //     // get the quantity for the corresponding item in the remote cart
  //     final remoteQuantity = remoteCart.items[productId] ?? 0;
  //     final product = products.firstWhere((product) => product.id == productId);
  //     // Cap the quantity of each item to the available quantity
  //     final cappedLocalQuantity = min(
  //       localQuantity,
  //       product.availableQuantity - remoteQuantity,
  //     );
  //     // if the capped quantity is > 0, add to the list of items to add
  //     if (cappedLocalQuantity > 0) {
  //       localItemsToAdd
  //           .add(CartItem(productId: productId, quantity: cappedLocalQuantity));
  //     }
  //   }
  //   return localItemsToAdd;
  // }
}

@Riverpod(keepAlive: true)
CartSyncService cartSyncService(CartSyncServiceRef ref) {
  return CartSyncService(ref);
}
