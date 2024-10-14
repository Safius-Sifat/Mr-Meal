import 'package:flutter/material.dart';

import '../../../../common_widgets/responsive_center.dart';
import '../../../../constants/app_sizes.dart';
import '../../../../constants/breakpoints.dart';
import '../../../../constants/constants.dart';
import '../../../../l10n/string_hardcoded.dart';
import '../../domain/online_cart.dart';
import '../cart_total/cart_total_with_cta.dart';

/// Responsive widget showing the cart items and the checkout button
class ShoppingCartItemsBuilder extends StatelessWidget {
  const ShoppingCartItemsBuilder({
    super.key,
    required this.items,
    required this.itemBuilder,
    required this.ctaBuilder,
  });
  final List<CartModel> items;
  final Widget Function(BuildContext, CartModel, int) itemBuilder;
  final WidgetBuilder ctaBuilder;

  @override
  Widget build(BuildContext context) {
    // If there are no items, show a placeholder
    if (items.isEmpty) {
      return Center(
        child: Text('Your shopping cart is currently empty'.hardcoded,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge),
      );
    }
    // ! MediaQuery is used on the assumption that the widget takes up the full
    // ! width of the screen. If that's not the case, LayoutBuilder should be
    // ! used instead.
    final screenWidth = MediaQuery.of(context).size.width;
    // * on wide layouts, show a list of items on the left and the checkout
    // * button on the right
    if (screenWidth >= Breakpoint.tablet) {
      return ResponsiveCenter(
        padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
        child: Row(
          children: [
            Flexible(
              // use 3 flex units for the list of items
              flex: 2,
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(vertical: Sizes.p16),
                itemBuilder: (context, index) {
                  final item = items[index];
                  return itemBuilder(context, item, index);
                },
                separatorBuilder: (_, __) => gapH16,
                itemCount: items.length,
              ),
            ),
            gapW16,
            Flexible(
              // use 1 flex unit for the checkout button
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: Sizes.p16),
                child: CartTotalWithCTA(ctaBuilder: ctaBuilder),
              ),
            )
          ],
        ),
      );
    } else {
      // * on narrow layouts, show a [Column] with a scrollable list of items
      // * and a pinned box at the bottom with the checkout button
      return Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(Sizes.p12),
              itemBuilder: (context, index) {
                final item = items[index];
                return itemBuilder(context, item, index);
              },
              separatorBuilder: (_, __) => gapH16,
              itemCount: items.length,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(Sizes.p12),
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Sizes.p16),
                boxShadow: const [
                  BoxShadow(
                    color: secondaryColor,
                    offset: Offset(0, 5),
                    blurRadius: 5,
                    spreadRadius: 1,
                  ),
                  BoxShadow(
                    color: secondaryColor,
                  ),
                  BoxShadow(
                    color: neutralColor,
                    offset: Offset(0, 5),
                    blurRadius: 5,
                    spreadRadius: -1,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(Sizes.p16),
                child: CartTotalWithCTA(ctaBuilder: ctaBuilder),
              ),
            ),
          ),
        ],
      );
    }
  }
}
