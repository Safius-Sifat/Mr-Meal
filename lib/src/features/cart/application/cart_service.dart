import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../authentication/data/auth_repository.dart';
import '../../products/domain/item_detail.dart';
import '../data/local/local_cart_repository.dart';
import '../data/remote/remote_cart_repository.dart';
import '../domain/mutable_cart.dart';
import '../domain/online_cart.dart';

part 'cart_service.g.dart';

class CartService {
  CartService(this.ref);
  final Ref ref;

  /// fetch the cart from the local or remote repository
  /// depending on the user auth state
  // Future<RemoteCart> _fetchCart() async {
  //   final user = ref.read(authRepositoryProvider).currentUser;
  //   if (user != null) {
  //     final cart = await ref
  //         .read(remoteCartRepositoryProvider)
  //         .fetchCart(token: user.token);
  //     await ref.read(localCartRepositoryProvider).setCart(cart);
  //
  //     return ref.read(localCartRepositoryProvider).fetchCart();
  //   } else {
  //     return ref.read(localCartRepositoryProvider).fetchCart();
  //   }
  // }

  /// save the cart to the local or remote repository
  /// depending on the user auth state
  Future<void> _addCart(CartModel item) async {
    final cart = await ref.read(localCartRepositoryProvider).fetchCart();
    final updated = cart.addItem(item);
    await ref.read(localCartRepositoryProvider).setCart(updated);
  }

  Future<void> _removeCart(CartModel item) async {
    final cart = await ref.read(localCartRepositoryProvider).fetchCart();
    final updated = cart.removeItemById(item);
    await ref.read(localCartRepositoryProvider).setCart(updated);
  }

  // Future<void> _setCart(CartModel item) async {
  //   final cart = await ref.read(localCartRepositoryProvider).fetchCart();
  //   final updated = cart.setItem(item);
  //   await ref.read(localCartRepositoryProvider).setCart(updated);
  // }

  /// sets an item in the local or remote cart depending on the user auth state
  Future<void> setItem(CartModel item) async {
    final cart = await ref.read(localCartRepositoryProvider).fetchCart();
    final updated = cart.setItem(item);
    await ref.read(localCartRepositoryProvider).setCart(updated);
  }

  /// adds an item in the local or remote cart depending on the user auth state
  Future<void> addItem(CartModel item) async {
    final user = ref.read(authRepositoryProvider).currentUser;
    if (user != null) {
      if (item.itemId == null) {
        await ref.read(remoteCartRepositoryProvider).addItemToCart(
            token: user.token, id: item.packageId!, type: 'package');
      } else {
        await ref
            .read(remoteCartRepositoryProvider)
            .addItemToCart(token: user.token, id: item.itemId!, type: 'item');
      }
      await _addCart(item);
    }
    await _addCart(item);
  }

  /// removes an item from the local or remote cart depending on the user auth
  /// state
  Future<void> removeItemById(CartModel cartItem) async {
    final user = ref.read(authRepositoryProvider).currentUser;
    if (user != null) {
      await _removeCart(cartItem);
      if (cartItem.itemId == null) {
        await ref
            .read(remoteCartRepositoryProvider)
            .removeCartItem(token: user.token, id: cartItem.packageId!);
      } else {
        await ref
            .read(remoteCartRepositoryProvider)
            .removeCartItem(token: user.token, id: cartItem.itemId!);
      }
    }

    await _removeCart(cartItem);
  }
}

@Riverpod(keepAlive: true)
CartService cartService(CartServiceRef ref) {
  return CartService(ref);
}

@Riverpod(keepAlive: true)
Stream<RemoteCart> cart(CartRef ref) {
  final user = ref.watch(authStateChangesProvider).value;
  if (user != null) {
    ref
        .watch(remoteCartRepositoryProvider)
        .fetchCart(token: user.token)
        .then((cart) {
      ref.watch(localCartRepositoryProvider).setCart(cart);
    });
    return ref.watch(localCartRepositoryProvider).watchCart();
  } else {
    return ref.watch(localCartRepositoryProvider).watchCart();
  }
}

@Riverpod(keepAlive: true)
int cartItemsCount(CartItemsCountRef ref) {
  return ref.watch(cartProvider).maybeMap(
        data: (cart) => cart.value.carts.length,
        orElse: () => 0,
      );
}

@riverpod
Future<double> cartTotal(CartTotalRef ref) async {
  final cart = ref.watch(cartProvider).value ?? const RemoteCart(carts: []);

  if (cart.carts.isEmpty) {
    return 0.0;
  }
  var total = 0.0;
  for (final item in cart.carts) {
    if (item.itemId == null) {
      total += item.packagePrice! * item.quantity;
    } else {
      total += item.itemPrice! * item.quantity;
    }
  }
  return total;
}

@riverpod
int itemAvailableQuantity(ItemAvailableQuantityRef ref, ItemDetail product) {
  final cart = ref.watch(cartProvider).value;
  if (cart != null) {
    // get the current quantity for the given product in the cart

    for (final item in cart.carts) {
      if (item.itemId == product.id) {
        return max(0, product.itemQty - item.quantity);
      }
    }
    return product.itemQty;
  } else {
    return product.itemQty;
  }
}
