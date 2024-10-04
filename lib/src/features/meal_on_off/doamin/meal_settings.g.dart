// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MealSettingImpl _$$MealSettingImplFromJson(Map<String, dynamic> json) =>
    _$MealSettingImpl(
      id: (json['id'] as num).toInt(),
      mealName: json['meal_name'] as String,
      startTime: json['start_time'] as String,
      endTime: json['end_time'] as String,
      isDeleted: (json['is_deleted'] as num).toInt(),
      status: (json['status'] as num).toInt(),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$MealSettingImplToJson(_$MealSettingImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'meal_name': instance.mealName,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'is_deleted': instance.isDeleted,
      'status': instance.status,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
