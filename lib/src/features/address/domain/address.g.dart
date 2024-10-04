// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AddressImpl _$$AddressImplFromJson(Map<String, dynamic> json) =>
    _$AddressImpl(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      primaryLocation: json['primary_location'] as String?,
      secondaryLocation: json['secondary_location'] as String?,
      primaryLocLongitude: json['primary_loc_longitude'] as String?,
      primaryLocLattitude: json['primary_loc_lattitude'] as String?,
      secondaryLocLattitude: json['secondary_loc_lattitude'] as String?,
      secondaryLocLongitude: json['secondary_loc_longitude'] as String?,
    );

Map<String, dynamic> _$$AddressImplToJson(_$AddressImpl instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('user_id', instance.userId);
  writeNotNull('primary_location', instance.primaryLocation);
  writeNotNull('secondary_location', instance.secondaryLocation);
  writeNotNull('primary_loc_longitude', instance.primaryLocLongitude);
  writeNotNull('primary_loc_lattitude', instance.primaryLocLattitude);
  writeNotNull('secondary_loc_lattitude', instance.secondaryLocLattitude);
  writeNotNull('secondary_loc_longitude', instance.secondaryLocLongitude);
  return val;
}
