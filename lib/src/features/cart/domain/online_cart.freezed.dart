// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'online_cart.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RemoteCart _$RemoteCartFromJson(Map<String, dynamic> json) {
  return _RemoteCart.fromJson(json);
}

/// @nodoc
mixin _$RemoteCart {
  @JsonKey(name: 'carts')
  List<CartModel> get carts => throw _privateConstructorUsedError;

  /// Serializes this RemoteCart to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of RemoteCart
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RemoteCartCopyWith<RemoteCart> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RemoteCartCopyWith<$Res> {
  factory $RemoteCartCopyWith(
          RemoteCart value, $Res Function(RemoteCart) then) =
      _$RemoteCartCopyWithImpl<$Res, RemoteCart>;
  @useResult
  $Res call({@JsonKey(name: 'carts') List<CartModel> carts});
}

/// @nodoc
class _$RemoteCartCopyWithImpl<$Res, $Val extends RemoteCart>
    implements $RemoteCartCopyWith<$Res> {
  _$RemoteCartCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of RemoteCart
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? carts = null,
  }) {
    return _then(_value.copyWith(
      carts: null == carts
          ? _value.carts
          : carts // ignore: cast_nullable_to_non_nullable
              as List<CartModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RemoteCartImplCopyWith<$Res>
    implements $RemoteCartCopyWith<$Res> {
  factory _$$RemoteCartImplCopyWith(
          _$RemoteCartImpl value, $Res Function(_$RemoteCartImpl) then) =
      __$$RemoteCartImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'carts') List<CartModel> carts});
}

/// @nodoc
class __$$RemoteCartImplCopyWithImpl<$Res>
    extends _$RemoteCartCopyWithImpl<$Res, _$RemoteCartImpl>
    implements _$$RemoteCartImplCopyWith<$Res> {
  __$$RemoteCartImplCopyWithImpl(
      _$RemoteCartImpl _value, $Res Function(_$RemoteCartImpl) _then)
      : super(_value, _then);

  /// Create a copy of RemoteCart
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? carts = null,
  }) {
    return _then(_$RemoteCartImpl(
      carts: null == carts
          ? _value._carts
          : carts // ignore: cast_nullable_to_non_nullable
              as List<CartModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RemoteCartImpl implements _RemoteCart {
  const _$RemoteCartImpl(
      {@JsonKey(name: 'carts') required final List<CartModel> carts})
      : _carts = carts;

  factory _$RemoteCartImpl.fromJson(Map<String, dynamic> json) =>
      _$$RemoteCartImplFromJson(json);

  final List<CartModel> _carts;
  @override
  @JsonKey(name: 'carts')
  List<CartModel> get carts {
    if (_carts is EqualUnmodifiableListView) return _carts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_carts);
  }

  @override
  String toString() {
    return 'RemoteCart(carts: $carts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoteCartImpl &&
            const DeepCollectionEquality().equals(other._carts, _carts));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_carts));

  /// Create a copy of RemoteCart
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoteCartImplCopyWith<_$RemoteCartImpl> get copyWith =>
      __$$RemoteCartImplCopyWithImpl<_$RemoteCartImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RemoteCartImplToJson(
      this,
    );
  }
}

abstract class _RemoteCart implements RemoteCart {
  const factory _RemoteCart(
          {@JsonKey(name: 'carts') required final List<CartModel> carts}) =
      _$RemoteCartImpl;

  factory _RemoteCart.fromJson(Map<String, dynamic> json) =
      _$RemoteCartImpl.fromJson;

  @override
  @JsonKey(name: 'carts')
  List<CartModel> get carts;

  /// Create a copy of RemoteCart
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RemoteCartImplCopyWith<_$RemoteCartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CartModel _$CartModelFromJson(Map<String, dynamic> json) {
  return _CartModel.fromJson(json);
}

/// @nodoc
mixin _$CartModel {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_ip')
  String get userIp => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'item_id')
  int? get itemId => throw _privateConstructorUsedError;
  @JsonKey(name: 'package_id')
  int? get packageId => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'quantity')
  int get quantity => throw _privateConstructorUsedError;
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

  /// Serializes this CartModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CartModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CartModelCopyWith<CartModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartModelCopyWith<$Res> {
  factory $CartModelCopyWith(CartModel value, $Res Function(CartModel) then) =
      _$CartModelCopyWithImpl<$Res, CartModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'user_ip') String userIp,
      @JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'item_id') int? itemId,
      @JsonKey(name: 'package_id') int? packageId,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'quantity') int quantity,
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
class _$CartModelCopyWithImpl<$Res, $Val extends CartModel>
    implements $CartModelCopyWith<$Res> {
  _$CartModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CartModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userIp = null,
    Object? userId = null,
    Object? itemId = freezed,
    Object? packageId = freezed,
    Object? createdAt = null,
    Object? quantity = null,
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
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
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
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
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
abstract class _$$CartModelImplCopyWith<$Res>
    implements $CartModelCopyWith<$Res> {
  factory _$$CartModelImplCopyWith(
          _$CartModelImpl value, $Res Function(_$CartModelImpl) then) =
      __$$CartModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'user_ip') String userIp,
      @JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'item_id') int? itemId,
      @JsonKey(name: 'package_id') int? packageId,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'quantity') int quantity,
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
class __$$CartModelImplCopyWithImpl<$Res>
    extends _$CartModelCopyWithImpl<$Res, _$CartModelImpl>
    implements _$$CartModelImplCopyWith<$Res> {
  __$$CartModelImplCopyWithImpl(
      _$CartModelImpl _value, $Res Function(_$CartModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CartModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userIp = null,
    Object? userId = null,
    Object? itemId = freezed,
    Object? packageId = freezed,
    Object? createdAt = null,
    Object? quantity = null,
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
    return _then(_$CartModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userIp: null == userIp
          ? _value.userIp
          : userIp // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
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
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int,
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
class _$CartModelImpl implements _CartModel {
  const _$CartModelImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'user_ip') required this.userIp,
      @JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'item_id') required this.itemId,
      @JsonKey(name: 'package_id') required this.packageId,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'quantity') required this.quantity,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      @JsonKey(name: 'item_name') required this.itemName,
      @JsonKey(name: 'item_price') required this.itemPrice,
      @JsonKey(name: 'item_discount_price') required this.itemDiscountPrice,
      @JsonKey(name: 'package_name') required this.packageName,
      @JsonKey(name: 'package_price') required this.packagePrice,
      @JsonKey(name: 'package_discount_price')
      required this.packageDiscountPrice,
      @JsonKey(name: 'item_image') required this.itemImage,
      @JsonKey(name: 'package_image') required this.packageImage});

  factory _$CartModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CartModelImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'user_ip')
  final String userIp;
  @override
  @JsonKey(name: 'user_id')
  final int userId;
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
  @JsonKey(name: 'quantity')
  final int quantity;
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
    return 'CartModel(id: $id, userIp: $userIp, userId: $userId, itemId: $itemId, packageId: $packageId, createdAt: $createdAt, quantity: $quantity, updatedAt: $updatedAt, itemName: $itemName, itemPrice: $itemPrice, itemDiscountPrice: $itemDiscountPrice, packageName: $packageName, packagePrice: $packagePrice, packageDiscountPrice: $packageDiscountPrice, itemImage: $itemImage, packageImage: $packageImage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userIp, userIp) || other.userIp == userIp) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.packageId, packageId) ||
                other.packageId == packageId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
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
      quantity,
      updatedAt,
      itemName,
      itemPrice,
      itemDiscountPrice,
      packageName,
      packagePrice,
      packageDiscountPrice,
      itemImage,
      packageImage);

  /// Create a copy of CartModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CartModelImplCopyWith<_$CartModelImpl> get copyWith =>
      __$$CartModelImplCopyWithImpl<_$CartModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CartModelImplToJson(
      this,
    );
  }
}

abstract class _CartModel implements CartModel {
  const factory _CartModel(
          {@JsonKey(name: 'id') required final int id,
          @JsonKey(name: 'user_ip') required final String userIp,
          @JsonKey(name: 'user_id') required final int userId,
          @JsonKey(name: 'item_id') required final int? itemId,
          @JsonKey(name: 'package_id') required final int? packageId,
          @JsonKey(name: 'created_at') required final DateTime createdAt,
          @JsonKey(name: 'quantity') required final int quantity,
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
      _$CartModelImpl;

  factory _CartModel.fromJson(Map<String, dynamic> json) =
      _$CartModelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'user_ip')
  String get userIp;
  @override
  @JsonKey(name: 'user_id')
  int get userId;
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
  @JsonKey(name: 'quantity')
  int get quantity;
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

  /// Create a copy of CartModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CartModelImplCopyWith<_$CartModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
