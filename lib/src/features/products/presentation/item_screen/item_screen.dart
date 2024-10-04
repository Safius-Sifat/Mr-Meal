import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common_widgets/async_value_widget.dart';
import '../../../../constants/app_sizes.dart';
import '../../../../constants/constants.dart';
import '../../../../utils/size_config.dart';
import '../../data/item_repository.dart';
import '../../domain/items_by_category.dart';
import '../food_grid.dart';
import '../home/carousel_slider.dart';
import '../widgets/notification_widget.dart';

class ItemScreen extends ConsumerWidget {
  const ItemScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemCategory = ref.watch(fetchItemsByCategoryProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: Sizes.p16, vertical: Sizes.p8),
          decoration: BoxDecoration(
              color: secondaryColor, borderRadius: BorderRadius.circular(8)),
          child: const Text('Items'),
        ),
        actions: const [NotificationWidget(), gapW16],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.p12),
          child: Column(
            children: [
              CustomCarouselSlider(
                value: ref.watch(fetchSlidersProvider(screen: 'Home Page')),
              ),
              gapH24,
              AsyncValueWidget<ItemsByCategory>(
                  value: itemCategory,
                  data: (category) {
                    return ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return ItemCategoryWidget(
                            category: category.categories[index],
                          );
                        },
                        separatorBuilder: (context, index) => gapH24,
                        itemCount: category.categories.length);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class ItemCategoryWidget extends StatelessWidget {
  const ItemCategoryWidget({
    super.key,
    required this.category,
  });
  final Category category;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
              horizontal: Sizes.p12, vertical: Sizes.p8),
          decoration: BoxDecoration(
              color: tertiaryColor, borderRadius: BorderRadius.circular(8)),
          child: Text(
            category.categoryName,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        gapH8,
        Container(
          height: SizeConfig.isMobile ? 260 : 300,
          // padding: const EdgeInsets.all(Sizes.p8),
          decoration: const BoxDecoration(
              color: tertiaryColor,
              borderRadius: BorderRadius.all(Radius.circular(Sizes.p12)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  // spreadRadius: 1,
                  blurRadius: 8,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ]),
          child: const FoodsGrid(),
        ),
      ],
    );
  }
}
