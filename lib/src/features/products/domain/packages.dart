import 'package:freezed_annotation/freezed_annotation.dart';
part 'packages.freezed.dart';
part 'packages.g.dart';

@freezed
class Packages with _$Packages {
  const factory Packages({
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
  }) = _Packages;

  factory Packages.fromJson(Map<String, dynamic> json) =>
      _$PackagesFromJson(json);
}

@freezed
class Datum with _$Datum {
  const factory Datum({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'package_name') required String packageName,
    @JsonKey(name: 'package_price') required int packagePrice,
    @JsonKey(name: 'package_category_id') required int packageCategoryId,
    @JsonKey(name: 'discount_price') required int discountPrice,
    @JsonKey(name: 'image') required String image,
    @JsonKey(name: 'category_name') required String categoryName,
    @JsonKey(name: 'currency_symbol') required String currencySymbol,
    @JsonKey(name: 'short_description') required String shortDescription,
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
