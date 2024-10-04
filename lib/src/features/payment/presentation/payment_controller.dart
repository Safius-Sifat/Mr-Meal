import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../exception/app_exception.dart';
import '../../authentication/data/auth_repository.dart';
import '../data/payment_repository.dart';

part 'payment_controller.g.dart';

@riverpod
class PostOrder extends _$PostOrder {
  @override
  FutureOr<String> build() async {
    return '';
  }

  Future<bool> postOrder(
      {required double amount,
      required List<List<dynamic>> items,
      required List<List<dynamic>> packages,
      required double discount,
      required String address}) async {
    final user = ref.read(authRepositoryProvider).currentUser;
    if (user == null) {
      throw UserNotAuthenticated();
    }
    final repository = ref.read(paymentRepositoryProvider);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => repository.postOrder(
        amount: amount,
        token: user.token,
        address: address,
        items: items,
        packages: packages,
        discount: discount));
    return !state.hasError;
  }
}
