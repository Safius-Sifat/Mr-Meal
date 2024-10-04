// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'online_cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RemoteCartImpl _$$RemoteCartImplFromJson(Map<String, dynamic> json) =>
    _$RemoteCartImpl(
      carts: (json['carts'] as List<dynamic>)
          .map((e) => CartModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$RemoteCartImplToJson(_$RemoteCartImpl instance) =>
    <String, dynamic>{
      'carts': instance.carts.map((e) => e.toJson()).toList(),
    };

_$CartModelImpl _$$CartModelImplFromJson(Map<String, dynamic> json) =>
    _$CartModelImpl(
      id: (json['id'] as num).toInt(),
      userIp: json['user_ip'] as String,
      userId: (json['user_id'] as num).toInt(),
      itemId: (json['item_id'] as num?)?.toInt(),
      packageId: (json['package_id'] as num?)?.toInt(),
      createdAt: DateTime.parse(json['created_at'] as String),
      quantity: (json['quantity'] as num).toInt(),
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

Map<String, dynamic> _$$CartModelImplToJson(_$CartModelImpl instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'user_ip': instance.userIp,
    'user_id': instance.userId,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('item_id', instance.itemId);
  writeNotNull('package_id', instance.packageId);
  val['created_at'] = instance.createdAt.toIso8601String();
  val['quantity'] = instance.quantity;
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
