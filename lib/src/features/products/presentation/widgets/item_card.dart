// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../common_widgets/network_photo.dart';
import '../../../../constants/app_sizes.dart';

import '../../../../constants/constants.dart';
import '../../../../utils/toastification.dart';
import '../../../favourite/data/favrourite_repository.dart';
import '../../../favourite/presentation/favourite_controller.dart';
import '../../domain/items.dart';

class ItemCard extends ConsumerWidget {
  const ItemCard({
    super.key,
    required this.food,
    required this.onPressed,
  });

  final Datum food;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: onPressed,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.p8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                AspectRatio(
                    aspectRatio: 1.5,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(Sizes.p8),
                        child: NetworkPhoto(food.image))),
                Positioned(
                  top: Sizes.p4,
                  right: Sizes.p4,
                  child: InkWell(
                    onTap: () async {
                      final success = await ref
                          .read(addToFavouriteProvider.notifier)
                          .addToFavourite(food.id, 'item');
                      if (success) {
                        ref.invalidate(fetchFavouriteProvider);
                        successToast(ctx: context, title: 'Added to Favourite');
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(Sizes.p4),
                      decoration: const BoxDecoration(
                        color: tertiaryColor,
                        borderRadius:
                            BorderRadius.all(Radius.circular(Sizes.p4)),
                      ),
                      child: const Icon(
                        Icons.favorite_outline,
                        color: Colors.black,
                        size: Sizes.p12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            gapH4,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Sizes.p4),
              child: Text(
                food.itemName,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '৳${NumberFormat('', 'bn').format(food.itemPrice)}',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        decoration: TextDecoration.lineThrough,
                        fontSize: Sizes.p12,
                      ),
                ),
                gapW4,
                Text(
                  '৳${NumberFormat('', 'bn').format(food.discountPrice)}',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: primaryColor,
                        fontSize: Sizes.p12,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
