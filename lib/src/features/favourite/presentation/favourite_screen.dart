import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common_widgets/error.dart';
import '../../../constants/app_sizes.dart';
import '../../../constants/constants.dart';
import '../../../l10n/string_hardcoded.dart';
import '../../products/presentation/widgets/notification_widget.dart';
import '../data/favrourite_repository.dart';
import 'favourite_item_list_tile.dart';
import 'favourite_screen_shimmer.dart';

class FavouriteScreen extends ConsumerWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favourites = ref.watch(fetchFavouriteProvider);
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
        child: favourites.when(
          skipLoadingOnRefresh: false,
          error: (e, st) => ErrorScreen(
              error: e, onRetry: () => ref.refresh(fetchFavouriteProvider)),
          loading: () => const FavouriteScreenShimmer(),
          data: (favs) {
            if (favs.favourites.isEmpty) {
              return Center(
                child: Text(
                  "You haven't added any favourites yet".hardcoded,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              );
            }
            return ListView.builder(
              itemCount: favs.favourites.length,
              itemBuilder: (context, index) {
                final item = favs.favourites[index];
                return FavouriteItemListTile(item: item);
              },
            );
          },
        ),
      ),
    );
  }
}
