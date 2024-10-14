import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../application/cart_service.dart';
import '../../domain/online_cart.dart';

part 'shopping_cart_screen_controller.g.dart';

@riverpod
class ShoppingCartScreenController extends _$ShoppingCartScreenController {
  @override
  FutureOr<void> build() async {
    // nothing to do
  }

  CartService get cartService => ref.read(cartServiceProvider);

  Future<void> updateItemQuantity(CartModel item) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => cartService.setItem(item));
  }

  Future<bool> removeItemById(CartModel item) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => cartService.removeItemById(item));
    return !state.hasError;
  }
}
