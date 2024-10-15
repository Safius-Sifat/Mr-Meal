// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

History _$HistoryFromJson(Map<String, dynamic> json) {
  return _History.fromJson(json);
}

/// @nodoc
mixin _$History {
  @JsonKey(name: 'current_page')
  int get currentPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'data')
  List<HistoryData> get data => throw _privateConstructorUsedError;
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

  /// Serializes this History to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of History
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HistoryCopyWith<History> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryCopyWith<$Res> {
  factory $HistoryCopyWith(History value, $Res Function(History) then) =
      _$HistoryCopyWithImpl<$Res, History>;
  @useResult
  $Res call(
      {@JsonKey(name: 'current_page') int currentPage,
      @JsonKey(name: 'data') List<HistoryData> data,
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
class _$HistoryCopyWithImpl<$Res, $Val extends History>
    implements $HistoryCopyWith<$Res> {
  _$HistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of History
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
              as List<HistoryData>,
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
abstract class _$$HistoryImplCopyWith<$Res> implements $HistoryCopyWith<$Res> {
  factory _$$HistoryImplCopyWith(
          _$HistoryImpl value, $Res Function(_$HistoryImpl) then) =
      __$$HistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'current_page') int currentPage,
      @JsonKey(name: 'data') List<HistoryData> data,
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
class __$$HistoryImplCopyWithImpl<$Res>
    extends _$HistoryCopyWithImpl<$Res, _$HistoryImpl>
    implements _$$HistoryImplCopyWith<$Res> {
  __$$HistoryImplCopyWithImpl(
      _$HistoryImpl _value, $Res Function(_$HistoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of History
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
    return _then(_$HistoryImpl(
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<HistoryData>,
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
class _$HistoryImpl implements _History {
  const _$HistoryImpl(
      {@JsonKey(name: 'current_page') required this.currentPage,
      @JsonKey(name: 'data') required final List<HistoryData> data,
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

  factory _$HistoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$HistoryImplFromJson(json);

  @override
  @JsonKey(name: 'current_page')
  final int currentPage;
  final List<HistoryData> _data;
  @override
  @JsonKey(name: 'data')
  List<HistoryData> get data {
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
    return 'History(currentPage: $currentPage, data: $data, firstPageUrl: $firstPageUrl, from: $from, lastPage: $lastPage, lastPageUrl: $lastPageUrl, links: $links, nextPageUrl: $nextPageUrl, path: $path, perPage: $perPage, prevPageUrl: $prevPageUrl, to: $to, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HistoryImpl &&
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

  /// Create a copy of History
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HistoryImplCopyWith<_$HistoryImpl> get copyWith =>
      __$$HistoryImplCopyWithImpl<_$HistoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HistoryImplToJson(
      this,
    );
  }
}

abstract class _History implements History {
  const factory _History(
      {@JsonKey(name: 'current_page') required final int currentPage,
      @JsonKey(name: 'data') required final List<HistoryData> data,
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
      @JsonKey(name: 'total') required final int total}) = _$HistoryImpl;

  factory _History.fromJson(Map<String, dynamic> json) = _$HistoryImpl.fromJson;

  @override
  @JsonKey(name: 'current_page')
  int get currentPage;
  @override
  @JsonKey(name: 'data')
  List<HistoryData> get data;
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

  /// Create a copy of History
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HistoryImplCopyWith<_$HistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

HistoryData _$HistoryDataFromJson(Map<String, dynamic> json) {
  return _HistoryData.fromJson(json);
}

/// @nodoc
mixin _$HistoryData {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_id')
  int get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'item_id')
  String? get itemId => throw _privateConstructorUsedError;
  @JsonKey(name: 'package_id')
  String? get packageId => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_price')
  int get totalPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'txn_id')
  String get txnId => throw _privateConstructorUsedError;
  @JsonKey(name: 'discount')
  int get discount => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  String get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'invoice_id')
  String? get invoiceId => throw _privateConstructorUsedError;
  @JsonKey(name: 'address')
  String? get address => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'name')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'email')
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'phone')
  String get phone => throw _privateConstructorUsedError;

  /// Serializes this HistoryData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HistoryData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HistoryDataCopyWith<HistoryData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryDataCopyWith<$Res> {
  factory $HistoryDataCopyWith(
          HistoryData value, $Res Function(HistoryData) then) =
      _$HistoryDataCopyWithImpl<$Res, HistoryData>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'item_id') String? itemId,
      @JsonKey(name: 'package_id') String? packageId,
      @JsonKey(name: 'total_price') int totalPrice,
      @JsonKey(name: 'status') String status,
      @JsonKey(name: 'txn_id') String txnId,
      @JsonKey(name: 'discount') int discount,
      @JsonKey(name: 'type') String type,
      @JsonKey(name: 'invoice_id') String? invoiceId,
      @JsonKey(name: 'address') String? address,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'email') String email,
      @JsonKey(name: 'phone') String phone});
}

/// @nodoc
class _$HistoryDataCopyWithImpl<$Res, $Val extends HistoryData>
    implements $HistoryDataCopyWith<$Res> {
  _$HistoryDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HistoryData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? itemId = freezed,
    Object? packageId = freezed,
    Object? totalPrice = null,
    Object? status = null,
    Object? txnId = null,
    Object? discount = null,
    Object? type = null,
    Object? invoiceId = freezed,
    Object? address = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? name = null,
    Object? email = null,
    Object? phone = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      itemId: freezed == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String?,
      packageId: freezed == packageId
          ? _value.packageId
          : packageId // ignore: cast_nullable_to_non_nullable
              as String?,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      txnId: null == txnId
          ? _value.txnId
          : txnId // ignore: cast_nullable_to_non_nullable
              as String,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      invoiceId: freezed == invoiceId
          ? _value.invoiceId
          : invoiceId // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HistoryDataImplCopyWith<$Res>
    implements $HistoryDataCopyWith<$Res> {
  factory _$$HistoryDataImplCopyWith(
          _$HistoryDataImpl value, $Res Function(_$HistoryDataImpl) then) =
      __$$HistoryDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'user_id') int userId,
      @JsonKey(name: 'item_id') String? itemId,
      @JsonKey(name: 'package_id') String? packageId,
      @JsonKey(name: 'total_price') int totalPrice,
      @JsonKey(name: 'status') String status,
      @JsonKey(name: 'txn_id') String txnId,
      @JsonKey(name: 'discount') int discount,
      @JsonKey(name: 'type') String type,
      @JsonKey(name: 'invoice_id') String? invoiceId,
      @JsonKey(name: 'address') String? address,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt,
      @JsonKey(name: 'name') String name,
      @JsonKey(name: 'email') String email,
      @JsonKey(name: 'phone') String phone});
}

/// @nodoc
class __$$HistoryDataImplCopyWithImpl<$Res>
    extends _$HistoryDataCopyWithImpl<$Res, _$HistoryDataImpl>
    implements _$$HistoryDataImplCopyWith<$Res> {
  __$$HistoryDataImplCopyWithImpl(
      _$HistoryDataImpl _value, $Res Function(_$HistoryDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of HistoryData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? itemId = freezed,
    Object? packageId = freezed,
    Object? totalPrice = null,
    Object? status = null,
    Object? txnId = null,
    Object? discount = null,
    Object? type = null,
    Object? invoiceId = freezed,
    Object? address = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? name = null,
    Object? email = null,
    Object? phone = null,
  }) {
    return _then(_$HistoryDataImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as int,
      itemId: freezed == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String?,
      packageId: freezed == packageId
          ? _value.packageId
          : packageId // ignore: cast_nullable_to_non_nullable
              as String?,
      totalPrice: null == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      txnId: null == txnId
          ? _value.txnId
          : txnId // ignore: cast_nullable_to_non_nullable
              as String,
      discount: null == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      invoiceId: freezed == invoiceId
          ? _value.invoiceId
          : invoiceId // ignore: cast_nullable_to_non_nullable
              as String?,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HistoryDataImpl implements _HistoryData {
  const _$HistoryDataImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'item_id') required this.itemId,
      @JsonKey(name: 'package_id') required this.packageId,
      @JsonKey(name: 'total_price') required this.totalPrice,
      @JsonKey(name: 'status') required this.status,
      @JsonKey(name: 'txn_id') required this.txnId,
      @JsonKey(name: 'discount') required this.discount,
      @JsonKey(name: 'type') required this.type,
      @JsonKey(name: 'invoice_id') required this.invoiceId,
      @JsonKey(name: 'address') required this.address,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt,
      @JsonKey(name: 'name') required this.name,
      @JsonKey(name: 'email') required this.email,
      @JsonKey(name: 'phone') required this.phone});

  factory _$HistoryDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$HistoryDataImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'user_id')
  final int userId;
  @override
  @JsonKey(name: 'item_id')
  final String? itemId;
  @override
  @JsonKey(name: 'package_id')
  final String? packageId;
  @override
  @JsonKey(name: 'total_price')
  final int totalPrice;
  @override
  @JsonKey(name: 'status')
  final String status;
  @override
  @JsonKey(name: 'txn_id')
  final String txnId;
  @override
  @JsonKey(name: 'discount')
  final int discount;
  @override
  @JsonKey(name: 'type')
  final String type;
  @override
  @JsonKey(name: 'invoice_id')
  final String? invoiceId;
  @override
  @JsonKey(name: 'address')
  final String? address;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;
  @override
  @JsonKey(name: 'name')
  final String name;
  @override
  @JsonKey(name: 'email')
  final String email;
  @override
  @JsonKey(name: 'phone')
  final String phone;

  @override
  String toString() {
    return 'HistoryData(id: $id, userId: $userId, itemId: $itemId, packageId: $packageId, totalPrice: $totalPrice, status: $status, txnId: $txnId, discount: $discount, type: $type, invoiceId: $invoiceId, address: $address, createdAt: $createdAt, updatedAt: $updatedAt, name: $name, email: $email, phone: $phone)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HistoryDataImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.packageId, packageId) ||
                other.packageId == packageId) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.txnId, txnId) || other.txnId == txnId) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.invoiceId, invoiceId) ||
                other.invoiceId == invoiceId) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      itemId,
      packageId,
      totalPrice,
      status,
      txnId,
      discount,
      type,
      invoiceId,
      address,
      createdAt,
      updatedAt,
      name,
      email,
      phone);

  /// Create a copy of HistoryData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HistoryDataImplCopyWith<_$HistoryDataImpl> get copyWith =>
      __$$HistoryDataImplCopyWithImpl<_$HistoryDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HistoryDataImplToJson(
      this,
    );
  }
}

abstract class _HistoryData implements HistoryData {
  const factory _HistoryData(
      {@JsonKey(name: 'id') required final int id,
      @JsonKey(name: 'user_id') required final int userId,
      @JsonKey(name: 'item_id') required final String? itemId,
      @JsonKey(name: 'package_id') required final String? packageId,
      @JsonKey(name: 'total_price') required final int totalPrice,
      @JsonKey(name: 'status') required final String status,
      @JsonKey(name: 'txn_id') required final String txnId,
      @JsonKey(name: 'discount') required final int discount,
      @JsonKey(name: 'type') required final String type,
      @JsonKey(name: 'invoice_id') required final String? invoiceId,
      @JsonKey(name: 'address') required final String? address,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      @JsonKey(name: 'updated_at') required final DateTime updatedAt,
      @JsonKey(name: 'name') required final String name,
      @JsonKey(name: 'email') required final String email,
      @JsonKey(name: 'phone') required final String phone}) = _$HistoryDataImpl;

  factory _HistoryData.fromJson(Map<String, dynamic> json) =
      _$HistoryDataImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'user_id')
  int get userId;
  @override
  @JsonKey(name: 'item_id')
  String? get itemId;
  @override
  @JsonKey(name: 'package_id')
  String? get packageId;
  @override
  @JsonKey(name: 'total_price')
  int get totalPrice;
  @override
  @JsonKey(name: 'status')
  String get status;
  @override
  @JsonKey(name: 'txn_id')
  String get txnId;
  @override
  @JsonKey(name: 'discount')
  int get discount;
  @override
  @JsonKey(name: 'type')
  String get type;
  @override
  @JsonKey(name: 'invoice_id')
  String? get invoiceId;
  @override
  @JsonKey(name: 'address')
  String? get address;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;
  @override
  @JsonKey(name: 'name')
  String get name;
  @override
  @JsonKey(name: 'email')
  String get email;
  @override
  @JsonKey(name: 'phone')
  String get phone;

  /// Create a copy of HistoryData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HistoryDataImplCopyWith<_$HistoryDataImpl> get copyWith =>
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
