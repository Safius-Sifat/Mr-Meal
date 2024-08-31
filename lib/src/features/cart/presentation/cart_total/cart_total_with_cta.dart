import 'package:flutter/material.dart';

import '../../../../constants/app_sizes.dart';
import '../../../../constants/constants.dart';
import '../../../../l10n/string_hardcoded.dart';
import '../../../../style/theme.dart';
import 'cart_total_text.dart';

/// Widget for showing the shopping cart total with a checkout button
class CartTotalWithCTA extends StatelessWidget {
  const CartTotalWithCTA({super.key, required this.ctaBuilder});
  final WidgetBuilder ctaBuilder;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Item Select'.hardcoded,
                ),
                gapH4,
                Text('Total'.hardcoded),
                gapH4,
              ],
            ),
            const Spacer(
              flex: 5,
            ),
            Column(
              children: [
                Text('6'.hardcoded, style: boldText),
                gapH4,
                Text('120'.hardcoded, style: boldText),
                gapH4,
              ],
            ),
            const Spacer(),
          ],
        ),
        Row(
          children: [
            Text('Add Promo Code'.hardcoded),
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(Sizes.p4),
              decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(Sizes.p4)),
              child: const Icon(
                Icons.cancel_rounded,
                size: 12,
                color: primaryColor,
              ),
            ),
            gapW4,
            Expanded(
              child: TextFormField(
                style: const TextStyle(fontSize: 10),
                textAlign: TextAlign.center,
                textInputAction: TextInputAction.done,
                autocorrect: false,
                onTapOutside: (event) {
                  FocusScope.of(context).unfocus();
                },
                decoration: InputDecoration(
                  hintText: 'Promo Code here',
                  isCollapsed: true,
                  contentPadding: const EdgeInsets.all(Sizes.p4),
                  hintStyle: const TextStyle(
                    color: textFieldHint,
                    fontSize: Sizes.p8,
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: secondaryColor),
                    borderRadius: BorderRadius.circular(Sizes.p8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: secondaryColor),
                    borderRadius: BorderRadius.circular(Sizes.p8),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: secondaryColor),
                    borderRadius: BorderRadius.circular(Sizes.p8),
                  ),
                  filled: true,
                  fillColor: textFieldColor,
                ),
              ),
            ),
            gapW4,
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.p4, vertical: Sizes.p8),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(Sizes.p8),
              ),
              child: const Text(
                'Apply',
                style: TextStyle(fontSize: 8, color: neutralColor),
              ),
            ),
          ],
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                gapH4,
                Text(
                  'Discount'.hardcoded,
                  style: TextStyle(color: primaryColor),
                ),
                gapH4,
                Text('Delivery Fee'.hardcoded),
              ],
            ),
            const Spacer(
              flex: 5,
            ),
            Column(
              children: [
                gapH4,
                Text('-5'.hardcoded,
                    style: boldText.copyWith(color: primaryColor)),
                gapH4,
                Text('45'.hardcoded, style: boldText),
              ],
            ),
            const Spacer(),
          ],
        ),
        const Divider(
          color: Colors.black,
        ),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Payment'.hardcoded,
                  style: TextStyle(
                      color: primaryColor, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Spacer(
              flex: 5,
            ),
            Column(
              children: [
                Text('120'.hardcoded,
                    style: boldText.copyWith(color: primaryColor)),
              ],
            ),
            const Spacer(),
          ],
        ),
        gapH16,
        ctaBuilder(context),
      ],
    );
  }
}
