// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todays_meal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TodaysMeal _$TodaysMealFromJson(Map<String, dynamic> json) {
  return _TodaysMeal.fromJson(json);
}

/// @nodoc
mixin _$TodaysMeal {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'item_name')
  String get itemName => throw _privateConstructorUsedError;
  @JsonKey(name: 'long_description')
  String get longDescription => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_deleted')
  int get isDeleted => throw _privateConstructorUsedError;
  @JsonKey(name: 'status')
  int get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this TodaysMeal to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TodaysMeal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TodaysMealCopyWith<TodaysMeal> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodaysMealCopyWith<$Res> {
  factory $TodaysMealCopyWith(
          TodaysMeal value, $Res Function(TodaysMeal) then) =
      _$TodaysMealCopyWithImpl<$Res, TodaysMeal>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'item_name') String itemName,
      @JsonKey(name: 'long_description') String longDescription,
      @JsonKey(name: 'is_deleted') int isDeleted,
      @JsonKey(name: 'status') int status,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});
}

/// @nodoc
class _$TodaysMealCopyWithImpl<$Res, $Val extends TodaysMeal>
    implements $TodaysMealCopyWith<$Res> {
  _$TodaysMealCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TodaysMeal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? itemName = null,
    Object? longDescription = null,
    Object? isDeleted = null,
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      itemName: null == itemName
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String,
      longDescription: null == longDescription
          ? _value.longDescription
          : longDescription // ignore: cast_nullable_to_non_nullable
              as String,
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TodaysMealImplCopyWith<$Res>
    implements $TodaysMealCopyWith<$Res> {
  factory _$$TodaysMealImplCopyWith(
          _$TodaysMealImpl value, $Res Function(_$TodaysMealImpl) then) =
      __$$TodaysMealImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'item_name') String itemName,
      @JsonKey(name: 'long_description') String longDescription,
      @JsonKey(name: 'is_deleted') int isDeleted,
      @JsonKey(name: 'status') int status,
      @JsonKey(name: 'created_at') DateTime createdAt,
      @JsonKey(name: 'updated_at') DateTime updatedAt});
}

/// @nodoc
class __$$TodaysMealImplCopyWithImpl<$Res>
    extends _$TodaysMealCopyWithImpl<$Res, _$TodaysMealImpl>
    implements _$$TodaysMealImplCopyWith<$Res> {
  __$$TodaysMealImplCopyWithImpl(
      _$TodaysMealImpl _value, $Res Function(_$TodaysMealImpl) _then)
      : super(_value, _then);

  /// Create a copy of TodaysMeal
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? itemName = null,
    Object? longDescription = null,
    Object? isDeleted = null,
    Object? status = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$TodaysMealImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      itemName: null == itemName
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String,
      longDescription: null == longDescription
          ? _value.longDescription
          : longDescription // ignore: cast_nullable_to_non_nullable
              as String,
      isDeleted: null == isDeleted
          ? _value.isDeleted
          : isDeleted // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TodaysMealImpl implements _TodaysMeal {
  const _$TodaysMealImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'title') required this.title,
      @JsonKey(name: 'item_name') required this.itemName,
      @JsonKey(name: 'long_description') required this.longDescription,
      @JsonKey(name: 'is_deleted') required this.isDeleted,
      @JsonKey(name: 'status') required this.status,
      @JsonKey(name: 'created_at') required this.createdAt,
      @JsonKey(name: 'updated_at') required this.updatedAt});

  factory _$TodaysMealImpl.fromJson(Map<String, dynamic> json) =>
      _$$TodaysMealImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'title')
  final String title;
  @override
  @JsonKey(name: 'item_name')
  final String itemName;
  @override
  @JsonKey(name: 'long_description')
  final String longDescription;
  @override
  @JsonKey(name: 'is_deleted')
  final int isDeleted;
  @override
  @JsonKey(name: 'status')
  final int status;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime updatedAt;

  @override
  String toString() {
    return 'TodaysMeal(id: $id, title: $title, itemName: $itemName, longDescription: $longDescription, isDeleted: $isDeleted, status: $status, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TodaysMealImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.itemName, itemName) ||
                other.itemName == itemName) &&
            (identical(other.longDescription, longDescription) ||
                other.longDescription == longDescription) &&
            (identical(other.isDeleted, isDeleted) ||
                other.isDeleted == isDeleted) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title, itemName,
      longDescription, isDeleted, status, createdAt, updatedAt);

  /// Create a copy of TodaysMeal
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TodaysMealImplCopyWith<_$TodaysMealImpl> get copyWith =>
      __$$TodaysMealImplCopyWithImpl<_$TodaysMealImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TodaysMealImplToJson(
      this,
    );
  }
}

abstract class _TodaysMeal implements TodaysMeal {
  const factory _TodaysMeal(
      {@JsonKey(name: 'id') required final int id,
      @JsonKey(name: 'title') required final String title,
      @JsonKey(name: 'item_name') required final String itemName,
      @JsonKey(name: 'long_description') required final String longDescription,
      @JsonKey(name: 'is_deleted') required final int isDeleted,
      @JsonKey(name: 'status') required final int status,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      @JsonKey(name: 'updated_at')
      required final DateTime updatedAt}) = _$TodaysMealImpl;

  factory _TodaysMeal.fromJson(Map<String, dynamic> json) =
      _$TodaysMealImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'title')
  String get title;
  @override
  @JsonKey(name: 'item_name')
  String get itemName;
  @override
  @JsonKey(name: 'long_description')
  String get longDescription;
  @override
  @JsonKey(name: 'is_deleted')
  int get isDeleted;
  @override
  @JsonKey(name: 'status')
  int get status;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  @JsonKey(name: 'updated_at')
  DateTime get updatedAt;

  /// Create a copy of TodaysMeal
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TodaysMealImplCopyWith<_$TodaysMealImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
