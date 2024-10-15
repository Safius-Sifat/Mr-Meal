import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_sizes.dart';
import '../../../../constants/breakpoints.dart';
import '../../../../constants/constants.dart';
import '../../../../constants/feature_list.dart';
import '../widgets/feature_card.dart';

class FeatureGrid extends ConsumerWidget {
  const FeatureGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ProductsLayoutGrid(
      itemCount: kfeatures.length,
      itemBuilder: (_, index) {
        final feature = kfeatures[index];
        return FeatureCard(feature: feature);
      },
    );
  }
}

class ProductsLayoutGrid extends StatefulWidget {
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
  State<ProductsLayoutGrid> createState() => _ProductsLayoutGridState();
}

class _ProductsLayoutGridState extends State<ProductsLayoutGrid> {
  int _current = 0;
  final CarouselSliderController _controller = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final width = constraints.maxWidth;

      final bool isMobile = constraints.maxWidth < Breakpoint.tablet;
      // 1 column for width < 500px
      // then add one more column for each 250px
      final crossAxisCount = max(4, width ~/ 100);
      // print(crossAxisCount);
      // once the crossAxisCount is known, calculate the column and row sizes
      // set some flexible track sizes based on the crossAxisCount with 1.fr
      final columnSizes = List.generate(crossAxisCount, (_) => 4.fr);
      final numRows = (widget.itemCount / crossAxisCount).ceil();
      // set all the row sizes to auto (self-sizing height)
      final rowSizes = List.generate(numRows, (_) => auto);

      return isMobile
          ? Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CarouselSlider.builder(
                    options: CarouselOptions(
                        height: 230,
                        viewportFraction: 1,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        }),
                    itemCount: 2,
                    itemBuilder: (context, index, realIndex) {
                      return LayoutGrid(
                        columnSizes: columnSizes,
                        rowSizes: rowSizes,
                        rowGap: Sizes.p12, // equivalent to mainAxisSpacing
                        columnGap: Sizes.p20, // equivalent to crossAxisSpacing
                        children: [
                          // render all the items with automatic child placement
                          if (index == 0)
                            for (var i = 0; i < 8; i++)
                              widget.itemBuilder(context, i),
                          if (index == 1)
                            for (var i = 8; i < widget.itemCount; i++)
                              widget.itemBuilder(context, i),
                        ],
                      );
                    }),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [0, 1].asMap().entries.map((entry) {
                      return GestureDetector(
                        onTap: () => _controller.animateToPage(entry.key),
                        child: Container(
                          width: 12,
                          height: 4,
                          margin: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            color: _current == entry.key
                                ? Colors.grey
                                : secondaryColor,
                          ),
                        ),
                      );
                    }).toList())
              ],
            )
          : LayoutGrid(
              columnSizes: columnSizes,
              rowSizes: rowSizes,
              rowGap: Sizes.p12, // equivalent to mainAxisSpacing
              columnGap: Sizes.p24, // equivalent to crossAxisSpacing
              children: [
                // render all the items with automatic child placement
                for (var i = 0; i < widget.itemCount; i++)
                  widget.itemBuilder(context, i),
              ],
            );
    });
  }
}
