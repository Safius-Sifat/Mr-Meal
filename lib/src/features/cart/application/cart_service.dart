import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../authentication/data/auth_repository.dart';
import '../../products/data/item_repository.dart';
import '../../products/domain/item_detail.dart';
import '../data/local/local_cart_repository.dart';
import '../data/remote/remote_cart_repository.dart';
import '../domain/cart.dart';
import '../domain/cart_item.dart';
import '../domain/mutable_cart.dart';

part 'cart_service.g.dart';

class CartService {
  CartService(this.ref);
  final Ref ref;

  /// fetch the cart from the local or remote repository
  /// depending on the user auth state
  Future<Cart> _fetchCart() {
    final user = ref.read(authRepositoryProvider).currentUser;
    if (user != null) {
      return ref.read(remoteCartRepositoryProvider).fetchCart(user.name);
    } else {
      return ref.read(localCartRepositoryProvider).fetchCart();
    }
  }

  /// save the cart to the local or remote repository
  /// depending on the user auth state
  Future<void> _setCart(Cart cart) async {
    final user = ref.read(authRepositoryProvider).currentUser;
    if (user != null) {
      await ref.read(remoteCartRepositoryProvider).setCart(user.name, cart);
    } else {
      await ref.read(localCartRepositoryProvider).setCart(cart);
    }
  }

  /// sets an item in the local or remote cart depending on the user auth state
  Future<void> setItem(CartItem item) async {
    final cart = await _fetchCart();
    final updated = cart.setItem(item);
    await _setCart(updated);
  }

  /// adds an item in the local or remote cart depending on the user auth state
  Future<void> addItem(CartItem item) async {
    final cart = await _fetchCart();
    final updated = cart.addItem(item);
    await _setCart(updated);
  }

  /// removes an item from the local or remote cart depending on the user auth
  /// state
  Future<void> removeItemById(ProductID productId) async {
    final cart = await _fetchCart();
    final updated = cart.removeItemById(productId);
    await _setCart(updated);
  }
}

@Riverpod(keepAlive: true)
CartService cartService(CartServiceRef ref) {
  return CartService(ref);
}

@Riverpod(keepAlive: true)
Stream<Cart> cart(CartRef ref) {
  final user = ref.watch(authStateChangesProvider).value;
  if (user != null) {
    return ref.watch(remoteCartRepositoryProvider).watchCart(user.name);
  } else {
    return ref.watch(localCartRepositoryProvider).watchCart();
  }
}

@Riverpod(keepAlive: true)
int cartItemsCount(CartItemsCountRef ref) {
  return ref.watch(cartProvider).maybeMap(
        data: (cart) => cart.value.items.length,
        orElse: () => 0,
      );
}

// @riverpod
// double cartTotal(CartTotalRef ref) {
//   final cart = ref.watch(cartProvider).value ?? const Cart();
//   var total = 0.0;
//   for (final item in cart.items.entries) {
//     final product = ref.watch(getItemDetailProvider(id:item.key));
//     total += product.price * item.value;
//   }
//   return total;
// }

@riverpod
int itemAvailableQuantity(ItemAvailableQuantityRef ref, ItemDetail product) {
  final cart = ref.watch(cartProvider).value;
  if (cart != null) {
    // get the current quantity for the given product in the cart
    final quantity = cart.items[product.id] ?? 0;
    // subtract it from the product available quantity
    return max(0, product.itemQty - quantity);
  } else {
    return product.itemQty;
  }
}
