import 'dart:async';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../exception/app_exception.dart';
import '../../../authentication/data/auth_repository.dart';
import '../../data/remote/remote_cart_repository.dart';
import '../../domain/cart.dart';
import '../../domain/online_cart.dart';
part 'remote_cart_controller.g.dart';

@riverpod
class RemoteCartController extends _$RemoteCartController {
  @override
  FutureOr<RemoteCart> build() {
    return fetchRemoteCart();
  }

  Future<RemoteCart> fetchRemoteCart() {
    final user = ref.read(authRepositoryProvider).currentUser;
    if (user == null) {
      throw UserNotAuthenticated();
    }
    final repo = ref.watch(remoteCartRepositoryProvider);
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
          timer = Timer(const Duration(seconds: 60), link.close);
        });
        ref.onResume(() {
          timer?.cancel();
        });
      }
    });
    return repo.fetchCart(token: user.token);
  }

  // Future<void> removeItemById(ProductID productId) async {
  //   final user = ref.read(authRepositoryProvider).currentUser;
  //   if (user == null) {
  //     throw UserNotAuthenticated();
  //   }
  //   await ref.read(remoteCartRepositoryProvider).removeCartItem(
  //         token: user.token,
  //         id: productId,
  //       );
  //   state = await AsyncValue.guard(fetchRemoteCart);
  // }
  //
  // Future<void> addItemToCart(ProductID productId, String type) async {
  //   final user = ref.read(authRepositoryProvider).currentUser;
  //   if (user == null) {
  //     throw UserNotAuthenticated();
  //   }
  //   await ref.read(remoteCartRepositoryProvider).addItemToCart(
  //         token: user.token,
  //         id: productId,
  //         type: type,
  //       );
  //   state = await AsyncValue.guard(fetchRemoteCart);
  // }
}
