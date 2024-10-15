// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'package_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PackageCategory _$PackageCategoryFromJson(Map<String, dynamic> json) {
  return _PackageCategory.fromJson(json);
}

/// @nodoc
mixin _$PackageCategory {
  @JsonKey(name: 'category_name')
  String get categoryName => throw _privateConstructorUsedError;
  @JsonKey(name: 'category_icon')
  String get categoryIcon => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_time')
  String get startTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_time')
  String get endTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;

  /// Serializes this PackageCategory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PackageCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PackageCategoryCopyWith<PackageCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PackageCategoryCopyWith<$Res> {
  factory $PackageCategoryCopyWith(
          PackageCategory value, $Res Function(PackageCategory) then) =
      _$PackageCategoryCopyWithImpl<$Res, PackageCategory>;
  @useResult
  $Res call(
      {@JsonKey(name: 'category_name') String categoryName,
      @JsonKey(name: 'category_icon') String categoryIcon,
      @JsonKey(name: 'start_time') String startTime,
      @JsonKey(name: 'end_time') String endTime,
      @JsonKey(name: 'id') int id});
}

/// @nodoc
class _$PackageCategoryCopyWithImpl<$Res, $Val extends PackageCategory>
    implements $PackageCategoryCopyWith<$Res> {
  _$PackageCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PackageCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryName = null,
    Object? categoryIcon = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      categoryIcon: null == categoryIcon
          ? _value.categoryIcon
          : categoryIcon // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PackageCategoryImplCopyWith<$Res>
    implements $PackageCategoryCopyWith<$Res> {
  factory _$$PackageCategoryImplCopyWith(_$PackageCategoryImpl value,
          $Res Function(_$PackageCategoryImpl) then) =
      __$$PackageCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'category_name') String categoryName,
      @JsonKey(name: 'category_icon') String categoryIcon,
      @JsonKey(name: 'start_time') String startTime,
      @JsonKey(name: 'end_time') String endTime,
      @JsonKey(name: 'id') int id});
}

/// @nodoc
class __$$PackageCategoryImplCopyWithImpl<$Res>
    extends _$PackageCategoryCopyWithImpl<$Res, _$PackageCategoryImpl>
    implements _$$PackageCategoryImplCopyWith<$Res> {
  __$$PackageCategoryImplCopyWithImpl(
      _$PackageCategoryImpl _value, $Res Function(_$PackageCategoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of PackageCategory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryName = null,
    Object? categoryIcon = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? id = null,
  }) {
    return _then(_$PackageCategoryImpl(
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      categoryIcon: null == categoryIcon
          ? _value.categoryIcon
          : categoryIcon // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as String,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PackageCategoryImpl implements _PackageCategory {
  const _$PackageCategoryImpl(
      {@JsonKey(name: 'category_name') required this.categoryName,
      @JsonKey(name: 'category_icon') required this.categoryIcon,
      @JsonKey(name: 'start_time') required this.startTime,
      @JsonKey(name: 'end_time') required this.endTime,
      @JsonKey(name: 'id') required this.id});

  factory _$PackageCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$PackageCategoryImplFromJson(json);

  @override
  @JsonKey(name: 'category_name')
  final String categoryName;
  @override
  @JsonKey(name: 'category_icon')
  final String categoryIcon;
  @override
  @JsonKey(name: 'start_time')
  final String startTime;
  @override
  @JsonKey(name: 'end_time')
  final String endTime;
  @override
  @JsonKey(name: 'id')
  final int id;

  @override
  String toString() {
    return 'PackageCategory(categoryName: $categoryName, categoryIcon: $categoryIcon, startTime: $startTime, endTime: $endTime, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PackageCategoryImpl &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.categoryIcon, categoryIcon) ||
                other.categoryIcon == categoryIcon) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, categoryName, categoryIcon, startTime, endTime, id);

  /// Create a copy of PackageCategory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PackageCategoryImplCopyWith<_$PackageCategoryImpl> get copyWith =>
      __$$PackageCategoryImplCopyWithImpl<_$PackageCategoryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PackageCategoryImplToJson(
      this,
    );
  }
}

abstract class _PackageCategory implements PackageCategory {
  const factory _PackageCategory(
      {@JsonKey(name: 'category_name') required final String categoryName,
      @JsonKey(name: 'category_icon') required final String categoryIcon,
      @JsonKey(name: 'start_time') required final String startTime,
      @JsonKey(name: 'end_time') required final String endTime,
      @JsonKey(name: 'id') required final int id}) = _$PackageCategoryImpl;

  factory _PackageCategory.fromJson(Map<String, dynamic> json) =
      _$PackageCategoryImpl.fromJson;

  @override
  @JsonKey(name: 'category_name')
  String get categoryName;
  @override
  @JsonKey(name: 'category_icon')
  String get categoryIcon;
  @override
  @JsonKey(name: 'start_time')
  String get startTime;
  @override
  @JsonKey(name: 'end_time')
  String get endTime;
  @override
  @JsonKey(name: 'id')
  int get id;

  /// Create a copy of PackageCategory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PackageCategoryImplCopyWith<_$PackageCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
