import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/online_cart.dart';

part 'local_cart_repository.g.dart';

/// API for reading, watching and writing local cart data (guest user)
abstract class LocalCartRepository {
  Future<RemoteCart> fetchCart();

  Stream<RemoteCart> watchCart();

  Future<void> setCart(RemoteCart cart);
}

@Riverpod(keepAlive: true)
LocalCartRepository localCartRepository(LocalCartRepositoryRef ref) {
  // * Override this in the main method
  throw UnimplementedError();
}
