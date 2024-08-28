// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PackageDetailImpl _$$PackageDetailImplFromJson(Map<String, dynamic> json) =>
    _$PackageDetailImpl(
      id: (json['id'] as num).toInt(),
      packageName: json['package_name'] as String,
      image: json['image'] as String,
      packageCategoryId: (json['package_category_id'] as num).toInt(),
      packagePrice: (json['package_price'] as num).toInt(),
      packageQty: (json['package_qty'] as num).toInt(),
      discountPrice: (json['discount_price'] as num).toInt(),
      shortDescription: json['short_description'] as String,
      longDescription: json['long_description'] as String,
      currencyId: (json['currency_id'] as num).toInt(),
      status: (json['status'] as num).toInt(),
      isDeleted: (json['is_deleted'] as num).toInt(),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      categoryName: json['category_name'] as String,
      currencySymbol: json['currency_symbol'] as String,
    );

Map<String, dynamic> _$$PackageDetailImplToJson(_$PackageDetailImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'package_name': instance.packageName,
      'image': instance.image,
      'package_category_id': instance.packageCategoryId,
      'package_price': instance.packagePrice,
      'package_qty': instance.packageQty,
      'discount_price': instance.discountPrice,
      'short_description': instance.shortDescription,
      'long_description': instance.longDescription,
      'currency_id': instance.currencyId,
      'status': instance.status,
      'is_deleted': instance.isDeleted,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'category_name': instance.categoryName,
      'currency_symbol': instance.currencySymbol,
    };
