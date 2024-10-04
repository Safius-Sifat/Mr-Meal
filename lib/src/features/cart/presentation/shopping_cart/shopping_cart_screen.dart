import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common_widgets/async_value_widget.dart';
import '../../../../common_widgets/primary_button.dart';
import '../../../../constants/app_sizes.dart';
import '../../../../constants/constants.dart';
import '../../../../l10n/string_hardcoded.dart';
import '../../../../utils/async_value_ui.dart';
import '../../../products/presentation/widgets/notification_widget.dart';
import '../../application/cart_service.dart';
import '../../domain/online_cart.dart';
import 'shopping_cart_item.dart';
import 'shopping_cart_items_builder.dart';
import 'shopping_cart_screen_controller.dart';

/// Shopping cart screen showing the items in the cart (with editable
/// quantities) and a button to checkout.
class ShoppingCartScreen extends ConsumerWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<void>>(
      shoppingCartScreenControllerProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );
    final state = ref.watch(shoppingCartScreenControllerProvider);
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
      body: Consumer(
        builder: (context, ref, child) {
          final cartValue = ref.watch(cartProvider);
          return AsyncValueWidget<RemoteCart>(
            value: cartValue,
            data: (cart) => ShoppingCartItemsBuilder(
              items: cart.carts,
              itemBuilder: (_, item, index) => ShoppingCartItemContents(
                item: item,
                itemIndex: index,
                isEditable: true,
              ),
              ctaBuilder: (_) => PrimaryButton(
                width: 160,
                text: 'Confirm Order'.hardcoded,
                // isLoading: state.isLoading,
                onPressed: () {},
              ),
            ),
          );
        },
      ),
    );
  }
}
