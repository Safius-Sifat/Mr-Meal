// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'address.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Address _$AddressFromJson(Map<String, dynamic> json) {
  return _Address.fromJson(json);
}

/// @nodoc
mixin _$Address {
  @JsonKey(name: 'id')
  int? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'primary_location')
  String? get primaryLocation => throw _privateConstructorUsedError;
  @JsonKey(name: 'secondary_location')
  String? get secondaryLocation => throw _privateConstructorUsedError;
  @JsonKey(name: 'primary_loc_longitude')
  String? get primaryLocLongitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'primary_loc_lattitude')
  String? get primaryLocLattitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'secondary_loc_lattitude')
  String? get secondaryLocLattitude => throw _privateConstructorUsedError;
  @JsonKey(name: 'secondary_loc_longitude')
  String? get secondaryLocLongitude => throw _privateConstructorUsedError;

  /// Serializes this Address to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AddressCopyWith<Address> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressCopyWith<$Res> {
  factory $AddressCopyWith(Address value, $Res Function(Address) then) =
      _$AddressCopyWithImpl<$Res, Address>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'user_id') int? userId,
      @JsonKey(name: 'primary_location') String? primaryLocation,
      @JsonKey(name: 'secondary_location') String? secondaryLocation,
      @JsonKey(name: 'primary_loc_longitude') String? primaryLocLongitude,
      @JsonKey(name: 'primary_loc_lattitude') String? primaryLocLattitude,
      @JsonKey(name: 'secondary_loc_lattitude') String? secondaryLocLattitude,
      @JsonKey(name: 'secondary_loc_longitude') String? secondaryLocLongitude});
}

/// @nodoc
class _$AddressCopyWithImpl<$Res, $Val extends Address>
    implements $AddressCopyWith<$Res> {
  _$AddressCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? primaryLocation = freezed,
    Object? secondaryLocation = freezed,
    Object? primaryLocLongitude = freezed,
    Object? primaryLocLattitude = freezed,
    Object? secondaryLocLattitude = freezed,
    Object? secondaryLocLongitude = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      primaryLocation: freezed == primaryLocation
          ? _value.primaryLocation
          : primaryLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      secondaryLocation: freezed == secondaryLocation
          ? _value.secondaryLocation
          : secondaryLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      primaryLocLongitude: freezed == primaryLocLongitude
          ? _value.primaryLocLongitude
          : primaryLocLongitude // ignore: cast_nullable_to_non_nullable
              as String?,
      primaryLocLattitude: freezed == primaryLocLattitude
          ? _value.primaryLocLattitude
          : primaryLocLattitude // ignore: cast_nullable_to_non_nullable
              as String?,
      secondaryLocLattitude: freezed == secondaryLocLattitude
          ? _value.secondaryLocLattitude
          : secondaryLocLattitude // ignore: cast_nullable_to_non_nullable
              as String?,
      secondaryLocLongitude: freezed == secondaryLocLongitude
          ? _value.secondaryLocLongitude
          : secondaryLocLongitude // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddressImplCopyWith<$Res> implements $AddressCopyWith<$Res> {
  factory _$$AddressImplCopyWith(
          _$AddressImpl value, $Res Function(_$AddressImpl) then) =
      __$$AddressImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int? id,
      @JsonKey(name: 'user_id') int? userId,
      @JsonKey(name: 'primary_location') String? primaryLocation,
      @JsonKey(name: 'secondary_location') String? secondaryLocation,
      @JsonKey(name: 'primary_loc_longitude') String? primaryLocLongitude,
      @JsonKey(name: 'primary_loc_lattitude') String? primaryLocLattitude,
      @JsonKey(name: 'secondary_loc_lattitude') String? secondaryLocLattitude,
      @JsonKey(name: 'secondary_loc_longitude') String? secondaryLocLongitude});
}

/// @nodoc
class __$$AddressImplCopyWithImpl<$Res>
    extends _$AddressCopyWithImpl<$Res, _$AddressImpl>
    implements _$$AddressImplCopyWith<$Res> {
  __$$AddressImplCopyWithImpl(
      _$AddressImpl _value, $Res Function(_$AddressImpl) _then)
      : super(_value, _then);

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = freezed,
    Object? primaryLocation = freezed,
    Object? secondaryLocation = freezed,
    Object? primaryLocLongitude = freezed,
    Object? primaryLocLattitude = freezed,
    Object? secondaryLocLattitude = freezed,
    Object? secondaryLocLongitude = freezed,
  }) {
    return _then(_$AddressImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      primaryLocation: freezed == primaryLocation
          ? _value.primaryLocation
          : primaryLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      secondaryLocation: freezed == secondaryLocation
          ? _value.secondaryLocation
          : secondaryLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      primaryLocLongitude: freezed == primaryLocLongitude
          ? _value.primaryLocLongitude
          : primaryLocLongitude // ignore: cast_nullable_to_non_nullable
              as String?,
      primaryLocLattitude: freezed == primaryLocLattitude
          ? _value.primaryLocLattitude
          : primaryLocLattitude // ignore: cast_nullable_to_non_nullable
              as String?,
      secondaryLocLattitude: freezed == secondaryLocLattitude
          ? _value.secondaryLocLattitude
          : secondaryLocLattitude // ignore: cast_nullable_to_non_nullable
              as String?,
      secondaryLocLongitude: freezed == secondaryLocLongitude
          ? _value.secondaryLocLongitude
          : secondaryLocLongitude // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AddressImpl implements _Address {
  const _$AddressImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'primary_location') required this.primaryLocation,
      @JsonKey(name: 'secondary_location') required this.secondaryLocation,
      @JsonKey(name: 'primary_loc_longitude') required this.primaryLocLongitude,
      @JsonKey(name: 'primary_loc_lattitude') required this.primaryLocLattitude,
      @JsonKey(name: 'secondary_loc_lattitude')
      required this.secondaryLocLattitude,
      @JsonKey(name: 'secondary_loc_longitude')
      required this.secondaryLocLongitude});

  factory _$AddressImpl.fromJson(Map<String, dynamic> json) =>
      _$$AddressImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int? id;
  @override
  @JsonKey(name: 'user_id')
  final int? userId;
  @override
  @JsonKey(name: 'primary_location')
  final String? primaryLocation;
  @override
  @JsonKey(name: 'secondary_location')
  final String? secondaryLocation;
  @override
  @JsonKey(name: 'primary_loc_longitude')
  final String? primaryLocLongitude;
  @override
  @JsonKey(name: 'primary_loc_lattitude')
  final String? primaryLocLattitude;
  @override
  @JsonKey(name: 'secondary_loc_lattitude')
  final String? secondaryLocLattitude;
  @override
  @JsonKey(name: 'secondary_loc_longitude')
  final String? secondaryLocLongitude;

  @override
  String toString() {
    return 'Address(id: $id, userId: $userId, primaryLocation: $primaryLocation, secondaryLocation: $secondaryLocation, primaryLocLongitude: $primaryLocLongitude, primaryLocLattitude: $primaryLocLattitude, secondaryLocLattitude: $secondaryLocLattitude, secondaryLocLongitude: $secondaryLocLongitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddressImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.primaryLocation, primaryLocation) ||
                other.primaryLocation == primaryLocation) &&
            (identical(other.secondaryLocation, secondaryLocation) ||
                other.secondaryLocation == secondaryLocation) &&
            (identical(other.primaryLocLongitude, primaryLocLongitude) ||
                other.primaryLocLongitude == primaryLocLongitude) &&
            (identical(other.primaryLocLattitude, primaryLocLattitude) ||
                other.primaryLocLattitude == primaryLocLattitude) &&
            (identical(other.secondaryLocLattitude, secondaryLocLattitude) ||
                other.secondaryLocLattitude == secondaryLocLattitude) &&
            (identical(other.secondaryLocLongitude, secondaryLocLongitude) ||
                other.secondaryLocLongitude == secondaryLocLongitude));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      primaryLocation,
      secondaryLocation,
      primaryLocLongitude,
      primaryLocLattitude,
      secondaryLocLattitude,
      secondaryLocLongitude);

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddressImplCopyWith<_$AddressImpl> get copyWith =>
      __$$AddressImplCopyWithImpl<_$AddressImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AddressImplToJson(
      this,
    );
  }
}

abstract class _Address implements Address {
  const factory _Address(
      {@JsonKey(name: 'id') required final int? id,
      @JsonKey(name: 'user_id') required final int? userId,
      @JsonKey(name: 'primary_location') required final String? primaryLocation,
      @JsonKey(name: 'secondary_location')
      required final String? secondaryLocation,
      @JsonKey(name: 'primary_loc_longitude')
      required final String? primaryLocLongitude,
      @JsonKey(name: 'primary_loc_lattitude')
      required final String? primaryLocLattitude,
      @JsonKey(name: 'secondary_loc_lattitude')
      required final String? secondaryLocLattitude,
      @JsonKey(name: 'secondary_loc_longitude')
      required final String? secondaryLocLongitude}) = _$AddressImpl;

  factory _Address.fromJson(Map<String, dynamic> json) = _$AddressImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int? get id;
  @override
  @JsonKey(name: 'user_id')
  int? get userId;
  @override
  @JsonKey(name: 'primary_location')
  String? get primaryLocation;
  @override
  @JsonKey(name: 'secondary_location')
  String? get secondaryLocation;
  @override
  @JsonKey(name: 'primary_loc_longitude')
  String? get primaryLocLongitude;
  @override
  @JsonKey(name: 'primary_loc_lattitude')
  String? get primaryLocLattitude;
  @override
  @JsonKey(name: 'secondary_loc_lattitude')
  String? get secondaryLocLattitude;
  @override
  @JsonKey(name: 'secondary_loc_longitude')
  String? get secondaryLocLongitude;

  /// Create a copy of Address
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddressImplCopyWith<_$AddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
