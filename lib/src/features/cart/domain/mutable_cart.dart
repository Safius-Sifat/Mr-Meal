import 'online_cart.dart';

/// Helper extension used to mutate the items in the shopping cart.
extension MutableCart on RemoteCart {
  /// add an item to the cart by *overriding* the quantity if it already exists
  RemoteCart setItem(CartModel item) {
    final copy = carts.toList(growable: true);
    late final int index;
    if (item.itemId == null) {
      index = carts.indexWhere((elem) => elem.packageId == item.packageId);
    } else {
      index = carts.indexWhere((elem) => elem.itemId == item.itemId);
    }

    if (index == -1) {
      return RemoteCart(carts: copy);
    }
    late final CartModel oldItem;
    if (item.itemId == null) {
      oldItem = carts.firstWhere((elem) => elem.packageId == elem.packageId,
          orElse: () => item);
    } else {
      oldItem = carts.firstWhere((elem) => elem.itemId == item.itemId,
          orElse: () => item);
    }
    copy[index] = oldItem.copyWith(quantity: item.quantity);
    return RemoteCart(carts: copy);
  }

  /// add an item to the cart by *updating* the quantity if it already exists
  RemoteCart addItem(CartModel item) {
    final List<CartModel> copy = carts.toList(growable: true);
    // * update item quantity. Read this for more details:
    // * https://codewithandrea.com/tips/dart-map-update-method/

    late final int index;
    if (item.itemId == null) {
      index = carts.indexWhere((elem) => elem.packageId == item.packageId);
    } else {
      index = carts.indexWhere((elem) => elem.itemId == item.itemId);
    }
    if (index != -1) {
      late final CartModel oldItem;
      if (item.itemId == null) {
        oldItem = carts.firstWhere((elem) => elem.packageId == elem.packageId,
            orElse: () => item);
      } else {
        oldItem = carts.firstWhere((elem) => elem.itemId == item.itemId,
            orElse: () => item);
      }
      copy[index] =
          oldItem.copyWith(quantity: item.quantity + oldItem.quantity);
      return RemoteCart(carts: copy);
    } else {
      return RemoteCart(carts: [...carts, item]);
    }
  }
  // copy.update(
  //   item.productId,
  //   // if there is already a value, update it by adding the item quantity
  //   (value) => item.quantity + value,
  //   // otherwise, add the item with the given quantity
  //   ifAbsent: () => item.quantity,
  // );
  // return Cart(copy.cast<ProductID, int>());

  /// add a list of items to the cart by *updating* the quantities of items that
  /// already exist
  RemoteCart addItems(List<CartModel> itemsToAdd) {
    late final RemoteCart cart;
    for (final item in itemsToAdd) {
      cart = addItem(item);
    }
    return cart;
  }

  /// if an item with the given productId is found, remove it
  RemoteCart removeItemById(CartModel item) {
    final copy = carts;
    if (item.itemId == null) {
      copy.removeWhere((elem) => elem.packageId == elem.packageId);
    } else {
      copy.removeWhere((elem) => elem.itemId == item.itemId);
    }
    return RemoteCart(carts: copy);
  }
}
