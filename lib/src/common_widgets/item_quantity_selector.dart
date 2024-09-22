import 'package:flutter/material.dart';

import '../constants/app_sizes.dart';
import '../constants/constants.dart';

/// Item quantity selector with +/- buttons and a text value in the middle
class ItemQuantitySelector extends StatelessWidget {
  const ItemQuantitySelector({
    super.key,
    required this.quantity,
    this.maxQuantity = 10,
    this.itemIndex,
    this.onChanged,
  });
  final int quantity;
  final int maxQuantity;
  final int? itemIndex;
  final ValueChanged<int>? onChanged;

  // // * Keys for testing using find.byKey()
  // static Key decrementKey([int? index]) =>
  //     index != null ? Key('decrement-$index') : const Key('decrement');
  // static Key quantityKey([int? index]) =>
  //     index != null ? Key('quantity-$index') : const Key('quantity');
  // static Key incrementKey([int? index]) =>
  //     index != null ? Key('increment-$index') : const Key('increment');
  //
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: neutralColor,
        borderRadius: BorderRadius.all(Radius.circular(Sizes.p8)),
      ),
      padding: const EdgeInsets.all(Sizes.p8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: onChanged != null && quantity > 1
                ? () => onChanged!.call(quantity - 1)
                : null,
            child: DecoratedBox(
              decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8)),
              child: const Icon(Icons.remove),
            ),
          ),
          gapW8,
          SizedBox(
            child: Text(
              '$quantity',
              // key: quantityKey(itemIndex),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          gapW8,
          InkWell(
            onTap: onChanged != null && quantity < maxQuantity
                ? () => onChanged!.call(quantity + 1)
                : null,
            child: DecoratedBox(
              decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8)),
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
