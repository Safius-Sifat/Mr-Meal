import 'dart:convert';

typedef ProductID = int;

/// A product along with a quantity that can be added to an order/cart
class CartItem {
  const CartItem({
    required this.productId,
    required this.quantity,
    required this.price,
  });
  final ProductID productId;
  final int quantity;
  final double price;

  CartItem copyWith({
    ProductID? productId,
    int? quantity,
    double? price,
  }) {
    return CartItem(
      productId: productId ?? this.productId,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
    );
  }

  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
      productId: map['productId'] as ProductID,
      quantity: map['quantity'] as int,
      price: map['price'] as double,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'quantity': quantity,
      'price': price,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CartItem &&
        other.productId == productId &&
        other.quantity == quantity;
  }

  @override
  int get hashCode => productId.hashCode ^ quantity.hashCode;
}
