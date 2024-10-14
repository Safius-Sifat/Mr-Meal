import 'dart:async';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../constants/api_constants.dart';
import '../../../exception/app_exception.dart';
import '../../../utils/dio_provider.dart';
import '../../authentication/data/auth_repository.dart';
import '../doamin/balance.dart';
part 'wallet_repository.g.dart';

class WalletRepository {
  WalletRepository(this.client);

  final Dio client;

  Future<Balance> fetchBalance(
      {required String token, CancelToken? cancelToken}) async {
    final uri = Uri(
      scheme: 'https',
      host: baseUrl,
      path: balanceUrl,
    );
    final response = await client.getUri(
      uri,
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ),
    );
    return Balance.fromJson(response.data['balance'] as Map<String, dynamic>);
  }

  Future<String> rechargeBalance({
    required String token,
    required int amount,
  }) async {
    final uri = Uri(
      scheme: 'https',
      host: baseUrl,
      path: rechargeUrl,
    );

    final response = await client.postUri(uri,
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
        data: {
          'amount': '$amount',
        });

    return response.data['payment_url'] as String;
  }
}

@riverpod
WalletRepository walletRepository(WalletRepositoryRef ref) {
  final dio = ref.watch(dioProvider);
  return WalletRepository(dio);
}

@riverpod
Future<Balance> fetchBalance(FetchBalanceRef ref) {
  final user = ref.read(authRepositoryProvider).currentUser;
  if (user == null) {
    throw UserNotAuthenticated();
  }
  final repo = ref.watch(walletRepositoryProvider);
  final cancelToken = CancelToken();
  ref.listenSelf((_, st) {
    if (st.hasValue) {
      final link = ref.keepAlive();
      Timer? timer;
      ref.onDispose(() {
        cancelToken.cancel();
        timer?.cancel();
      });
      ref.onCancel(() {
        timer = Timer(const Duration(seconds: 30), link.close);
      });
      ref.onResume(() {
        timer?.cancel();
      });
    }
  });
  return repo.fetchBalance(token: user.token, cancelToken: cancelToken);
}
