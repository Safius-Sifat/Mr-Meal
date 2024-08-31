import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'cart_item.dart';

/// Model class representing the shopping cart contents.
class Cart {
  const Cart([this.items = const {}]);

  /// All the items in the shopping cart, where:
  /// - key: product ID
  /// - value: quantity
  final Map<ProductId, int> items;

  Map<String, dynamic> toMap() {
    return {
      'items': items,
    };
  }

  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
      Map<ProductId, int>.from(map['items'] as Map<ProductId, int>),
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

    return other is Cart && mapEquals(other.items, items);
  }

  @override
  int get hashCode => items.hashCode;
}

class ProductId {}

extension CartItems on Cart {
  List<CartItem> toItemsList() {
    return items.entries.map((entry) {
      return CartItem(
        productId: entry.key as int,
        quantity: entry.value,
      );
    }).toList();
  }
}
