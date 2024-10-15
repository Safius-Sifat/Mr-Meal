import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../common_widgets/async_value_widget.dart';
import '../../../../common_widgets/primary_button.dart';
import '../../../../constants/app_sizes.dart';
import '../../../../constants/constants.dart';
import '../../../../l10n/string_hardcoded.dart';
import '../../../../routing/app_router.dart';
import '../../../../utils/async_value_ui.dart';
import '../../../../utils/toastification.dart';
import '../../../address/data/location_repository.dart';
import '../../../payment/presentation/payment_controller.dart';
import '../../../payment/presentation/select_delivery_address.dart';
import '../../../products/presentation/home/set_location.dart';
import '../../../products/presentation/widgets/notification_widget.dart';
import '../../application/cart_service.dart';
import '../../domain/online_cart.dart';
import 'shopping_cart_item.dart';
import 'shopping_cart_items_builder.dart';

/// Shopping cart screen showing the items in the cart (with editable
/// quantities) and a button to checkout.
class ShoppingCartScreen extends ConsumerWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<void>>(
      postOrderProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );
    final state = ref.watch(postOrderProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: Sizes.p16, vertical: Sizes.p8),
          decoration: BoxDecoration(
              color: secondaryColor, borderRadius: BorderRadius.circular(8)),
          child: Text('My Cart'.hardcoded),
        ),
        actions: const [NotificationWidget(), gapW16],
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final cartValue = ref.watch(cartProvider);
          return AsyncValueWidget<RemoteCart>(
            value: cartValue,
            data: (cart) => ShoppingCartItemsBuilder(
              items: cart.carts,
              itemBuilder: (_, item, index) => ShoppingCartItemContents(
                item: item,
                itemIndex: index,
                isEditable: true,
              ),
              ctaBuilder: (_) => PrimaryButton(
                width: 160,
                text: 'Confirm Order'.hardcoded,
                isLoading: state.isLoading,
                onPressed: () async {
                  final List<List<dynamic>> items = [];
                  final List<List<dynamic>> packages = [];
                  for (final element in cart.carts) {
                    if (element.itemId != null) {
                      items.add([
                        element.itemId,
                        element.quantity,
                        element.itemPrice
                      ]);
                    } else {
                      packages.add([
                        element.packageId,
                        element.quantity,
                        element.packagePrice
                      ]);
                    }
                  }
                  // showDialog(
                  //     context: context,
                  //     builder: (context) {
                  //       return AlertDialog(
                  //         title: const Text('Items'),
                  //         content: Column(
                  //           children: [
                  //             Text(items.toString()),
                  //             Text(packages.toString()),
                  //           ],
                  //         ),
                  //       );
                  //     });
                  // print(items);
                  // print(packages);
                  const double discount = 0;
                  final location = ref.read(fetchAddressProvider).valueOrNull;
                  if (location == null) {
                    successToast(
                        ctx: context, title: 'Please set your location');
                    return;
                  }
                  if (location.primaryLocation == null &&
                      location.secondaryLocation == null) {
                    await setLocation(context, location);
                    return;
                  }

                  final address = await showAddressSelector(context, location);
                  if (address == null) {
                    successToast(
                        ctx: context,
                        title: 'Please select your delivery address');

                    return;
                  }
                  final total = ref.watch(cartTotalProvider);
                  final success = await ref
                      .read(postOrderProvider.notifier)
                      .postOrder(
                          amount: total,
                          items: items,
                          packages: packages,
                          discount: discount,
                          address: address);

                  if (success) {
                    final url = ref.read(postOrderProvider).valueOrNull;
                    if (url != null && url.isNotEmpty) {
                      context.goNamed(AppRoute.payment.name,
                          pathParameters: {'url': url});
                    }
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
