// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'package_detail.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PackageDetail _$PackageDetailFromJson(Map<String, dynamic> json) {
  return _PackageDetail.fromJson(json);
}

/// @nodoc
mixin _$PackageDetail {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'package_name')
  String get packageName => throw _privateConstructorUsedError;
  @JsonKey(name: 'image')
  String get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'package_category_id')
  int get packageCategoryId => throw _privateConstructorUsedError;
  @JsonKey(name: 'package_price')
  int get packagePrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'package_qty')
  int get packageQty => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_price')
  int get discountPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'short_description')
  String get shortDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'long_description')
  String get longDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'currency_id')
  int get currencyId => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  int get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_deleted')
  int get isDeleted => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_name')
  String get categoryName => throw _privateConstructorUsedError;
  @JsonKey(name: 'currency_symbol')
  String get currencySymbol => throw _privateConstructorUsedError;

  /// Serializes this PackageDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PackageDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PackageDetailCopyWith<PackageDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PackageDetailCopyWith<$Res> {
  factory $PackageDetailCopyWith(
          PackageDetail value, $Res Function(PackageDetail) then) =
      _$PackageDetailCopyWithImpl<$Res, PackageDetail>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'package_name') String packageName,
      @JsonKey(name: 'image') String image,
      @JsonKey(name: 'package_category_id') int packageCategoryId,
      @JsonKey(name: 'package_price') int packagePrice,
      @JsonKey(name: 'package_qty') int packageQty,
      @JsonKey(name: 'discount_price') int discountPrice,
      @JsonKey(name: 'short_description') String shortDescription,
      @JsonKey(name: 'long_description') String longDescription,
      @JsonKey(name: 'currency_id') int currencyId,
      @JsonKey(name: 'status') int status,
      @JsonKey(name: 'is_deleted') int isDeleted,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'category_name') String categoryName,
      @JsonKey(name: 'currency_symbol') String currencySymbol});
}

/// @nodoc
class _$PackageDetailCopyWithImpl<$Res, $Val extends PackageDetail>
    implements $PackageDetailCopyWith<$Res> {
  _$PackageDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PackageDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? packageName = null,
    Object? image = null,
    Object? packageCategoryId = null,
    Object? packagePrice = null,
    Object? packageQty = null,
    Object? discountPrice = null,
    Object? shortDescription = null,
    Object? longDescription = null,
    Object? currencyId = null,
    Object? status = null,
    Object? isDeleted = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? categoryName = null,
    Object? currencySymbol = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      packageName: null == packageName
          ? _value.packageName
          : packageName // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      packageCategoryId: null == packageCategoryId
          ? _value.packageCategoryId
          : packageCategoryId // ignore: cast_nullable_to_non_nullable
              as int,
      packagePrice: null == packagePrice
          ? _value.packagePrice
          : packagePrice // ignore: cast_nullable_to_non_nullable
              as int,
      packageQty: null == packageQty
          ? _value.packageQty
          : packageQty // ignore: cast_nullable_to_non_nullable
              as int,
      discountPrice: null == discountPrice
          ? _value.discountPrice
          : discountPrice // ignore: cast_nullable_to_non_nullable
              as int,
      shortDescription: null == shortDescription
          ? _value.shortDescription
          : shortDescription // ignore: cast_nullable_to_non_nullable
              as String,
      longDescription: null == longDescription
          ? _value.longDescription
          : longDescription // ignore: cast_nullable_to_non_nullable
              as String,
      currencyId: null == currencyId
          ? _value.currencyId
          : currencyId // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      currencySymbol: null == currencySymbol
          ? _value.currencySymbol
          : currencySymbol // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PackageDetailImplCopyWith<$Res>
    implements $PackageDetailCopyWith<$Res> {
  factory _$$PackageDetailImplCopyWith(
          _$PackageDetailImpl value, $Res Function(_$PackageDetailImpl) then) =
      __$$PackageDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'package_name') String packageName,
      @JsonKey(name: 'image') String image,
      @JsonKey(name: 'package_category_id') int packageCategoryId,
      @JsonKey(name: 'package_price') int packagePrice,
      @JsonKey(name: 'package_qty') int packageQty,
      @JsonKey(name: 'discount_price') int discountPrice,
      @JsonKey(name: 'short_description') String shortDescription,
      @JsonKey(name: 'long_description') String longDescription,
      @JsonKey(name: 'currency_id') int currencyId,
      @JsonKey(name: 'status') int status,
      @JsonKey(name: 'is_deleted') int isDeleted,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'category_name') String categoryName,
      @JsonKey(name: 'currency_symbol') String currencySymbol});
}

/// @nodoc
class __$$PackageDetailImplCopyWithImpl<$Res>
    extends _$PackageDetailCopyWithImpl<$Res, _$PackageDetailImpl>
    implements _$$PackageDetailImplCopyWith<$Res> {
  __$$PackageDetailImplCopyWithImpl(
      _$PackageDetailImpl _value, $Res Function(_$PackageDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of PackageDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? packageName = null,
    Object? image = null,
    Object? packageCategoryId = null,
    Object? packagePrice = null,
    Object? packageQty = null,
    Object? discountPrice = null,
    Object? shortDescription = null,
    Object? longDescription = null,
    Object? currencyId = null,
    Object? status = null,
    Object? isDeleted = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? categoryName = null,
    Object? currencySymbol = null,
  }) {
    return _then(_$PackageDetailImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      packageName: null == packageName
          ? _value.packageName
          : packageName // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      packageCategoryId: null == packageCategoryId
          ? _value.packageCategoryId
          : packageCategoryId // ignore: cast_nullable_to_non_nullable
              as int,
      packagePrice: null == packagePrice
          ? _value.packagePrice
          : packagePrice // ignore: cast_nullable_to_non_nullable
              as int,
      packageQty: null == packageQty
          ? _value.packageQty
          : packageQty // ignore: cast_nullable_to_non_nullable
              as int,
      discountPrice: null == discountPrice
          ? _value.discountPrice
          : discountPrice // ignore: cast_nullable_to_non_nullable
              as int,
      shortDescription: null == shortDescription
          ? _value.shortDescription
          : shortDescription // ignore: cast_nullable_to_non_nullable
              as String,
      longDescription: null == longDescription
          ? _value.longDescription
          : longDescription // ignore: cast_nullable_to_non_nullable
              as String,
      currencyId: null == currencyId
          ? _value.currencyId
          : currencyId // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      currencySymbol: null == currencySymbol
          ? _value.currencySymbol
          : currencySymbol // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PackageDetailImpl implements _PackageDetail {
  const _$PackageDetailImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'package_name') required this.packageName,
      @JsonKey(name: 'image') required this.image,
      @JsonKey(name: 'package_category_id') required this.packageCategoryId,
      @JsonKey(name: 'package_price') required this.packagePrice,
      @JsonKey(name: 'package_qty') required this.packageQty,
      @JsonKey(name: 'discount_price') required this.discountPrice,
      @JsonKey(name: 'short_description') required this.shortDescription,
      @JsonKey(name: 'long_description') required this.longDescription,
      @JsonKey(name: 'currency_id') required this.currencyId,
      @JsonKey(name: 'status') required this.status,
      @JsonKey(name: 'is_deleted') required this.isDeleted,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      @JsonKey(name: 'category_name') required this.categoryName,
      @JsonKey(name: 'currency_symbol') required this.currencySymbol});

  factory _$PackageDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$PackageDetailImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'package_name')
  final String packageName;
  @override
  @JsonKey(name: 'image')
  final String image;
  @override
  @JsonKey(name: 'package_category_id')
  final int packageCategoryId;
  @override
  @JsonKey(name: 'package_price')
  final int packagePrice;
  @override
  @JsonKey(name: 'package_qty')
  final int packageQty;
  @override
  @JsonKey(name: 'discount_price')
  final int discountPrice;
  @override
  @JsonKey(name: 'short_description')
  final String shortDescription;
  @override
  @JsonKey(name: 'long_description')
  final String longDescription;
  @override
  @JsonKey(name: 'currency_id')
  final int currencyId;
  @override
  @JsonKey(name: 'status')
  final int status;
  @override
  @JsonKey(name: 'is_deleted')
  final int isDeleted;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'category_name')
  final String categoryName;
  @override
  @JsonKey(name: 'currency_symbol')
  final String currencySymbol;

  @override
  String toString() {
    return 'PackageDetail(id: $id, packageName: $packageName, image: $image, packageCategoryId: $packageCategoryId, packagePrice: $packagePrice, packageQty: $packageQty, discountPrice: $discountPrice, shortDescription: $shortDescription, longDescription: $longDescription, currencyId: $currencyId, status: $status, isDeleted: $isDeleted, createdAt: $createdAt, updatedAt: $updatedAt, categoryName: $categoryName, currencySymbol: $currencySymbol)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PackageDetailImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.packageName, packageName) ||
                other.packageName == packageName) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.packageCategoryId, packageCategoryId) ||
                other.packageCategoryId == packageCategoryId) &&
            (identical(other.packagePrice, packagePrice) ||
                other.packagePrice == packagePrice) &&
            (identical(other.packageQty, packageQty) ||
                other.packageQty == packageQty) &&
            (identical(other.discountPrice, discountPrice) ||
                other.discountPrice == discountPrice) &&
            (identical(other.shortDescription, shortDescription) ||
                other.shortDescription == shortDescription) &&
            (identical(other.longDescription, longDescription) ||
                other.longDescription == longDescription) &&
            (identical(other.currencyId, currencyId) ||
                other.currencyId == currencyId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.currencySymbol, currencySymbol) ||
                other.currencySymbol == currencySymbol));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      packageName,
      image,
      packageCategoryId,
      packagePrice,
      packageQty,
      discountPrice,
      shortDescription,
      longDescription,
      currencyId,
      status,
      isDeleted,
      createdAt,
      updatedAt,
      categoryName,
      currencySymbol);

  /// Create a copy of PackageDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PackageDetailImplCopyWith<_$PackageDetailImpl> get copyWith =>
      __$$PackageDetailImplCopyWithImpl<_$PackageDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PackageDetailImplToJson(
      this,
    );
  }
}

abstract class _PackageDetail implements PackageDetail {
  const factory _PackageDetail(
      {@JsonKey(name: 'id') required final int id,
      @JsonKey(name: 'package_name') required final String packageName,
      @JsonKey(name: 'image') required final String image,
      @JsonKey(name: 'package_category_id')
      required final int packageCategoryId,
      @JsonKey(name: 'package_price') required final int packagePrice,
      @JsonKey(name: 'package_qty') required final int packageQty,
      @JsonKey(name: 'discount_price') required final int discountPrice,
      @JsonKey(name: 'short_description')
      required final String shortDescription,
      @JsonKey(name: 'long_description') required final String longDescription,
      @JsonKey(name: 'currency_id') required final int currencyId,
      @JsonKey(name: 'status') required final int status,
      @JsonKey(name: 'is_deleted') required final int isDeleted,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      @JsonKey(name: 'updated_at') required final DateTime updatedAt,
      @JsonKey(name: 'category_name') required final String categoryName,
      @JsonKey(name: 'currency_symbol')
      required final String currencySymbol}) = _$PackageDetailImpl;

  factory _PackageDetail.fromJson(Map<String, dynamic> json) =
      _$PackageDetailImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'package_name')
  String get packageName;
  @override
  @JsonKey(name: 'image')
  String get image;
  @override
  @JsonKey(name: 'package_category_id')
  int get packageCategoryId;
  @override
  @JsonKey(name: 'package_price')
  int get packagePrice;
  @override
  @JsonKey(name: 'package_qty')
  int get packageQty;
  @override
  @JsonKey(name: 'discount_price')
  int get discountPrice;
  @override
  @JsonKey(name: 'short_description')
  String get shortDescription;
  @override
  @JsonKey(name: 'long_description')
  String get longDescription;
  @override
  @JsonKey(name: 'currency_id')
  int get currencyId;
  @override
  @JsonKey(name: 'status')
  int get status;
  @override
  @JsonKey(name: 'is_deleted')
  int get isDeleted;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'category_name')
  String get categoryName;
  @override
  @JsonKey(name: 'currency_symbol')
  String get currencySymbol;

  /// Create a copy of PackageDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PackageDetailImplCopyWith<_$PackageDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
