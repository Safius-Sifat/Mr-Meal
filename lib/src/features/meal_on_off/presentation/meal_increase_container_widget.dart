import 'package:flutter/material.dart';

import '../../../common_widgets/item_quantity_selector.dart';
import '../../../constants/app_sizes.dart';
import '../../../constants/constants.dart';

class MealIncreaseContainerWidget extends StatelessWidget {
  const MealIncreaseContainerWidget({
    super.key,
    required this.mealTime,
    required this.mealCount,
  });
  final String mealTime;
  final int mealCount;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('09:30:17 AM', style: TextStyle(fontSize: Sizes.p12)),
          gapH8,
          Container(
            height: Sizes.p48,
            constraints: const BoxConstraints(maxWidth: 300),
            margin: const EdgeInsets.symmetric(
              horizontal: Sizes.p12,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: tertiaryColor,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(Sizes.p12),
            ),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Text(
                    mealTime,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: Sizes.p16,
                    ),
                  ),
                ),
                const VerticalDivider(
                  thickness: 2,
                  color: tertiaryColor,
                ),
                Expanded(
                    child: ItemQuantitySelector(
                        quantity: mealCount, onChanged: (quantity) {})),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
