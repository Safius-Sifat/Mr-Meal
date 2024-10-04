import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common_widgets/item_quantity_selector.dart';
import '../../../../common_widgets/primary_button.dart';
import '../../../../constants/app_sizes.dart';
import '../../../../l10n/string_hardcoded.dart';
import '../../../../utils/async_value_ui.dart';
import '../../../products/domain/item_detail.dart';
import '../../application/cart_service.dart';
import '../../domain/online_cart.dart';
import 'add_to_cart_controller.dart';

/// A widget that shows an [ItemQuantitySelector] along with a [PrimaryButton]
/// to add the selected quantity of the item to the cart.
class AddToCartWidget extends ConsumerWidget {
  const AddToCartWidget({super.key, required this.product});
  final ItemDetail product;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<dynamic>>(
      addToCartControllerProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );
    final availableQuantity = ref.watch(itemAvailableQuantityProvider(product));
    final state = ref.watch(addToCartControllerProvider);
    final quantity = ref.watch(itemQuantityControllerProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Quantity:'.hardcoded),
            ItemQuantitySelector(
              quantity: quantity,
              // let the user choose up to the available quantity or
              // 10 items at most
              maxQuantity: min(availableQuantity, 10),
              onChanged: state.isLoading
                  ? null
                  : (quantity) => ref
                      .read(itemQuantityControllerProvider.notifier)
                      .updateQuantity(quantity),
            ),
          ],
        ),
        gapH8,
        const Divider(
          color: Colors.grey,
        ),
        gapH8,
        PrimaryButton(
          isLoading: state.isLoading,
          // only enable the button if there is enough stock
          onPressed: availableQuantity > 0
              ? () => ref
                  .read(addToCartControllerProvider.notifier)
                  .addItem(CartModel.empty().copyWith(
                    itemId: product.id,
                    itemName: product.itemName,
                    itemPrice: product.itemPrice,
                    itemDiscountPrice: product.discountPrice,
                    itemImage: product.image,
                  ))
              : null,
          text: availableQuantity > 0
              ? 'Add to Cart'.hardcoded
              : 'Out of Stock'.hardcoded,
        ),
        if (product.itemQty > 0 && availableQuantity == 0) ...[
          gapH8,
          Text(
            'Already added to cart'.hardcoded,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ]
      ],
    );
  }
}
