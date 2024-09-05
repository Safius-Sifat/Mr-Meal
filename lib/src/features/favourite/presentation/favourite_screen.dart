import 'package:flutter/material.dart';

import '../../../constants/app_sizes.dart';
import '../../../constants/constants.dart';
import '../../../l10n/string_hardcoded.dart';
import '../../cart/domain/cart_item.dart';
import '../../products/presentation/widgets/notification_widget.dart';
import 'favourite_item_list_tile.dart';

class FavouriteScreen extends StatelessWidget {
  FavouriteScreen({super.key});
  final item = [
    const CartItem(productId: 1, quantity: 2),
    const CartItem(productId: 2, quantity: 1),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Container(
            padding: const EdgeInsets.symmetric(
                horizontal: Sizes.p16, vertical: Sizes.p8),
            decoration: BoxDecoration(
                color: secondaryColor, borderRadius: BorderRadius.circular(8)),
            child: Text('My Favourites'.hardcoded),
          ),
          actions: const [NotificationWidget(), gapW16],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: Sizes.p12, vertical: Sizes.p8),
          child: ListView.builder(
              itemCount: item.length,
              itemBuilder: (context, index) {
                return FavouriteItemListTile(item: item[index]);
              }),
        ));
  }
}
