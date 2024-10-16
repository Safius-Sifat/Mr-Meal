// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'items.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemsImpl _$$ItemsImplFromJson(Map<String, dynamic> json) => _$ItemsImpl(
      currentPage: (json['current_page'] as num).toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
      firstPageUrl: json['first_page_url'] as String,
      from: (json['from'] as num?)?.toInt(),
      lastPage: (json['last_page'] as num).toInt(),
      lastPageUrl: json['last_page_url'] as String,
      links: (json['links'] as List<dynamic>)
          .map((e) => Link.fromJson(e as Map<String, dynamic>))
          .toList(),
      nextPageUrl: json['next_page_url'] as String?,
      path: json['path'] as String,
      perPage: (json['per_page'] as num).toInt(),
      prevPageUrl: json['prev_page_url'] as String?,
      to: (json['to'] as num?)?.toInt(),
      total: (json['total'] as num).toInt(),
    );

Map<String, dynamic> _$$ItemsImplToJson(_$ItemsImpl instance) {
  final val = <String, dynamic>{
    'current_page': instance.currentPage,
    'data': instance.data.map((e) => e.toJson()).toList(),
    'first_page_url': instance.firstPageUrl,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('from', instance.from);
  val['last_page'] = instance.lastPage;
  val['last_page_url'] = instance.lastPageUrl;
  val['links'] = instance.links.map((e) => e.toJson()).toList();
  writeNotNull('next_page_url', instance.nextPageUrl);
  val['path'] = instance.path;
  val['per_page'] = instance.perPage;
  writeNotNull('prev_page_url', instance.prevPageUrl);
  writeNotNull('to', instance.to);
  val['total'] = instance.total;
  return val;
}

_$DatumImpl _$$DatumImplFromJson(Map<String, dynamic> json) => _$DatumImpl(
      id: (json['id'] as num).toInt(),
      itemName: json['item_name'] as String,
      itemPrice: (json['item_price'] as num).toInt(),
      image: json['image'] as String,
      discountPrice: (json['discount_price'] as num).toInt(),
      categoryName: json['category_name'] as String,
      currencySymbol: json['currency_symbol'] as String,
      categoryId: (json['category_id'] as num).toInt(),
    );

Map<String, dynamic> _$$DatumImplToJson(_$DatumImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'item_name': instance.itemName,
      'item_price': instance.itemPrice,
      'image': instance.image,
      'discount_price': instance.discountPrice,
      'category_name': instance.categoryName,
      'currency_symbol': instance.currencySymbol,
      'category_id': instance.categoryId,
    };

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
