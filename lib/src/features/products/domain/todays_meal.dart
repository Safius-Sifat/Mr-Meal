import 'package:freezed_annotation/freezed_annotation.dart';
part 'todays_meal.freezed.dart';
part 'todays_meal.g.dart';

@freezed
class TodaysMeal with _$TodaysMeal {
  const factory TodaysMeal({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'long_description') required String longDescription,
    @JsonKey(name: 'is_deleted') required int isDeleted,
    @JsonKey(name: 'status') required int status,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
  }) = _TodaysMeal;

  factory TodaysMeal.fromJson(Map<String, dynamic> json) =>
      _$TodaysMealFromJson(json);
}
