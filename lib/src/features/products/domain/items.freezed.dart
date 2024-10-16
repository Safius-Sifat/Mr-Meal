// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'items.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Items _$ItemsFromJson(Map<String, dynamic> json) {
  return _Items.fromJson(json);
}

/// @nodoc
mixin _$Items {
  @JsonKey(name: 'current_page')
  int get currentPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  List<Datum> get data => throw _privateConstructorUsedError;
  @JsonKey(name: 'first_page_url')
  String get firstPageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'from')
  int? get from => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_page')
  int get lastPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_page_url')
  String get lastPageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'links')
  List<Link> get links => throw _privateConstructorUsedError;
  @JsonKey(name: 'next_page_url')
  String? get nextPageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'path')
  String get path => throw _privateConstructorUsedError;
  @JsonKey(name: 'per_page')
  int get perPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'prev_page_url')
  String? get prevPageUrl => throw _privateConstructorUsedError;
  @JsonKey(name: 'to')
  int? get to => throw _privateConstructorUsedError;
  @JsonKey(name: 'total')
  int get total => throw _privateConstructorUsedError;

  /// Serializes this Items to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Items
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ItemsCopyWith<Items> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItemsCopyWith<$Res> {
  factory $ItemsCopyWith(Items value, $Res Function(Items) then) =
      _$ItemsCopyWithImpl<$Res, Items>;
  @useResult
  $Res call(
      {@JsonKey(name: 'current_page') int currentPage,
      @JsonKey(name: 'data') List<Datum> data,
      @JsonKey(name: 'first_page_url') String firstPageUrl,
      @JsonKey(name: 'from') int? from,
      @JsonKey(name: 'last_page') int lastPage,
      @JsonKey(name: 'last_page_url') String lastPageUrl,
      @JsonKey(name: 'links') List<Link> links,
      @JsonKey(name: 'next_page_url') String? nextPageUrl,
      @JsonKey(name: 'path') String path,
      @JsonKey(name: 'per_page') int perPage,
      @JsonKey(name: 'prev_page_url') String? prevPageUrl,
      @JsonKey(name: 'to') int? to,
      @JsonKey(name: 'total') int total});
}

/// @nodoc
class _$ItemsCopyWithImpl<$Res, $Val extends Items>
    implements $ItemsCopyWith<$Res> {
  _$ItemsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Items
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? data = null,
    Object? firstPageUrl = null,
    Object? from = freezed,
    Object? lastPage = null,
    Object? lastPageUrl = null,
    Object? links = null,
    Object? nextPageUrl = freezed,
    Object? path = null,
    Object? perPage = null,
    Object? prevPageUrl = freezed,
    Object? to = freezed,
    Object? total = null,
  }) {
    return _then(_value.copyWith(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Datum>,
      firstPageUrl: null == firstPageUrl
          ? _value.firstPageUrl
          : firstPageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as int?,
      lastPage: null == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
      lastPageUrl: null == lastPageUrl
          ? _value.lastPageUrl
          : lastPageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      links: null == links
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as List<Link>,
      nextPageUrl: freezed == nextPageUrl
          ? _value.nextPageUrl
          : nextPageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      perPage: null == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int,
      prevPageUrl: freezed == prevPageUrl
          ? _value.prevPageUrl
          : prevPageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as int?,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ItemsImplCopyWith<$Res> implements $ItemsCopyWith<$Res> {
  factory _$$ItemsImplCopyWith(
          _$ItemsImpl value, $Res Function(_$ItemsImpl) then) =
      __$$ItemsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'current_page') int currentPage,
      @JsonKey(name: 'data') List<Datum> data,
      @JsonKey(name: 'first_page_url') String firstPageUrl,
      @JsonKey(name: 'from') int? from,
      @JsonKey(name: 'last_page') int lastPage,
      @JsonKey(name: 'last_page_url') String lastPageUrl,
      @JsonKey(name: 'links') List<Link> links,
      @JsonKey(name: 'next_page_url') String? nextPageUrl,
      @JsonKey(name: 'path') String path,
      @JsonKey(name: 'per_page') int perPage,
      @JsonKey(name: 'prev_page_url') String? prevPageUrl,
      @JsonKey(name: 'to') int? to,
      @JsonKey(name: 'total') int total});
}

/// @nodoc
class __$$ItemsImplCopyWithImpl<$Res>
    extends _$ItemsCopyWithImpl<$Res, _$ItemsImpl>
    implements _$$ItemsImplCopyWith<$Res> {
  __$$ItemsImplCopyWithImpl(
      _$ItemsImpl _value, $Res Function(_$ItemsImpl) _then)
      : super(_value, _then);

  /// Create a copy of Items
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPage = null,
    Object? data = null,
    Object? firstPageUrl = null,
    Object? from = freezed,
    Object? lastPage = null,
    Object? lastPageUrl = null,
    Object? links = null,
    Object? nextPageUrl = freezed,
    Object? path = null,
    Object? perPage = null,
    Object? prevPageUrl = freezed,
    Object? to = freezed,
    Object? total = null,
  }) {
    return _then(_$ItemsImpl(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Datum>,
      firstPageUrl: null == firstPageUrl
          ? _value.firstPageUrl
          : firstPageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as int?,
      lastPage: null == lastPage
          ? _value.lastPage
          : lastPage // ignore: cast_nullable_to_non_nullable
              as int,
      lastPageUrl: null == lastPageUrl
          ? _value.lastPageUrl
          : lastPageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      links: null == links
          ? _value._links
          : links // ignore: cast_nullable_to_non_nullable
              as List<Link>,
      nextPageUrl: freezed == nextPageUrl
          ? _value.nextPageUrl
          : nextPageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      perPage: null == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int,
      prevPageUrl: freezed == prevPageUrl
          ? _value.prevPageUrl
          : prevPageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as int?,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItemsImpl implements _Items {
  const _$ItemsImpl(
      {@JsonKey(name: 'current_page') required this.currentPage,
      @JsonKey(name: 'data') required final List<Datum> data,
      @JsonKey(name: 'first_page_url') required this.firstPageUrl,
      @JsonKey(name: 'from') required this.from,
      @JsonKey(name: 'last_page') required this.lastPage,
      @JsonKey(name: 'last_page_url') required this.lastPageUrl,
      @JsonKey(name: 'links') required final List<Link> links,
      @JsonKey(name: 'next_page_url') required this.nextPageUrl,
      @JsonKey(name: 'path') required this.path,
      @JsonKey(name: 'per_page') required this.perPage,
      @JsonKey(name: 'prev_page_url') required this.prevPageUrl,
      @JsonKey(name: 'to') required this.to,
      @JsonKey(name: 'total') required this.total})
      : _data = data,
        _links = links;

  factory _$ItemsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItemsImplFromJson(json);

  @override
  @JsonKey(name: 'current_page')
  final int currentPage;
  final List<Datum> _data;
  @override
  @JsonKey(name: 'data')
  List<Datum> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  @JsonKey(name: 'first_page_url')
  final String firstPageUrl;
  @override
  @JsonKey(name: 'from')
  final int? from;
  @override
  @JsonKey(name: 'last_page')
  final int lastPage;
  @override
  @JsonKey(name: 'last_page_url')
  final String lastPageUrl;
  final List<Link> _links;
  @override
  @JsonKey(name: 'links')
  List<Link> get links {
    if (_links is EqualUnmodifiableListView) return _links;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_links);
  }

  @override
  @JsonKey(name: 'next_page_url')
  final String? nextPageUrl;
  @override
  @JsonKey(name: 'path')
  final String path;
  @override
  @JsonKey(name: 'per_page')
  final int perPage;
  @override
  @JsonKey(name: 'prev_page_url')
  final String? prevPageUrl;
  @override
  @JsonKey(name: 'to')
  final int? to;
  @override
  @JsonKey(name: 'total')
  final int total;

  @override
  String toString() {
    return 'Items(currentPage: $currentPage, data: $data, firstPageUrl: $firstPageUrl, from: $from, lastPage: $lastPage, lastPageUrl: $lastPageUrl, links: $links, nextPageUrl: $nextPageUrl, path: $path, perPage: $perPage, prevPageUrl: $prevPageUrl, to: $to, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItemsImpl &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.firstPageUrl, firstPageUrl) ||
                other.firstPageUrl == firstPageUrl) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.lastPage, lastPage) ||
                other.lastPage == lastPage) &&
            (identical(other.lastPageUrl, lastPageUrl) ||
                other.lastPageUrl == lastPageUrl) &&
            const DeepCollectionEquality().equals(other._links, _links) &&
            (identical(other.nextPageUrl, nextPageUrl) ||
                other.nextPageUrl == nextPageUrl) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            (identical(other.prevPageUrl, prevPageUrl) ||
                other.prevPageUrl == prevPageUrl) &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      currentPage,
      const DeepCollectionEquality().hash(_data),
      firstPageUrl,
      from,
      lastPage,
      lastPageUrl,
      const DeepCollectionEquality().hash(_links),
      nextPageUrl,
      path,
      perPage,
      prevPageUrl,
      to,
      total);

  /// Create a copy of Items
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ItemsImplCopyWith<_$ItemsImpl> get copyWith =>
      __$$ItemsImplCopyWithImpl<_$ItemsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItemsImplToJson(
      this,
    );
  }
}

abstract class _Items implements Items {
  const factory _Items(
      {@JsonKey(name: 'current_page') required final int currentPage,
      @JsonKey(name: 'data') required final List<Datum> data,
      @JsonKey(name: 'first_page_url') required final String firstPageUrl,
      @JsonKey(name: 'from') required final int? from,
      @JsonKey(name: 'last_page') required final int lastPage,
      @JsonKey(name: 'last_page_url') required final String lastPageUrl,
      @JsonKey(name: 'links') required final List<Link> links,
      @JsonKey(name: 'next_page_url') required final String? nextPageUrl,
      @JsonKey(name: 'path') required final String path,
      @JsonKey(name: 'per_page') required final int perPage,
      @JsonKey(name: 'prev_page_url') required final String? prevPageUrl,
      @JsonKey(name: 'to') required final int? to,
      @JsonKey(name: 'total') required final int total}) = _$ItemsImpl;

  factory _Items.fromJson(Map<String, dynamic> json) = _$ItemsImpl.fromJson;

  @override
  @JsonKey(name: 'current_page')
  int get currentPage;
  @override
  @JsonKey(name: 'data')
  List<Datum> get data;
  @override
  @JsonKey(name: 'first_page_url')
  String get firstPageUrl;
  @override
  @JsonKey(name: 'from')
  int? get from;
  @override
  @JsonKey(name: 'last_page')
  int get lastPage;
  @override
  @JsonKey(name: 'last_page_url')
  String get lastPageUrl;
  @override
  @JsonKey(name: 'links')
  List<Link> get links;
  @override
  @JsonKey(name: 'next_page_url')
  String? get nextPageUrl;
  @override
  @JsonKey(name: 'path')
  String get path;
  @override
  @JsonKey(name: 'per_page')
  int get perPage;
  @override
  @JsonKey(name: 'prev_page_url')
  String? get prevPageUrl;
  @override
  @JsonKey(name: 'to')
  int? get to;
  @override
  @JsonKey(name: 'total')
  int get total;

  /// Create a copy of Items
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ItemsImplCopyWith<_$ItemsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Datum _$DatumFromJson(Map<String, dynamic> json) {
  return _Datum.fromJson(json);
}

/// @nodoc
mixin _$Datum {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'item_name')
  String get itemName => throw _privateConstructorUsedError;
  @JsonKey(name: 'item_price')
  int get itemPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'image')
  String get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount_price')
  int get discountPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_name')
  String get categoryName => throw _privateConstructorUsedError;
  @JsonKey(name: 'currency_symbol')
  String get currencySymbol => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_id')
  int get categoryId => throw _privateConstructorUsedError;

  /// Serializes this Datum to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Datum
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DatumCopyWith<Datum> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DatumCopyWith<$Res> {
  factory $DatumCopyWith(Datum value, $Res Function(Datum) then) =
      _$DatumCopyWithImpl<$Res, Datum>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'item_name') String itemName,
      @JsonKey(name: 'item_price') int itemPrice,
      @JsonKey(name: 'image') String image,
      @JsonKey(name: 'discount_price') int discountPrice,
      @JsonKey(name: 'category_name') String categoryName,
      @JsonKey(name: 'currency_symbol') String currencySymbol,
      @JsonKey(name: 'category_id') int categoryId});
}

/// @nodoc
class _$DatumCopyWithImpl<$Res, $Val extends Datum>
    implements $DatumCopyWith<$Res> {
  _$DatumCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Datum
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? itemName = null,
    Object? itemPrice = null,
    Object? image = null,
    Object? discountPrice = null,
    Object? categoryName = null,
    Object? currencySymbol = null,
    Object? categoryId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      itemName: null == itemName
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String,
      itemPrice: null == itemPrice
          ? _value.itemPrice
          : itemPrice // ignore: cast_nullable_to_non_nullable
              as int,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      discountPrice: null == discountPrice
          ? _value.discountPrice
          : discountPrice // ignore: cast_nullable_to_non_nullable
              as int,
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      currencySymbol: null == currencySymbol
          ? _value.currencySymbol
          : currencySymbol // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DatumImplCopyWith<$Res> implements $DatumCopyWith<$Res> {
  factory _$$DatumImplCopyWith(
          _$DatumImpl value, $Res Function(_$DatumImpl) then) =
      __$$DatumImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'item_name') String itemName,
      @JsonKey(name: 'item_price') int itemPrice,
      @JsonKey(name: 'image') String image,
      @JsonKey(name: 'discount_price') int discountPrice,
      @JsonKey(name: 'category_name') String categoryName,
      @JsonKey(name: 'currency_symbol') String currencySymbol,
      @JsonKey(name: 'category_id') int categoryId});
}

/// @nodoc
class __$$DatumImplCopyWithImpl<$Res>
    extends _$DatumCopyWithImpl<$Res, _$DatumImpl>
    implements _$$DatumImplCopyWith<$Res> {
  __$$DatumImplCopyWithImpl(
      _$DatumImpl _value, $Res Function(_$DatumImpl) _then)
      : super(_value, _then);

  /// Create a copy of Datum
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? itemName = null,
    Object? itemPrice = null,
    Object? image = null,
    Object? discountPrice = null,
    Object? categoryName = null,
    Object? currencySymbol = null,
    Object? categoryId = null,
  }) {
    return _then(_$DatumImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      itemName: null == itemName
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String,
      itemPrice: null == itemPrice
          ? _value.itemPrice
          : itemPrice // ignore: cast_nullable_to_non_nullable
              as int,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      discountPrice: null == discountPrice
          ? _value.discountPrice
          : discountPrice // ignore: cast_nullable_to_non_nullable
              as int,
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      currencySymbol: null == currencySymbol
          ? _value.currencySymbol
          : currencySymbol // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DatumImpl implements _Datum {
  const _$DatumImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'item_name') required this.itemName,
      @JsonKey(name: 'item_price') required this.itemPrice,
      @JsonKey(name: 'image') required this.image,
      @JsonKey(name: 'discount_price') required this.discountPrice,
      @JsonKey(name: 'category_name') required this.categoryName,
      @JsonKey(name: 'currency_symbol') required this.currencySymbol,
      @JsonKey(name: 'category_id') required this.categoryId});

  factory _$DatumImpl.fromJson(Map<String, dynamic> json) =>
      _$$DatumImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'item_name')
  final String itemName;
  @override
  @JsonKey(name: 'item_price')
  final int itemPrice;
  @override
  @JsonKey(name: 'image')
  final String image;
  @override
  @JsonKey(name: 'discount_price')
  final int discountPrice;
  @override
  @JsonKey(name: 'category_name')
  final String categoryName;
  @override
  @JsonKey(name: 'currency_symbol')
  final String currencySymbol;
  @override
  @JsonKey(name: 'category_id')
  final int categoryId;

  @override
  String toString() {
    return 'Datum(id: $id, itemName: $itemName, itemPrice: $itemPrice, image: $image, discountPrice: $discountPrice, categoryName: $categoryName, currencySymbol: $currencySymbol, categoryId: $categoryId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DatumImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.itemName, itemName) ||
                other.itemName == itemName) &&
            (identical(other.itemPrice, itemPrice) ||
                other.itemPrice == itemPrice) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.discountPrice, discountPrice) ||
                other.discountPrice == discountPrice) &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.currencySymbol, currencySymbol) ||
                other.currencySymbol == currencySymbol) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, itemName, itemPrice, image,
      discountPrice, categoryName, currencySymbol, categoryId);

  /// Create a copy of Datum
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DatumImplCopyWith<_$DatumImpl> get copyWith =>
      __$$DatumImplCopyWithImpl<_$DatumImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DatumImplToJson(
      this,
    );
  }
}

abstract class _Datum implements Datum {
  const factory _Datum(
      {@JsonKey(name: 'id') required final int id,
      @JsonKey(name: 'item_name') required final String itemName,
      @JsonKey(name: 'item_price') required final int itemPrice,
      @JsonKey(name: 'image') required final String image,
      @JsonKey(name: 'discount_price') required final int discountPrice,
      @JsonKey(name: 'category_name') required final String categoryName,
      @JsonKey(name: 'currency_symbol') required final String currencySymbol,
      @JsonKey(name: 'category_id')
      required final int categoryId}) = _$DatumImpl;

  factory _Datum.fromJson(Map<String, dynamic> json) = _$DatumImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'item_name')
  String get itemName;
  @override
  @JsonKey(name: 'item_price')
  int get itemPrice;
  @override
  @JsonKey(name: 'image')
  String get image;
  @override
  @JsonKey(name: 'discount_price')
  int get discountPrice;
  @override
  @JsonKey(name: 'category_name')
  String get categoryName;
  @override
  @JsonKey(name: 'currency_symbol')
  String get currencySymbol;
  @override
  @JsonKey(name: 'category_id')
  int get categoryId;

  /// Create a copy of Datum
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DatumImplCopyWith<_$DatumImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Link _$LinkFromJson(Map<String, dynamic> json) {
  return _Link.fromJson(json);
}

/// @nodoc
mixin _$Link {
  @JsonKey(name: 'url')
  String? get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'label')
  String get label => throw _privateConstructorUsedError;
  @JsonKey(name: 'active')
  bool get active => throw _privateConstructorUsedError;

  /// Serializes this Link to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Link
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LinkCopyWith<Link> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LinkCopyWith<$Res> {
  factory $LinkCopyWith(Link value, $Res Function(Link) then) =
      _$LinkCopyWithImpl<$Res, Link>;
  @useResult
  $Res call(
      {@JsonKey(name: 'url') String? url,
      @JsonKey(name: 'label') String label,
      @JsonKey(name: 'active') bool active});
}

/// @nodoc
class _$LinkCopyWithImpl<$Res, $Val extends Link>
    implements $LinkCopyWith<$Res> {
  _$LinkCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Link
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? label = null,
    Object? active = null,
  }) {
    return _then(_value.copyWith(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LinkImplCopyWith<$Res> implements $LinkCopyWith<$Res> {
  factory _$$LinkImplCopyWith(
          _$LinkImpl value, $Res Function(_$LinkImpl) then) =
      __$$LinkImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'url') String? url,
      @JsonKey(name: 'label') String label,
      @JsonKey(name: 'active') bool active});
}

/// @nodoc
class __$$LinkImplCopyWithImpl<$Res>
    extends _$LinkCopyWithImpl<$Res, _$LinkImpl>
    implements _$$LinkImplCopyWith<$Res> {
  __$$LinkImplCopyWithImpl(_$LinkImpl _value, $Res Function(_$LinkImpl) _then)
      : super(_value, _then);

  /// Create a copy of Link
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
    Object? label = null,
    Object? active = null,
  }) {
    return _then(_$LinkImpl(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      label: null == label
          ? _value.label
          : label // ignore: cast_nullable_to_non_nullable
              as String,
      active: null == active
          ? _value.active
          : active // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LinkImpl implements _Link {
  const _$LinkImpl(
      {@JsonKey(name: 'url') required this.url,
      @JsonKey(name: 'label') required this.label,
      @JsonKey(name: 'active') required this.active});

  factory _$LinkImpl.fromJson(Map<String, dynamic> json) =>
      _$$LinkImplFromJson(json);

  @override
  @JsonKey(name: 'url')
  final String? url;
  @override
  @JsonKey(name: 'label')
  final String label;
  @override
  @JsonKey(name: 'active')
  final bool active;

  @override
  String toString() {
    return 'Link(url: $url, label: $label, active: $active)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LinkImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.active, active) || other.active == active));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, url, label, active);

  /// Create a copy of Link
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LinkImplCopyWith<_$LinkImpl> get copyWith =>
      __$$LinkImplCopyWithImpl<_$LinkImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LinkImplToJson(
      this,
    );
  }
}

abstract class _Link implements Link {
  const factory _Link(
      {@JsonKey(name: 'url') required final String? url,
      @JsonKey(name: 'label') required final String label,
      @JsonKey(name: 'active') required final bool active}) = _$LinkImpl;

  factory _Link.fromJson(Map<String, dynamic> json) = _$LinkImpl.fromJson;

  @override
  @JsonKey(name: 'url')
  String? get url;
  @override
  @JsonKey(name: 'label')
  String get label;
  @override
  @JsonKey(name: 'active')
  bool get active;

  /// Create a copy of Link
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LinkImplCopyWith<_$LinkImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
