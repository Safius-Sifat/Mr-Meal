import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_sizes.dart';
import '../../../../l10n/string_hardcoded.dart';
import '../../domain/package_category.dart';
import 'package_type.dart';

const kPackageType = [
  'Regular Package',
  'Monthly Package',
];

class PackageGrid extends ConsumerWidget {
  const PackageGrid({super.key, required this.categories});
  final List<PackageCategory> categories;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (categories.isEmpty) {
      return Center(
        child: Text(
          'No categories found'.hardcoded,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      );
    }
    return ProductsLayoutGrid(
      itemCount: categories.length,
      itemBuilder: (_, index) {
        final packageType = categories[index];
        return PackageType(
          type: packageType,
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
      final crossAxisCount = max(1, width ~/ 300);
      // print(crossAxisCount);
      // once the crossAxisCount is known, calculate the column and row sizes
      // set some flexible track sizes based on the crossAxisCount with 1.fr
      final columnSizes = List.generate(crossAxisCount, (_) => 1.fr);
      final numRows = (itemCount / crossAxisCount).ceil();
      // set all the row sizes to auto (self-sizing height)
      final rowSizes = List.generate(numRows, (_) => auto);
      // Custom layout grid. See: https://pub.dev/packages/flutter_layout_grid
      return LayoutGrid(
        columnSizes: columnSizes,
        rowSizes: rowSizes,
        rowGap: Sizes.p24, // equivalent to mainAxisSpacing
        columnGap: Sizes.p20, // equivalent to crossAxisSpacing
        children: [
          // render all the items with automatic child placement
          for (var i = 0; i < itemCount; i++) itemBuilder(context, i),
        ],
      );
    });
  }
}
