import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common_widgets/item_quantity_selector.dart';
import '../../../../common_widgets/primary_button.dart';
import '../../../../constants/app_sizes.dart';
import '../../../../l10n/string_hardcoded.dart';
import '../../../../utils/async_value_ui.dart';
import '../../../products/domain/item_detail.dart';
import '../../../products/domain/package_detail.dart';
import '../../application/cart_service.dart';
import '../../domain/online_cart.dart';
import 'add_to_cart_controller.dart';

/// A widget that shows an [ItemQuantitySelector] along with a [PrimaryButton]
/// to add the selected quantity of the item to the cart.
class AddToCartWidget extends ConsumerWidget {
  const AddToCartWidget({super.key, this.item, this.package});
  final ItemDetail? item;
  final PackageDetail? package;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<dynamic>>(
      addToCartControllerProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );
    final availableQuantity =
        ref.watch(itemAvailableQuantityProvider(item, package));
    final state = ref.watch(addToCartControllerProvider);
    final quantity = ref.watch(itemQuantityControllerProvider);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Quantity:'.hardcoded,
            style: const TextStyle(fontSize: Sizes.p12)),
        gapW4,
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
        const Spacer(),
        PrimaryButton(
          width: 150,

          isLoading: state.isLoading,
          // only enable the button if there is enough stock
          onPressed: availableQuantity > 0
              ? () async {
                  if (item != null) {
                    await ref
                        .read(addToCartControllerProvider.notifier)
                        .addItem(CartModel.empty().copyWith(
                          itemId: item!.id,
                          itemName: item!.itemName,
                          itemPrice: item!.itemPrice,
                          itemDiscountPrice: item!.discountPrice,
                          itemImage: item!.image,
                        ));
                  } else {
                    await ref
                        .read(addToCartControllerProvider.notifier)
                        .addItem(CartModel.empty().copyWith(
                          packageId: package!.id,
                          packageName: package!.packageName,
                          packagePrice: package!.packagePrice,
                          packageDiscountPrice: package!.discountPrice,
                          packageImage: package!.image,
                        ));
                  }
                  ref.invalidate(cartProvider);
                }
              : null,
          text: availableQuantity > 0
              ? 'Add to Cart'.hardcoded
              : 'Out of Stock'.hardcoded,
        ),
      ],
    );
  }
}
