import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shimmer/shimmer.dart';

import '../../../constants/app_sizes.dart';
import '../../../routing/app_router.dart';
import '../data/item_repository.dart';
import 'widgets/food_card.dart';

/// A widget that displays the list of products that match the search query.
class FoodsGrid extends ConsumerWidget {
  const FoodsGrid({super.key});
  static const pageSize = 10;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemsListValue = ref.watch(fetchItemsProvider(page: 1));
    final totalItems = itemsListValue.valueOrNull?.total;
    return ProductsLayoutGrid(
      itemCount: totalItems,
      itemBuilder: (_, index) {
        final page = index ~/ pageSize + 1;
        final indexInPage = index % pageSize;

        final itemsListValue = ref.watch(fetchItemsProvider(page: page));
        return itemsListValue.when(
          data: (items) {
            if (indexInPage >= items.data.length) {
              return null;
            }
            final item = items.data[indexInPage];

            return FoodCard(
                food: item,
                onPressed: () {
                  context.goNamed(AppRoute.itemDetail.name);
                });
          },
          loading: () => Shimmer.fromColors(
            baseColor: Colors.black26,
            highlightColor: Colors.black12,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  width: 100,
                  height: 15,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          error: (e, st) => Text(e.toString()),
        );
      },
    );
  }
}

/// Grid widget with content-sized items.
/// See: https://codewithandrea.com/articles/flutter-layout-grid-content-sized-items/
class ProductsLayoutGrid extends StatelessWidget {
  const ProductsLayoutGrid({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
  });

  /// Total number of items to display.
  final int? itemCount;

  /// Function used to build a widget for a given index in the grid.
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    // use a LayoutBuilder to determine the crossAxisCount
    return LayoutBuilder(builder: (context, constraints) {
      final width = constraints.maxWidth;
      // 1 column for width < 500px
      // then add one more column for each 250px
      final crossAxisCount = max(3, width ~/ 150);
      // print(crossAxisCount);
      // once the crossAxisCount is known, calculate the column and row sizes
      // set some flexible track sizes based on the crossAxisCount with 1.fr
      // final columnSizes = List.generate(crossAxisCount, (_) => 3.fr);
      // final numRows = (itemCount / crossAxisCount).ceil();
      // set all the row sizes to auto (self-sizing height)
      // final rowSizes = List.generate(numRows, (_) => auto);
      // Custom layout grid. See: https://pub.dev/packages/flutter_layout_grid
      return GridView.builder(
        padding: const EdgeInsets.all(Sizes.p16),
        scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: Sizes.p16,
          crossAxisSpacing: Sizes.p16,
          mainAxisExtent:
              (width - Sizes.p16 * crossAxisCount - 16) / crossAxisCount,
        ),
        itemBuilder: itemBuilder,
        itemCount: itemCount,
      );
      // return LayoutGrid(
      //   columnSizes: columnSizes,
      //   rowSizes: rowSizes,
      //   rowGap: Sizes.p24, // equivalent to mainAxisSpacing
      //   columnGap: Sizes.p24, // equivalent to crossAxisSpacing
      //   children: [
      //     // render all the items with automatic child placement
      //     for (var i = 0; i < itemCount; i++) itemBuilder(context, i),
      //   ],
      // );
    });
  }
}
