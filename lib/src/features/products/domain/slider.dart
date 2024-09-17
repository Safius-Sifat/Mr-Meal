import 'package:freezed_annotation/freezed_annotation.dart';

part 'slider.freezed.dart';
part 'slider.g.dart';

@freezed
class SliderModel with _$SliderModel {
  const factory SliderModel({
    required int id,
    @JsonKey(name: 'page_name') required String pageName,
    @JsonKey(name: 'slider_text') required String? sliderText,
    required String image,
    required int status,
    @JsonKey(name: 'is_deleted') required int isDeleted,
    @JsonKey(name: 'updated_at') required String updatedAt,
    @JsonKey(name: 'created_at') required String createdAt,
  }) = _SliderModel;
  factory SliderModel.fromJson(Map<String, dynamic> json) =>
      _$SliderModelFromJson(json);
}
