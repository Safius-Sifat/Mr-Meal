// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todays_meal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TodaysMealImpl _$$TodaysMealImplFromJson(Map<String, dynamic> json) =>
    _$TodaysMealImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      longDescription: json['long_description'] as String,
      isDeleted: (json['is_deleted'] as num).toInt(),
      status: (json['status'] as num).toInt(),
      createdAt: DateTime.parse(json['created_at'] as String),
      updatedAt: DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$TodaysMealImplToJson(_$TodaysMealImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'long_description': instance.longDescription,
      'is_deleted': instance.isDeleted,
      'status': instance.status,
      'created_at': instance.createdAt.toIso8601String(),
      'updated_at': instance.updatedAt.toIso8601String(),
    };
