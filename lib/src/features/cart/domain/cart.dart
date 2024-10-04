import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'cart_item.dart';

/// Model class representing the shopping cart contents.
class Cart {
  const Cart([this.items = const <CartItem>[]]);

  /// All the items in the shopping cart, where:
  /// - key: product ID
  /// - value: quantity
  final List<CartItem> items;

  Map<String, dynamic> toMap() {
    return {
      'items': items.map((x) => x.toMap()).toList(),
    };
  }

  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
      List<CartItem>.from(
        (map['items'] as List)
            .map((x) => CartItem.fromMap(x as Map<String, dynamic>)),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Cart.fromJson(String source) =>
      Cart.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Cart(items: $items)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Cart && listEquals(other.items, items);
  }

  @override
  int get hashCode => items.hashCode;

  // @override
  // bool operator ==(Object other) {
  //   if (identical(this, other)) return true;
  //
  //   return other is Cart && mapEquals(other.items, items);
  // }
}

// extension CartItems on Cart {
//   List<CartItem> toItemsList() {
//     return items.entries.map((entry) {
//       return CartItem(
//         productId: entry.key,
//         quantity: entry.value,
//       );
//     }).toList();
//   }
// }
