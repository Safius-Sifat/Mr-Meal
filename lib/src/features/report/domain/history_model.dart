import 'package:freezed_annotation/freezed_annotation.dart';
part 'history_model.freezed.dart';
part 'history_model.g.dart';

@freezed
class History with _$History {
  const factory History({
    @JsonKey(name: 'current_page') required int currentPage,
    @JsonKey(name: 'data') required List<HistoryData> data,
    @JsonKey(name: 'first_page_url') required String firstPageUrl,
    @JsonKey(name: 'from') required int from,
    @JsonKey(name: 'last_page') required int lastPage,
    @JsonKey(name: 'last_page_url') required String lastPageUrl,
    @JsonKey(name: 'links') required List<Link> links,
    @JsonKey(name: 'next_page_url') required String? nextPageUrl,
    @JsonKey(name: 'path') required String path,
    @JsonKey(name: 'per_page') required int perPage,
    @JsonKey(name: 'prev_page_url') required String? prevPageUrl,
    @JsonKey(name: 'to') required int to,
    @JsonKey(name: 'total') required int total,
  }) = _History;

  factory History.fromJson(Map<String, dynamic> json) =>
      _$HistoryFromJson(json);
}

@freezed
class HistoryData with _$HistoryData {
  const factory HistoryData({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'item_id') required int? itemId,
    @JsonKey(name: 'package_id') required int? packageId,
    @JsonKey(name: 'total_price') required int totalPrice,
    @JsonKey(name: 'status') required String status,
    @JsonKey(name: 'txn_id') required String txnId,
    @JsonKey(name: 'discount') required int discount,
    @JsonKey(name: 'type') required String type,
    @JsonKey(name: 'invoice_id') required String? invoiceId,
    @JsonKey(name: 'address') required String? address,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'email') required String email,
    @JsonKey(name: 'phone') required String phone,
  }) = _HistoryData;

  factory HistoryData.fromJson(Map<String, dynamic> json) =>
      _$HistoryDataFromJson(json);
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
