// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'favourite_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FavouriteModel _$FavouriteModelFromJson(Map<String, dynamic> json) {
  return _FavouriteModel.fromJson(json);
}

/// @nodoc
mixin _$FavouriteModel {
  @JsonKey(name: 'status')
  int get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'favourites')
  List<Favourite> get favourites => throw _privateConstructorUsedError;

  /// Serializes this FavouriteModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FavouriteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FavouriteModelCopyWith<FavouriteModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavouriteModelCopyWith<$Res> {
  factory $FavouriteModelCopyWith(
          FavouriteModel value, $Res Function(FavouriteModel) then) =
      _$FavouriteModelCopyWithImpl<$Res, FavouriteModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'status') int status,
      @JsonKey(name: 'favourites') List<Favourite> favourites});
}

/// @nodoc
class _$FavouriteModelCopyWithImpl<$Res, $Val extends FavouriteModel>
    implements $FavouriteModelCopyWith<$Res> {
  _$FavouriteModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FavouriteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? favourites = null,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      favourites: null == favourites
          ? _value.favourites
          : favourites // ignore: cast_nullable_to_non_nullable
              as List<Favourite>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FavouriteModelImplCopyWith<$Res>
    implements $FavouriteModelCopyWith<$Res> {
  factory _$$FavouriteModelImplCopyWith(_$FavouriteModelImpl value,
          $Res Function(_$FavouriteModelImpl) then) =
      __$$FavouriteModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'status') int status,
      @JsonKey(name: 'favourites') List<Favourite> favourites});
}

/// @nodoc
class __$$FavouriteModelImplCopyWithImpl<$Res>
    extends _$FavouriteModelCopyWithImpl<$Res, _$FavouriteModelImpl>
    implements _$$FavouriteModelImplCopyWith<$Res> {
  __$$FavouriteModelImplCopyWithImpl(
      _$FavouriteModelImpl _value, $Res Function(_$FavouriteModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of FavouriteModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? favourites = null,
  }) {
    return _then(_$FavouriteModelImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      favourites: null == favourites
          ? _value._favourites
          : favourites // ignore: cast_nullable_to_non_nullable
              as List<Favourite>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FavouriteModelImpl implements _FavouriteModel {
  const _$FavouriteModelImpl(
      {@JsonKey(name: 'status') required this.status,
      @JsonKey(name: 'favourites') required final List<Favourite> favourites})
      : _favourites = favourites;

  factory _$FavouriteModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FavouriteModelImplFromJson(json);

  @override
  @JsonKey(name: 'status')
  final int status;
  final List<Favourite> _favourites;
  @override
  @JsonKey(name: 'favourites')
  List<Favourite> get favourites {
    if (_favourites is EqualUnmodifiableListView) return _favourites;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favourites);
  }

  @override
  String toString() {
    return 'FavouriteModel(status: $status, favourites: $favourites)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavouriteModelImpl &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._favourites, _favourites));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, status, const DeepCollectionEquality().hash(_favourites));

  /// Create a copy of FavouriteModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FavouriteModelImplCopyWith<_$FavouriteModelImpl> get copyWith =>
      __$$FavouriteModelImplCopyWithImpl<_$FavouriteModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FavouriteModelImplToJson(
      this,
    );
  }
}

abstract class _FavouriteModel implements FavouriteModel {
  const factory _FavouriteModel(
      {@JsonKey(name: 'status') required final int status,
      @JsonKey(name: 'favourites')
      required final List<Favourite> favourites}) = _$FavouriteModelImpl;

  factory _FavouriteModel.fromJson(Map<String, dynamic> json) =
      _$FavouriteModelImpl.fromJson;

  @override
  @JsonKey(name: 'status')
  int get status;
  @override
  @JsonKey(name: 'favourites')
  List<Favourite> get favourites;

  /// Create a copy of FavouriteModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FavouriteModelImplCopyWith<_$FavouriteModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Favourite _$FavouriteFromJson(Map<String, dynamic> json) {
  return _Favourite.fromJson(json);
}

/// @nodoc
mixin _$Favourite {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_ip')
  String get userIp => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int? get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'item_id')
  int? get itemId => throw _privateConstructorUsedError;
  @JsonKey(name: 'package_id')
  int? get packageId => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'item_name')
  String? get itemName => throw _privateConstructorUsedError;
  @JsonKey(name: 'item_price')
  int? get itemPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'item_discount_price')
  int? get itemDiscountPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'package_name')
  String? get packageName => throw _privateConstructorUsedError;
  @JsonKey(name: 'package_price')
  int? get packagePrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'package_discount_price')
  int? get packageDiscountPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'item_image')
  String get itemImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'package_image')
  String get packageImage => throw _privateConstructorUsedError;

  /// Serializes this Favourite to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Favourite
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FavouriteCopyWith<Favourite> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavouriteCopyWith<$Res> {
  factory $FavouriteCopyWith(Favourite value, $Res Function(Favourite) then) =
      _$FavouriteCopyWithImpl<$Res, Favourite>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'user_ip') String userIp,
      @JsonKey(name: 'user_id') int? userId,
      @JsonKey(name: 'item_id') int? itemId,
      @JsonKey(name: 'package_id') int? packageId,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'item_name') String? itemName,
      @JsonKey(name: 'item_price') int? itemPrice,
      @JsonKey(name: 'item_discount_price') int? itemDiscountPrice,
      @JsonKey(name: 'package_name') String? packageName,
      @JsonKey(name: 'package_price') int? packagePrice,
      @JsonKey(name: 'package_discount_price') int? packageDiscountPrice,
      @JsonKey(name: 'item_image') String itemImage,
      @JsonKey(name: 'package_image') String packageImage});
}

/// @nodoc
class _$FavouriteCopyWithImpl<$Res, $Val extends Favourite>
    implements $FavouriteCopyWith<$Res> {
  _$FavouriteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Favourite
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userIp = null,
    Object? userId = freezed,
    Object? itemId = freezed,
    Object? packageId = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? itemName = freezed,
    Object? itemPrice = freezed,
    Object? itemDiscountPrice = freezed,
    Object? packageName = freezed,
    Object? packagePrice = freezed,
    Object? packageDiscountPrice = freezed,
    Object? itemImage = null,
    Object? packageImage = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userIp: null == userIp
          ? _value.userIp
          : userIp // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      itemId: freezed == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as int?,
      packageId: freezed == packageId
          ? _value.packageId
          : packageId // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      itemName: freezed == itemName
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String?,
      itemPrice: freezed == itemPrice
          ? _value.itemPrice
          : itemPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      itemDiscountPrice: freezed == itemDiscountPrice
          ? _value.itemDiscountPrice
          : itemDiscountPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      packageName: freezed == packageName
          ? _value.packageName
          : packageName // ignore: cast_nullable_to_non_nullable
              as String?,
      packagePrice: freezed == packagePrice
          ? _value.packagePrice
          : packagePrice // ignore: cast_nullable_to_non_nullable
              as int?,
      packageDiscountPrice: freezed == packageDiscountPrice
          ? _value.packageDiscountPrice
          : packageDiscountPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      itemImage: null == itemImage
          ? _value.itemImage
          : itemImage // ignore: cast_nullable_to_non_nullable
              as String,
      packageImage: null == packageImage
          ? _value.packageImage
          : packageImage // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FavouriteImplCopyWith<$Res>
    implements $FavouriteCopyWith<$Res> {
  factory _$$FavouriteImplCopyWith(
          _$FavouriteImpl value, $Res Function(_$FavouriteImpl) then) =
      __$$FavouriteImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'user_ip') String userIp,
      @JsonKey(name: 'user_id') int? userId,
      @JsonKey(name: 'item_id') int? itemId,
      @JsonKey(name: 'package_id') int? packageId,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'item_name') String? itemName,
      @JsonKey(name: 'item_price') int? itemPrice,
      @JsonKey(name: 'item_discount_price') int? itemDiscountPrice,
      @JsonKey(name: 'package_name') String? packageName,
      @JsonKey(name: 'package_price') int? packagePrice,
      @JsonKey(name: 'package_discount_price') int? packageDiscountPrice,
      @JsonKey(name: 'item_image') String itemImage,
      @JsonKey(name: 'package_image') String packageImage});
}

/// @nodoc
class __$$FavouriteImplCopyWithImpl<$Res>
    extends _$FavouriteCopyWithImpl<$Res, _$FavouriteImpl>
    implements _$$FavouriteImplCopyWith<$Res> {
  __$$FavouriteImplCopyWithImpl(
      _$FavouriteImpl _value, $Res Function(_$FavouriteImpl) _then)
      : super(_value, _then);

  /// Create a copy of Favourite
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userIp = null,
    Object? userId = freezed,
    Object? itemId = freezed,
    Object? packageId = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? itemName = freezed,
    Object? itemPrice = freezed,
    Object? itemDiscountPrice = freezed,
    Object? packageName = freezed,
    Object? packagePrice = freezed,
    Object? packageDiscountPrice = freezed,
    Object? itemImage = null,
    Object? packageImage = null,
  }) {
    return _then(_$FavouriteImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userIp: null == userIp
          ? _value.userIp
          : userIp // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int?,
      itemId: freezed == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as int?,
      packageId: freezed == packageId
          ? _value.packageId
          : packageId // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      itemName: freezed == itemName
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String?,
      itemPrice: freezed == itemPrice
          ? _value.itemPrice
          : itemPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      itemDiscountPrice: freezed == itemDiscountPrice
          ? _value.itemDiscountPrice
          : itemDiscountPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      packageName: freezed == packageName
          ? _value.packageName
          : packageName // ignore: cast_nullable_to_non_nullable
              as String?,
      packagePrice: freezed == packagePrice
          ? _value.packagePrice
          : packagePrice // ignore: cast_nullable_to_non_nullable
              as int?,
      packageDiscountPrice: freezed == packageDiscountPrice
          ? _value.packageDiscountPrice
          : packageDiscountPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      itemImage: null == itemImage
          ? _value.itemImage
          : itemImage // ignore: cast_nullable_to_non_nullable
              as String,
      packageImage: null == packageImage
          ? _value.packageImage
          : packageImage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FavouriteImpl extends _Favourite {
  const _$FavouriteImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'user_ip') required this.userIp,
      @JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'item_id') required this.itemId,
      @JsonKey(name: 'package_id') required this.packageId,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      @JsonKey(name: 'item_name') required this.itemName,
      @JsonKey(name: 'item_price') required this.itemPrice,
      @JsonKey(name: 'item_discount_price') required this.itemDiscountPrice,
      @JsonKey(name: 'package_name') required this.packageName,
      @JsonKey(name: 'package_price') required this.packagePrice,
      @JsonKey(name: 'package_discount_price')
      required this.packageDiscountPrice,
      @JsonKey(name: 'item_image') required this.itemImage,
      @JsonKey(name: 'package_image') required this.packageImage})
      : super._();

  factory _$FavouriteImpl.fromJson(Map<String, dynamic> json) =>
      _$$FavouriteImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'user_ip')
  final String userIp;
  @override
  @JsonKey(name: 'user_id')
  final int? userId;
  @override
  @JsonKey(name: 'item_id')
  final int? itemId;
  @override
  @JsonKey(name: 'package_id')
  final int? packageId;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'item_name')
  final String? itemName;
  @override
  @JsonKey(name: 'item_price')
  final int? itemPrice;
  @override
  @JsonKey(name: 'item_discount_price')
  final int? itemDiscountPrice;
  @override
  @JsonKey(name: 'package_name')
  final String? packageName;
  @override
  @JsonKey(name: 'package_price')
  final int? packagePrice;
  @override
  @JsonKey(name: 'package_discount_price')
  final int? packageDiscountPrice;
  @override
  @JsonKey(name: 'item_image')
  final String itemImage;
  @override
  @JsonKey(name: 'package_image')
  final String packageImage;

  @override
  String toString() {
    return 'Favourite(id: $id, userIp: $userIp, userId: $userId, itemId: $itemId, packageId: $packageId, createdAt: $createdAt, updatedAt: $updatedAt, itemName: $itemName, itemPrice: $itemPrice, itemDiscountPrice: $itemDiscountPrice, packageName: $packageName, packagePrice: $packagePrice, packageDiscountPrice: $packageDiscountPrice, itemImage: $itemImage, packageImage: $packageImage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavouriteImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userIp, userIp) || other.userIp == userIp) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.packageId, packageId) ||
                other.packageId == packageId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.itemName, itemName) ||
                other.itemName == itemName) &&
            (identical(other.itemPrice, itemPrice) ||
                other.itemPrice == itemPrice) &&
            (identical(other.itemDiscountPrice, itemDiscountPrice) ||
                other.itemDiscountPrice == itemDiscountPrice) &&
            (identical(other.packageName, packageName) ||
                other.packageName == packageName) &&
            (identical(other.packagePrice, packagePrice) ||
                other.packagePrice == packagePrice) &&
            (identical(other.packageDiscountPrice, packageDiscountPrice) ||
                other.packageDiscountPrice == packageDiscountPrice) &&
            (identical(other.itemImage, itemImage) ||
                other.itemImage == itemImage) &&
            (identical(other.packageImage, packageImage) ||
                other.packageImage == packageImage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userIp,
      userId,
      itemId,
      packageId,
      createdAt,
      updatedAt,
      itemName,
      itemPrice,
      itemDiscountPrice,
      packageName,
      packagePrice,
      packageDiscountPrice,
      itemImage,
      packageImage);

  /// Create a copy of Favourite
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FavouriteImplCopyWith<_$FavouriteImpl> get copyWith =>
      __$$FavouriteImplCopyWithImpl<_$FavouriteImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FavouriteImplToJson(
      this,
    );
  }
}

abstract class _Favourite extends Favourite {
  const factory _Favourite(
          {@JsonKey(name: 'id') required final int id,
          @JsonKey(name: 'user_ip') required final String userIp,
          @JsonKey(name: 'user_id') required final int? userId,
          @JsonKey(name: 'item_id') required final int? itemId,
          @JsonKey(name: 'package_id') required final int? packageId,
          @JsonKey(name: 'created_at') required final DateTime createdAt,
          @JsonKey(name: 'updated_at') required final DateTime updatedAt,
          @JsonKey(name: 'item_name') required final String? itemName,
          @JsonKey(name: 'item_price') required final int? itemPrice,
          @JsonKey(name: 'item_discount_price')
          required final int? itemDiscountPrice,
          @JsonKey(name: 'package_name') required final String? packageName,
          @JsonKey(name: 'package_price') required final int? packagePrice,
          @JsonKey(name: 'package_discount_price')
          required final int? packageDiscountPrice,
          @JsonKey(name: 'item_image') required final String itemImage,
          @JsonKey(name: 'package_image') required final String packageImage}) =
      _$FavouriteImpl;
  const _Favourite._() : super._();

  factory _Favourite.fromJson(Map<String, dynamic> json) =
      _$FavouriteImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'user_ip')
  String get userIp;
  @override
  @JsonKey(name: 'user_id')
  int? get userId;
  @override
  @JsonKey(name: 'item_id')
  int? get itemId;
  @override
  @JsonKey(name: 'package_id')
  int? get packageId;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'item_name')
  String? get itemName;
  @override
  @JsonKey(name: 'item_price')
  int? get itemPrice;
  @override
  @JsonKey(name: 'item_discount_price')
  int? get itemDiscountPrice;
  @override
  @JsonKey(name: 'package_name')
  String? get packageName;
  @override
  @JsonKey(name: 'package_price')
  int? get packagePrice;
  @override
  @JsonKey(name: 'package_discount_price')
  int? get packageDiscountPrice;
  @override
  @JsonKey(name: 'item_image')
  String get itemImage;
  @override
  @JsonKey(name: 'package_image')
  String get packageImage;

  /// Create a copy of Favourite
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FavouriteImplCopyWith<_$FavouriteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
