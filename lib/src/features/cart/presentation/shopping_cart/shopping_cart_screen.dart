import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common_widgets/primary_button.dart';
import '../../../../constants/app_sizes.dart';
import '../../../../constants/constants.dart';
import '../../../../l10n/string_hardcoded.dart';
import '../../../products/presentation/widgets/notification_widget.dart';
import '../../domain/cart_item.dart';
import 'shopping_cart_item.dart';
import 'shopping_cart_items_builder.dart';

/// Shopping cart screen showing the items in the cart (with editable
/// quantities) and a button to checkout.
class ShoppingCartScreen extends ConsumerWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.listen<AsyncValue<void>>(
    //   shoppingCartScreenControllerProvider,
    //   (_, state) => state.showAlertDialogOnError(context),
    // );
    // final state = ref.watch(shoppingCartScreenControllerProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: Sizes.p16, vertical: Sizes.p8),
          decoration: BoxDecoration(
              color: secondaryColor, borderRadius: BorderRadius.circular(8)),
          child: Text('My Cart'.hardcoded),
        ),
        actions: const [NotificationWidget(), gapW16],
      ),
      body: ShoppingCartItemsBuilder(
        items: [
          CartItem(productId: 1, quantity: 2),
          CartItem(productId: 2, quantity: 1),
        ],
        itemBuilder: (_, item, index) => ShoppingCartItem(
          item: item,
          itemIndex: index,
        ),
        ctaBuilder: (_) => PrimaryButton(
          width: 160,
          text: 'Confirm Order'.hardcoded,
          // isLoading: state.isLoading,
          onPressed: () {},
        ),
      ),

      // body: Consumer(
      //   builder: (context, ref, child) {
      //     final cartValue = ref.watch(cartProvider);
      //     return AsyncValueWidget<Cart>(
      //       value: cartValue,
      //       data: (cart) => ShoppingCartItemsBuilder(
      //         items: cart.toItemsList(),
      //         itemBuilder: (_, item, index) => ShoppingCartItem(
      //           item: item,
      //           itemIndex: index,
      //         ),
      //         ctaBuilder: (_) => PrimaryButton(
      //           text: 'Checkout'.hardcoded,
      //           // isLoading: state.isLoading,
      //           onPressed: () {},
      //         ),
      //       ),
      //     );
      //   },
      // ),
    );
  }
}
