// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'slider.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SliderModelImpl _$$SliderModelImplFromJson(Map<String, dynamic> json) =>
    _$SliderModelImpl(
      id: (json['id'] as num).toInt(),
      pageName: json['page_name'] as String,
      sliderText: json['slider_text'] as String?,
      image: json['image'] as String,
      status: (json['status'] as num).toInt(),
      isDeleted: (json['is_deleted'] as num).toInt(),
      updatedAt: json['updated_at'] as String,
      createdAt: json['created_at'] as String,
    );

Map<String, dynamic> _$$SliderModelImplToJson(_$SliderModelImpl instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'page_name': instance.pageName,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('slider_text', instance.sliderText);
  val['image'] = instance.image;
  val['status'] = instance.status;
  val['is_deleted'] = instance.isDeleted;
  val['updated_at'] = instance.updatedAt;
  val['created_at'] = instance.createdAt;
  return val;
}
