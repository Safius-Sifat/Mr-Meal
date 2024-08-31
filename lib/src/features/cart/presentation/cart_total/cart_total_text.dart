import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_sizes.dart';
import '../../../../l10n/string_hardcoded.dart';
import '../../../../utils/currency_formatter.dart';
import '../../application/cart_service.dart';

/// Text widget for showing the total price of the cart
class CartTotalText extends ConsumerWidget {
  const CartTotalText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final cartTotal = ref.watch(cartTotalProvider);
    // final totalFormatted =
    //     ref.watch(currencyFormatterProvider).format(cartTotal);
    return Row(
      children: [
        Text('Total'.hardcoded),
        const Spacer(),
        const Text(textAlign: TextAlign.center, r'$120'),
        gapW48,
      ],
    );
  }
}
