import 'package:freezed_annotation/freezed_annotation.dart';
part 'item_detail.freezed.dart';
part 'item_detail.g.dart';

@freezed
class ItemDetail with _$ItemDetail {
  const factory ItemDetail({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'item_name') required String itemName,
    @JsonKey(name: 'image') required String image,
    @JsonKey(name: 'category_id') required int categoryId,
    @JsonKey(name: 'item_price') required int itemPrice,
    @JsonKey(name: 'item_qty') required int itemQty,
    @JsonKey(name: 'discount_price') required int discountPrice,
    @JsonKey(name: 'short_description') required String shortDescription,
    @JsonKey(name: 'long_description') required String longDescription,
    @JsonKey(name: 'health_tips') required String healthTips,
    @JsonKey(name: 'currency_id') required int currencyId,
    @JsonKey(name: 'status') required int status,
    @JsonKey(name: 'is_deleted') required int isDeleted,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'category_name') required String categoryName,
    @JsonKey(name: 'currency_symbol') required String currencySymbol,
  }) = _ItemDetail;

  factory ItemDetail.fromJson(Map<String, dynamic> json) =>
      _$ItemDetailFromJson(json);
}
