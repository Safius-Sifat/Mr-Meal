import 'cart.dart';
import 'cart_item.dart';

/// Helper extension used to mutate the items in the shopping cart.
extension MutableCart on Cart {
  /// add an item to the cart by *overriding* the quantity if it already exists
  Cart setItem(CartItem item) {
    final copy = Map<ProductID, int>.from(items);
    copy[item.productId] = item.quantity;
    return Cart(copy.cast<ProductId, int>());
  }

  /// add an item to the cart by *updating* the quantity if it already exists
  Cart addItem(CartItem item) {
    final copy = Map<ProductID, int>.from(items);
    // * update item quantity. Read this for more details:
    // * https://codewithandrea.com/tips/dart-map-update-method/
    copy.update(
      item.productId,
      // if there is already a value, update it by adding the item quantity
      (value) => item.quantity + value,
      // otherwise, add the item with the given quantity
      ifAbsent: () => item.quantity,
    );
    return Cart(copy.cast<ProductId, int>());
  }

  /// add a list of items to the cart by *updating* the quantities of items that
  /// already exist
  Cart addItems(List<CartItem> itemsToAdd) {
    final copy = Map<ProductID, int>.from(items);
    for (var item in itemsToAdd) {
      copy.update(
        item.productId,
        // if there is already a value, update it by adding the item quantity
        (value) => item.quantity + value,
        // otherwise, add the item with the given quantity
        ifAbsent: () => item.quantity,
      );
    }
    return Cart(copy.cast<ProductId, int>());
  }

  /// if an item with the given productId is found, remove it
  Cart removeItemById(ProductID productId) {
    final copy = Map<ProductID, int>.from(items);
    copy.remove(productId);
    return Cart(copy.cast<ProductId, int>());
  }
}
