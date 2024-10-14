import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../common_widgets/network_photo.dart';
import '../../../constants/app_sizes.dart';
import '../../../constants/constants.dart';
import '../../../routing/app_router.dart';
import '../../../utils/toastification.dart';
import '../data/favrourite_repository.dart';
import '../domain/favourite_model.dart';
import 'favourite_controller.dart';

class FavouriteItemListTile extends ConsumerWidget {
  const FavouriteItemListTile({super.key, required this.item});
  final Favourite item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: Sizes.p8),
      child: InkWell(
        onTap: () {
          if (item.itemId != null) {
            context.goNamed(AppRoute.itemDetail.name,
                pathParameters: {'id': '${item.itemId}'});
          } else {
            context.goNamed(AppRoute.packageDetail.name,
                pathParameters: {'id': '${item.packageId}'});
          }
        },
        child: Container(
          padding: const EdgeInsets.all(Sizes.p8),
          height: Sizes.p96,
          decoration: BoxDecoration(
            color: tertiaryColor,
            border: Border.all(color: secondaryColor),
            borderRadius: BorderRadius.circular(Sizes.p12),
          ),
          child: Row(
            children: [
              Expanded(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(Sizes.p8),
                    child: NetworkPhoto(item.itemImage)),
              ),
              gapW8,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item.itemName ?? '',
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                              fontSize: 14,
                            )),
                    gapH4,
                    // const Text('This is wide range of'),
                    // const Text(
                    //   'Date: Today 1:30 pm',
                    // ),
                    Row(
                      children: [
                        Text(
                          '৳${item.itemDiscountPrice}',
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    decoration: TextDecoration.lineThrough,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Sizes.p12,
                                  ),
                        ),
                        gapW8,
                        Text(
                          '৳${item.itemPrice}',
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: primaryColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: Sizes.p12,
                                  ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () async {
                  final success = await ref
                      .read(removeFavouriteProvider.notifier)
                      .removeFromFavourite(item.id);
                  if (success && context.mounted) {
                    ref.invalidate(fetchFavouriteProvider);
                    successToast(
                        title: 'Removed from favourites', ctx: context);
                  }
                },
                icon: const Icon(
                  Icons.delete_outline_rounded,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
