import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../exception/app_exception.dart';
import '../../authentication/data/auth_repository.dart';
import '../data/wallet_repository.dart';
part 'wallet_controller.g.dart';

@riverpod
class RechargeWallet extends _$RechargeWallet {
  @override
  FutureOr<String?> build() async {
    return null;
  }

  Future<bool> rechargeWallet({required int amount}) async {
    final user = ref.read(authRepositoryProvider).currentUser;
    if (user == null) {
      throw UserNotAuthenticated();
    }
    final repository = ref.read(walletRepositoryProvider);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => repository.rechargeBalance(
          amount: amount,
          token: user.token,
        ));
    return !state.hasError;
  }
}
