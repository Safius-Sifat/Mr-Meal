import 'package:freezed_annotation/freezed_annotation.dart';

part 'meal_settings.freezed.dart';
part 'meal_settings.g.dart';

@freezed
class MealSetting with _$MealSetting {
  const factory MealSetting({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'meal_name') required String mealName,
    @JsonKey(name: 'start_time') required String startTime,
    @JsonKey(name: 'end_time') required String endTime,
    @JsonKey(name: 'is_deleted') required int isDeleted,
    @JsonKey(name: 'status') required int status,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _MealSetting;

  factory MealSetting.fromJson(Map<String, dynamic> json) =>
      _$MealSettingFromJson(json);
}
