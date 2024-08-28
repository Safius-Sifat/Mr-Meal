// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'packages.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PackagesImpl _$$PackagesImplFromJson(Map<String, dynamic> json) =>
    _$PackagesImpl(
      currentPage: (json['current_page'] as num).toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => Datum.fromJson(e as Map<String, dynamic>))
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

Map<String, dynamic> _$$PackagesImplToJson(_$PackagesImpl instance) {
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

_$DatumImpl _$$DatumImplFromJson(Map<String, dynamic> json) => _$DatumImpl(
      id: (json['id'] as num).toInt(),
      packageName: json['package_name'] as String,
      packagePrice: (json['package_price'] as num).toInt(),
      packageCategoryId: (json['package_category_id'] as num).toInt(),
      discountPrice: (json['discount_price'] as num).toInt(),
      image: json['image'] as String,
      categoryName: json['category_name'] as String,
      currencySymbol: json['currency_symbol'] as String,
      shortDescription: json['short_description'] as String,
    );

Map<String, dynamic> _$$DatumImplToJson(_$DatumImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'package_name': instance.packageName,
      'package_price': instance.packagePrice,
      'package_category_id': instance.packageCategoryId,
      'discount_price': instance.discountPrice,
      'image': instance.image,
      'category_name': instance.categoryName,
      'currency_symbol': instance.currencySymbol,
      'short_description': instance.shortDescription,
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
