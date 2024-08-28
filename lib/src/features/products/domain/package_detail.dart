import 'package:freezed_annotation/freezed_annotation.dart';

part 'package_detail.freezed.dart';
part 'package_detail.g.dart';

@freezed
class PackageDetail with _$PackageDetail {
  const factory PackageDetail({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'package_name') required String packageName,
    @JsonKey(name: 'image') required String image,
    @JsonKey(name: 'package_category_id') required int packageCategoryId,
    @JsonKey(name: 'package_price') required int packagePrice,
    @JsonKey(name: 'package_qty') required int packageQty,
    @JsonKey(name: 'discount_price') required int discountPrice,
    @JsonKey(name: 'short_description') required String shortDescription,
    @JsonKey(name: 'long_description') required String longDescription,
    @JsonKey(name: 'currency_id') required int currencyId,
    @JsonKey(name: 'status') required int status,
    @JsonKey(name: 'is_deleted') required int isDeleted,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'category_name') required String categoryName,
    @JsonKey(name: 'currency_symbol') required String currencySymbol,
  }) = _PackageDetail;

  factory PackageDetail.fromJson(Map<String, dynamic> json) =>
      _$PackageDetailFromJson(json);
}
