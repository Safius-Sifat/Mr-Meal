// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ItemDetailImpl _$$ItemDetailImplFromJson(Map<String, dynamic> json) =>
    _$ItemDetailImpl(
      id: (json['id'] as num).toInt(),
      itemName: json['item_name'] as String,
      image: json['image'] as String,
      categoryId: (json['category_id'] as num).toInt(),
      subCategoryId: (json['sub_category_id'] as num).toInt(),
      itemPrice: (json['item_price'] as num).toInt(),
      itemQty: (json['item_qty'] as num).toInt(),
      discountPrice: (json['discount_price'] as num).toInt(),
      shortDescription: json['short_description'] as String,
      longDescription: json['long_description'] as String,
      healthTips: json['health_tips'] as String,
      currencyId: (json['currency_id'] as num).toInt(),
      status: (json['status'] as num).toInt(),
      isDeleted: (json['is_deleted'] as num).toInt(),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      categoryName: json['category_name'] as String,
      subcategoryName: json['subcategory_name'] as String,
      currencySymbol: json['currency_symbol'] as String,
    );

Map<String, dynamic> _$$ItemDetailImplToJson(_$ItemDetailImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'item_name': instance.itemName,
      'image': instance.image,
      'category_id': instance.categoryId,
      'sub_category_id': instance.subCategoryId,
      'item_price': instance.itemPrice,
      'item_qty': instance.itemQty,
      'discount_price': instance.discountPrice,
      'short_description': instance.shortDescription,
      'long_description': instance.longDescription,
      'health_tips': instance.healthTips,
      'currency_id': instance.currencyId,
      'status': instance.status,
      'is_deleted': instance.isDeleted,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
      'category_name': instance.categoryName,
      'subcategory_name': instance.subcategoryName,
      'currency_symbol': instance.currencySymbol,
    };
