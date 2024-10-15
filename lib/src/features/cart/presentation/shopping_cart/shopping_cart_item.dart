import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../common_widgets/item_quantity_selector.dart';
import '../../../../common_widgets/network_photo.dart';
import '../../../../constants/app_sizes.dart';
import '../../../../constants/constants.dart';
import '../../../../l10n/string_hardcoded.dart';
import '../../../../utils/toastification.dart';
import '../../domain/online_cart.dart';
import 'shopping_cart_screen_controller.dart';

/// Shows a shopping cart item (or loading/error UI if needed)
// class ShoppingCartItem extends ConsumerWidget {
//   const ShoppingCartItem({
//     super.key,
//     required this.item,
//     required this.itemIndex,
//     this.isEditable = true,
//   });
//   final CartModel item;
//   final int itemIndex;
//
//   /// if true, an [ItemQuantitySelector] and a delete button will be shown
//   /// if false, the quantity will be shown as a read-only label (used in the
//   /// [PaymentPage])
//   final bool isEditable;
//
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final productValue = ref.watch(getItemDetailProvider(id: item.productId));
//     return AsyncValueWidget<ItemDetail>(
//       value: productValue,
//       loading: const ShoppingCartItemShimmer(),
//       data: (product) => Padding(
//         padding: const EdgeInsets.symmetric(vertical: Sizes.p8),
//         child: ShoppingCartItemContents(
//           product: product,
//           item: item,
//           itemIndex: itemIndex,
//           isEditable: isEditable,
//         ),
//       ),
//     );
//   }
// }
//
/// Shows a shopping cart item for a given product
class ShoppingCartItemContents extends ConsumerWidget {
  const ShoppingCartItemContents({
    super.key,
    required this.item,
    required this.itemIndex,
    required this.isEditable,
  });
  final CartModel item;
  final int itemIndex;
  final bool isEditable;

  // * Keys for testing using find.byKey()
  static Key deleteKey(int index) => Key('delete-$index');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final priceFormatted = ref
    //     .watch(currencyFormatterProvider)
    //     .format(item.itemPrice ?? item.packagePrice);
    return Container(
      padding: const EdgeInsets.all(Sizes.p8),
      height: Sizes.p96,
      decoration: BoxDecoration(
        color: tertiaryColor,
        border: Border.all(color: secondaryColor),
        borderRadius: BorderRadius.circular(Sizes.p12),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 5,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(Sizes.p8),
              child: NetworkPhoto(
                  item.itemId != null ? item.itemImage : item.packageImage),
            ),
          ),
          gapW8,
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    item.itemId != null
                        ? item.itemName ?? ''
                        : item.packageName ?? '',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: 14,
                        )),
                gapH4,
                // Text('This is wide range of ${item.id}'),
                // const Text(
                //   'Date: Today 1:30 pm',
                // ),
                Row(
                  children: [
                    Text(
                      '৳${NumberFormat('', 'bn').format(item.itemId != null ? item.itemDiscountPrice : item.packageDiscountPrice)}',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            decoration: TextDecoration.lineThrough,
                            fontWeight: FontWeight.bold,
                            fontSize: Sizes.p12,
                          ),
                    ),
                    gapW8,
                    Text(
                      '৳${NumberFormat('', 'bn').format(item.itemId != null ? item.itemPrice : item.packagePrice)}',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: Sizes.p12,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (isEditable)
            EditOrRemoveItemWidget(
              item: item,
              itemIndex: itemIndex,
            )
          else
            Padding(
              padding: const EdgeInsets.symmetric(vertical: Sizes.p8),
              child: Text(
                'Quantity: ${item.quantity}'.hardcoded,
              ),
            ),
        ],
      ),
    );
    // return ResponsiveTwoColumnLayout(
    //   endFlex: 2,
    //   breakpoint: 320,
    //   startContent: NetworkPhoto(product.image),
    //   spacing: Sizes.p24,
    //   endContent: Column(
    //     crossAxisAlignment: CrossAxisAlignment.stretch,
    //     children: [
    //       Text(product.itemName,
    //           style: Theme.of(context).textTheme.headlineSmall),
    //       gapH24,
    //       Text(priceFormatted,
    //           style: Theme.of(context).textTheme.headlineSmall),
    //       gapH24,
    //       isEditable
    //           // show the quantity selector and a delete button
    //           ? EditOrRemoveItemWidget(
    //               product: product,
    //               item: item,
    //               itemIndex: itemIndex,
    //             )
    //           // else, show the quantity as a read-only label
    //           : Padding(
    //               padding: const EdgeInsets.symmetric(vertical: Sizes.p8),
    //               child: Text(
    //                 'Quantity: ${item.quantity}'.hardcoded,
    //               ),
    //             ),
    //     ],
    //   ),
    // );
  }
}

// custom widget to show the quantity selector and a delete button
class EditOrRemoveItemWidget extends ConsumerWidget {
  const EditOrRemoveItemWidget({
    super.key,
    required this.item,
    required this.itemIndex,
  });
  final CartModel item;
  final int itemIndex;

  // * Keys for testing using find.byKey()
  static Key deleteKey(int index) => Key('delete-$index');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(shoppingCartScreenControllerProvider);
    return Expanded(
      flex: 4,
      child: Wrap(
        runAlignment: WrapAlignment.center,
        alignment: WrapAlignment.center,
        children: [
          ItemQuantitySelector(
            quantity: item.quantity,
            maxQuantity: min(20, 10),
            itemIndex: itemIndex,
            onChanged: state.isLoading
                ? null
                : (quantity) => ref
                    .read(shoppingCartScreenControllerProvider.notifier)
                    .updateItemQuantity(item.copyWith(quantity: quantity)),
          ),
          IconButton(
            onPressed: () async {
              final success = await ref
                  .read(shoppingCartScreenControllerProvider.notifier)
                  .removeItemById(item);

              print('removed ${item.id}');
              if (success && context.mounted) {
                successToast(ctx: context, title: 'Item removed');
              }
            },
            icon: const Icon(
              Icons.delete_outline_rounded,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
