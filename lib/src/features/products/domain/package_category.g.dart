// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'package_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PackageCategoryImpl _$$PackageCategoryImplFromJson(
        Map<String, dynamic> json) =>
    _$PackageCategoryImpl(
      categoryName: json['category_name'] as String,
      categoryIcon: json['category_icon'] as String,
      startTime: json['start_time'] as String,
      endTime: json['end_time'] as String,
      id: (json['id'] as num).toInt(),
    );

Map<String, dynamic> _$$PackageCategoryImplToJson(
        _$PackageCategoryImpl instance) =>
    <String, dynamic>{
      'category_name': instance.categoryName,
      'category_icon': instance.categoryIcon,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'id': instance.id,
    };
