import 'package:freezed_annotation/freezed_annotation.dart';
part 'online_cart.freezed.dart';
part 'online_cart.g.dart';

@freezed
class RemoteCart with _$RemoteCart {
  const factory RemoteCart({
    @JsonKey(name: 'carts') required List<CartModel> carts,
  }) = _RemoteCart;

  factory RemoteCart.fromJson(Map<String, dynamic> json) =>
      _$RemoteCartFromJson(json);
}

@freezed
abstract class CartModel with _$CartModel {
  const factory CartModel({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'user_ip') required String userIp,
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'item_id') required int? itemId,
    @JsonKey(name: 'package_id') required int? packageId,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'quantity') required int quantity,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'item_name') required String? itemName,
    @JsonKey(name: 'item_price') required int? itemPrice,
    @JsonKey(name: 'item_discount_price') required int? itemDiscountPrice,
    @JsonKey(name: 'package_name') required String? packageName,
    @JsonKey(name: 'package_price') required int? packagePrice,
    @JsonKey(name: 'package_discount_price') required int? packageDiscountPrice,
    @JsonKey(name: 'item_image') required String itemImage,
    @JsonKey(name: 'package_image') required String packageImage,
  }) = _CartModel;

  factory CartModel.fromJson(Map<String, dynamic> json) =>
      _$CartModelFromJson(json);
  factory CartModel.empty() => CartModel(
        id: 0,
        userIp: '',
        userId: 0,
        itemId: null,
        packageId: null,
        createdAt: DateTime.now(),
        quantity: 0,
        updatedAt: DateTime.now(),
        itemName: null,
        itemPrice: null,
        itemDiscountPrice: null,
        packageName: null,
        packagePrice: null,
        packageDiscountPrice: null,
        itemImage: '',
        packageImage: '',
      );
}
