import 'package:flutter/material.dart';

import '../../../../constants/app_sizes.dart';
import '../../../../constants/constants.dart';

class TabButton extends StatelessWidget {
  const TabButton({
    super.key,
    required this.title,
    required this.onTap,
    required this.isSelected,
  });
  final String title;
  final void Function() onTap;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: const BorderRadius.all(Radius.circular(Sizes.p8)),
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: Sizes.p12, vertical: Sizes.p8),
        decoration: BoxDecoration(
            color: isSelected ? primaryColor : secondaryColor,
            borderRadius: BorderRadius.circular(8)),
        child: Text(
          title,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: isSelected ? Colors.white : Colors.black,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}
