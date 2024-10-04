import 'package:freezed_annotation/freezed_annotation.dart';
part 'balance.freezed.dart';
part 'balance.g.dart';

@freezed
class Balance with _$Balance {
  const factory Balance({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'user_id') required int userId,
    @JsonKey(name: 'balance') required int balance,
    @JsonKey(name: 'loan_amount') required int loanAmount,
    @JsonKey(name: 'created_at') required DateTime createdAt,
    @JsonKey(name: 'updated_at') required DateTime updatedAt,
    @JsonKey(name: 'name') required String name,
    @JsonKey(name: 'email') required String email,
  }) = _Balance;

  factory Balance.fromJson(Map<String, dynamic> json) =>
      _$BalanceFromJson(json);
}
