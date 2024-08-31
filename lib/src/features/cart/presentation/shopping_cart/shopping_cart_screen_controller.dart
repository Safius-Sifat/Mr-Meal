import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../application/cart_service.dart';
import '../../domain/cart_item.dart';

part 'shopping_cart_screen_controller.g.dart';

@riverpod
class ShoppingCartScreenController extends _$ShoppingCartScreenController {
  @override
  FutureOr<void> build() {
    // nothing to do
  }

  CartService get cartService => ref.read(cartServiceProvider);

  Future<void> updateItemQuantity(ProductID productId, int quantity) async {
    state = const AsyncLoading();
    final updated = CartItem(productId: productId, quantity: quantity);
    state = await AsyncValue.guard(() => cartService.setItem(updated));
  }

  Future<void> removeItemById(ProductID productId) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => cartService.removeItemById(productId));
  }
}
