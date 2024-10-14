// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryImpl _$$CategoryImplFromJson(Map<String, dynamic> json) =>
    _$CategoryImpl(
      categoryName: json['category_name'] as String,
      categoryIcon: json['category_icon'] as String,
      id: (json['id'] as num).toInt(),
    );

Map<String, dynamic> _$$CategoryImplToJson(_$CategoryImpl instance) =>
    <String, dynamic>{
      'category_name': instance.categoryName,
      'category_icon': instance.categoryIcon,
      'id': instance.id,
    };
