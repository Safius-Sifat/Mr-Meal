import 'package:freezed_annotation/freezed_annotation.dart';
part 'address.freezed.dart';
part 'address.g.dart';

@freezed
class Address with _$Address {
  const factory Address({
    @JsonKey(name: 'id') required int? id,
    @JsonKey(name: 'user_id') required int? userId,
    @JsonKey(name: 'primary_location') required String? primaryLocation,
    @JsonKey(name: 'secondary_location') required String? secondaryLocation,
    @JsonKey(name: 'primary_loc_longitude')
    required String? primaryLocLongitude,
    @JsonKey(name: 'primary_loc_lattitude')
    required String? primaryLocLattitude,
    @JsonKey(name: 'secondary_loc_lattitude')
    required String? secondaryLocLattitude,
    @JsonKey(name: 'secondary_loc_longitude')
    required String? secondaryLocLongitude,
  }) = _Address;

  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
}
