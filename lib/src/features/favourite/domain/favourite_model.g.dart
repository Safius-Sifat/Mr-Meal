// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourite_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FavouriteModelImpl _$$FavouriteModelImplFromJson(Map<String, dynamic> json) =>
    _$FavouriteModelImpl(
      status: (json['status'] as num).toInt(),
      favourites: (json['favourites'] as List<dynamic>)
          .map((e) => Favourite.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$FavouriteModelImplToJson(
        _$FavouriteModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'favourites': instance.favourites.map((e) => e.toJson()).toList(),
    };

_$FavouriteImpl _$$FavouriteImplFromJson(Map<String, dynamic> json) =>
    _$FavouriteImpl(
      id: (json['id'] as num).toInt(),
      userIp: json['user_ip'] as String,
      userId: (json['user_id'] as num?)?.toInt(),
      itemId: (json['item_id'] as num?)?.toInt(),
      packageId: (json['package_id'] as num?)?.toInt(),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
      itemName: json['item_name'] as String?,
      itemPrice: (json['item_price'] as num?)?.toInt(),
      itemDiscountPrice: (json['item_discount_price'] as num?)?.toInt(),
      packageName: json['package_name'] as String?,
      packagePrice: (json['package_price'] as num?)?.toInt(),
      packageDiscountPrice: (json['package_discount_price'] as num?)?.toInt(),
      itemImage: json['item_image'] as String,
      packageImage: json['package_image'] as String,
    );

Map<String, dynamic> _$$FavouriteImplToJson(_$FavouriteImpl instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'user_ip': instance.userIp,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('user_id', instance.userId);
  writeNotNull('item_id', instance.itemId);
  writeNotNull('package_id', instance.packageId);
  val['created_at'] = instance.createdAt.toIso8601String();
  val['updated_at'] = instance.updatedAt.toIso8601String();
  writeNotNull('item_name', instance.itemName);
  writeNotNull('item_price', instance.itemPrice);
  writeNotNull('item_discount_price', instance.itemDiscountPrice);
  writeNotNull('package_name', instance.packageName);
  writeNotNull('package_price', instance.packagePrice);
  writeNotNull('package_discount_price', instance.packageDiscountPrice);
  val['item_image'] = instance.itemImage;
  val['package_image'] = instance.packageImage;
  return val;
}
