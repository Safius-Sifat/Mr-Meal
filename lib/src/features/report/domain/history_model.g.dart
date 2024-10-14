// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HistoryImpl _$$HistoryImplFromJson(Map<String, dynamic> json) =>
    _$HistoryImpl(
      currentPage: (json['current_page'] as num).toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => HistoryData.fromJson(e as Map<String, dynamic>))
          .toList(),
      firstPageUrl: json['first_page_url'] as String,
      from: (json['from'] as num).toInt(),
      lastPage: (json['last_page'] as num).toInt(),
      lastPageUrl: json['last_page_url'] as String,
      links: (json['links'] as List<dynamic>)
          .map((e) => Link.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPageUrl: json['next_page_url'] as String?,
      path: json['path'] as String,
      perPage: (json['per_page'] as num).toInt(),
      prevPageUrl: json['prev_page_url'] as String?,
      to: (json['to'] as num).toInt(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$$HistoryImplToJson(_$HistoryImpl instance) {
  final val = <String, dynamic>{
    'current_page': instance.currentPage,
    'data': instance.data.map((e) => e.toJson()).toList(),
    'first_page_url': instance.firstPageUrl,
    'from': instance.from,
    'last_page': instance.lastPage,
    'last_page_url': instance.lastPageUrl,
    'links': instance.links.map((e) => e.toJson()).toList(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('next_page_url', instance.nextPageUrl);
  val['path'] = instance.path;
  val['per_page'] = instance.perPage;
  writeNotNull('prev_page_url', instance.prevPageUrl);
  val['to'] = instance.to;
  val['total'] = instance.total;
  return val;
}

_$HistoryDataImpl _$$HistoryDataImplFromJson(Map<String, dynamic> json) =>
    _$HistoryDataImpl(
      id: (json['id'] as num).toInt(),
      userId: (json['user_id'] as num).toInt(),
      itemId: (json['item_id'] as num?)?.toInt(),
      packageId: (json['package_id'] as num?)?.toInt(),
      totalPrice: (json['total_price'] as num).toInt(),
      status: json['status'] as String,
      txnId: json['txn_id'] as String,
      discount: (json['discount'] as num).toInt(),
      type: json['type'] as String,
      invoiceId: json['invoice_id'] as String?,
      address: json['address'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
    );

Map<String, dynamic> _$$HistoryDataImplToJson(_$HistoryDataImpl instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'user_id': instance.userId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('item_id', instance.itemId);
  writeNotNull('package_id', instance.packageId);
  val['total_price'] = instance.totalPrice;
  val['status'] = instance.status;
  val['txn_id'] = instance.txnId;
  val['discount'] = instance.discount;
  val['type'] = instance.type;
  writeNotNull('invoice_id', instance.invoiceId);
  writeNotNull('address', instance.address);
  val['created_at'] = instance.createdAt.toIso8601String();
  val['updated_at'] = instance.updatedAt.toIso8601String();
  val['name'] = instance.name;
  val['email'] = instance.email;
  val['phone'] = instance.phone;
  return val;
}

_$LinkImpl _$$LinkImplFromJson(Map<String, dynamic> json) => _$LinkImpl(
      url: json['url'] as String?,
      label: json['label'] as String,
      active: json['active'] as bool,
    );

Map<String, dynamic> _$$LinkImplToJson(_$LinkImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('url', instance.url);
  val['label'] = instance.label;
  val['active'] = instance.active;
  return val;
}
