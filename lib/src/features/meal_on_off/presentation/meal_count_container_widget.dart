import 'package:flutter/material.dart';

import '../../../constants/app_sizes.dart';
import '../../../constants/constants.dart';

class MealCountContainerWidget extends StatelessWidget {
  const MealCountContainerWidget({
    super.key,
    required this.mealTime,
    required this.mealCount,
  });
  final String mealTime;
  final String mealCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Sizes.p48,
      constraints: const BoxConstraints(maxWidth: 150),
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.p8,
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
            child: Text(
              mealCount,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: Sizes.p16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
