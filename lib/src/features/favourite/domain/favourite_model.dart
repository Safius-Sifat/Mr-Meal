import 'package:freezed_annotation/freezed_annotation.dart';
part 'favourite_model.freezed.dart';
part 'favourite_model.g.dart';

@freezed
class FavouriteModel with _$FavouriteModel {
  const factory FavouriteModel({
    @JsonKey(name: 'status') required int status,
    @JsonKey(name: 'favourites') required List<Favourite> favourites,
  }) = _FavouriteModel;

  factory FavouriteModel.fromJson(Map<String, dynamic> json) =>
      _$FavouriteModelFromJson(json);
}

@freezed
abstract class Favourite with _$Favourite {
  const factory Favourite({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'user_ip') required String userIp,
    @JsonKey(name: 'user_id') required int? userId,
    @JsonKey(name: 'item_id') required int? itemId,
    @JsonKey(name: 'package_id') required int? packageId,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'item_name') required String? itemName,
    @JsonKey(name: 'item_price') required int? itemPrice,
    @JsonKey(name: 'item_discount_price') required int? itemDiscountPrice,
    @JsonKey(name: 'package_name') required String? packageName,
    @JsonKey(name: 'package_price') required int? packagePrice,
    @JsonKey(name: 'package_discount_price') required int? packageDiscountPrice,
    @JsonKey(name: 'item_image') required String itemImage,
    @JsonKey(name: 'package_image') required String packageImage,
  }) = _Favourite;
  const Favourite._();
  factory Favourite.empty() => Favourite(
        id: 0,
        userIp: '',
        userId: 0,
        itemId: 0,
        packageId: 0,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        itemName: '',
        itemPrice: 0,
        itemDiscountPrice: 0,
        packageName: '',
        packagePrice: 0,
        packageDiscountPrice: 0,
        itemImage: '',
        packageImage: '',
      );

  factory Favourite.fromJson(Map<String, dynamic> json) =>
      _$FavouriteFromJson(json);
}
