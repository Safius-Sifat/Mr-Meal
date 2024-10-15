import 'package:freezed_annotation/freezed_annotation.dart';
part 'package_category.freezed.dart';
part 'package_category.g.dart';

@freezed
class PackageCategory with _$PackageCategory {
  const factory PackageCategory({
    @JsonKey(name: 'category_name') required String categoryName,
    @JsonKey(name: 'category_icon') required String categoryIcon,
    @JsonKey(name: 'start_time') required String startTime,
    @JsonKey(name: 'end_time') required String endTime,
    @JsonKey(name: 'id') required int id,
  }) = _PackageCategory;

  factory PackageCategory.fromJson(Map<String, dynamic> json) =>
      _$PackageCategoryFromJson(json);
}
