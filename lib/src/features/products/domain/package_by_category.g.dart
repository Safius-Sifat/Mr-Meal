// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package_by_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PackagesByCategoryImpl _$$PackagesByCategoryImplFromJson(
        Map<String, dynamic> json) =>
    _$PackagesByCategoryImpl(
      categories: (json['categories'] as List<dynamic>)
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PackagesByCategoryImplToJson(
        _$PackagesByCategoryImpl instance) =>
    <String, dynamic>{
      'categories': instance.categories.map((e) => e.toJson()).toList(),
    };

_$CategoryImpl _$$CategoryImplFromJson(Map<String, dynamic> json) =>
    _$CategoryImpl(
      id: (json['id'] as num).toInt(),
      categoryName: json['category_name'] as String,
      startTime: json['start_time'] as String,
      endTime: json['end_time'] as String,
      categoryIcon: json['category_icon'] as String,
      packages: Packages.fromJson(json['packages'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CategoryImplToJson(_$CategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'category_name': instance.categoryName,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'category_icon': instance.categoryIcon,
      'packages': instance.packages.toJson(),
    };

_$PackagesImpl _$$PackagesImplFromJson(Map<String, dynamic> json) =>
    _$PackagesImpl(
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

Map<String, dynamic> _$$PackagesImplToJson(_$PackagesImpl instance) {
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
      packageId: (json['package_id'] as num).toInt(),
      packageName: json['package_name'] as String,
      image: json['image'] as String,
      packagePrice: (json['package_price'] as num).toInt(),
      discountPrice: (json['discount_price'] as num).toInt(),
      currencySymbol: json['currency_symbol'] as String,
    );

Map<String, dynamic> _$$DatumImplToJson(_$DatumImpl instance) =>
    <String, dynamic>{
      'package_id': instance.packageId,
      'package_name': instance.packageName,
      'image': instance.image,
      'package_price': instance.packagePrice,
      'discount_price': instance.discountPrice,
      'currency_symbol': instance.currencySymbol,
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
