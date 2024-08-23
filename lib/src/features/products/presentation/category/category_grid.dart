import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_sizes.dart';
import '../../../../constants/category_list.dart';
import 'category_container.dart';

class CategoryGrid extends ConsumerWidget {
  const CategoryGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final productsListValue = ref.watch(productsSearchResultsProvider);
    // return AsyncValueWidget<List<Product>>(
    //   value: productsListValue,
    //   data: (products) => products.isEmpty
    //       ? Center(
    //           child: Text(
    //             'No products found'.hardcoded,
    //             style: Theme.of(context).textTheme.headlineMedium,
    //           ),
    //         )
    return ProductsLayoutGrid(
      itemCount: kCategories.length,
      itemBuilder: (_, index) {
        final category = kCategories[index];
        return CategoryContainer(category: category);
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
  final int itemCount;

  /// Function used to build a widget for a given index in the grid.
  final Widget Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    // use a LayoutBuilder to determine the crossAxisCount
    return LayoutBuilder(builder: (context, constraints) {
      final width = constraints.maxWidth;
      // 1 column for width < 500px
      // then add one more column for each 250px
      final crossAxisCount = max(2, width ~/ 150);
      // print(crossAxisCount);
      // once the crossAxisCount is known, calculate the column and row sizes
      // set some flexible track sizes based on the crossAxisCount with 1.fr
      final columnSizes = List.generate(crossAxisCount, (_) => 2.fr);
      final numRows = (itemCount / crossAxisCount).ceil();
      // set all the row sizes to auto (self-sizing height)
      final rowSizes = List.generate(numRows, (_) => auto);
      // Custom layout grid. See: https://pub.dev/packages/flutter_layout_grid
      // return GridView.builder(
      //   padding: const EdgeInsets.all(Sizes.p16),
      //   scrollDirection: Axis.horizontal,
      //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: 2,
      //     mainAxisSpacing: Sizes.p16,
      //     crossAxisSpacing: Sizes.p16,
      //     mainAxisExtent:
      //         (width - Sizes.p16 * crossAxisCount - 16) / crossAxisCount,
      //   ),
      //   itemBuilder: itemBuilder,
      //   itemCount: itemCount,
      // );
      return LayoutGrid(
        columnSizes: columnSizes,
        rowSizes: rowSizes,
        rowGap: Sizes.p12, // equivalent to mainAxisSpacing
        columnGap: Sizes.p24, // equivalent to crossAxisSpacing
        children: [
          // render all the items with automatic child placement
          for (var i = 0; i < itemCount; i++) itemBuilder(context, i),
        ],
      );
    });
  }
}
