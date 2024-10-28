import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../application/cart_service.dart';
import '../../domain/online_cart.dart';

part 'add_to_cart_controller.g.dart';

@riverpod
class AddToCartController extends _$AddToCartController {
  @override
  FutureOr<void> build(int id) {
    // nothing to do
  }

  Future<bool> addItem(CartModel item) async {
    final cartService = ref.read(cartServiceProvider);
    final quantity = ref.read(itemQuantityControllerProvider);
    state = const AsyncLoading<void>();
    state = await AsyncValue.guard(
        () => cartService.addItem(item.copyWith(quantity: quantity)));
    if (!state.hasError) {
      ref.read(itemQuantityControllerProvider.notifier).updateQuantity(1);
    }
    return !state.hasError;
  }
}

@riverpod
class ItemQuantityController extends _$ItemQuantityController {
  @override
  int build() {
    return 1;
  }

  void updateQuantity(int quantity) {
    state = quantity;
  }
}
