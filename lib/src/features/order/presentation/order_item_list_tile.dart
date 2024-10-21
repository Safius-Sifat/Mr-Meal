import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common_widgets/async_value_widget.dart';
import '../../../common_widgets/network_photo.dart';
import '../../../constants/app_sizes.dart';
import '../../../constants/constants.dart';
import '../../cart/domain/cart_item.dart';
import '../../products/data/item_repository.dart';
import '../../products/domain/item_detail.dart';

class OrderItemListTile extends ConsumerWidget {
  const OrderItemListTile({super.key, required this.item});
  final CartItem item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productValue = ref.watch(getItemDetailProvider(id: item.productId));
    return AsyncValueWidget<ItemDetail>(
      value: productValue,
      data: (product) => Padding(
          padding: const EdgeInsets.symmetric(vertical: Sizes.p8),
          child: Container(
            padding: const EdgeInsets.all(Sizes.p8),
            decoration: BoxDecoration(
              color: tertiaryColor,
              border: Border.all(color: secondaryColor),
              borderRadius: BorderRadius.circular(Sizes.p12),
            ),
            child: Row(
              children: [
                Expanded(
                  child: NetworkPhoto(product.image),
                ),
                gapW8,
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product.itemName,
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontSize: 14,
                                  )),
                      gapH4,
                      // const Text('This is wide range of'),
                      // const Text(
                      //   'Date: Today 1:30 pm',
                      // ),
                      Row(
                        children: [
                          Text(
                            '৳${product.itemPrice}',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  decoration: TextDecoration.lineThrough,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Sizes.p12,
                                ),
                          ),
                          gapW8,
                          Text(
                            '৳${product.discountPrice}',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: Sizes.p12,
                                ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(Icons.star, color: primaryColor, size: 16),
                          Text(
                            '4.99',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      fontSize: Sizes.p8,
                                    ),
                          ),
                          gapW4,
                          Text(
                            '15 Reviews',
                            style:
                                Theme.of(context).textTheme.bodySmall!.copyWith(
                                      fontSize: Sizes.p8,
                                    ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Text('Order Confirmed',
                    style: TextStyle(color: Colors.green))
              ],
            ),
          )),
    );
  }
}
