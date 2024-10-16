import 'package:freezed_annotation/freezed_annotation.dart';
part 'items.freezed.dart';
part 'items.g.dart';

@freezed
class Items with _$Items {
  const factory Items({
    @JsonKey(name: 'current_page') required int currentPage,
    @JsonKey(name: 'data') required List<Datum> data,
    @JsonKey(name: 'first_page_url') required String firstPageUrl,
    @JsonKey(name: 'from') required int? from,
    @JsonKey(name: 'last_page') required int lastPage,
    @JsonKey(name: 'last_page_url') required String lastPageUrl,
    @JsonKey(name: 'links') required List<Link> links,
    @JsonKey(name: 'next_page_url') required String? nextPageUrl,
    @JsonKey(name: 'path') required String path,
    @JsonKey(name: 'per_page') required int perPage,
    @JsonKey(name: 'prev_page_url') required String? prevPageUrl,
    @JsonKey(name: 'to') required int? to,
    @JsonKey(name: 'total') required int total,
  }) = _Items;

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);
}

@freezed
class Datum with _$Datum {
  const factory Datum({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'item_name') required String itemName,
    @JsonKey(name: 'item_price') required int itemPrice,
    @JsonKey(name: 'image') required String image,
    @JsonKey(name: 'discount_price') required int discountPrice,
    @JsonKey(name: 'category_name') required String categoryName,
    @JsonKey(name: 'currency_symbol') required String currencySymbol,
    @JsonKey(name: 'category_id') required int categoryId,
  }) = _Datum;

  factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);
}

@freezed
class Link with _$Link {
  const factory Link({
    @JsonKey(name: 'url') required String? url,
    @JsonKey(name: 'label') required String label,
    @JsonKey(name: 'active') required bool active,
  }) = _Link;

  factory Link.fromJson(Map<String, dynamic> json) => _$LinkFromJson(json);
}
