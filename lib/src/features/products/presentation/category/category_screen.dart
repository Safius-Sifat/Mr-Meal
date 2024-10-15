import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common_widgets/async_value_widget.dart';
import '../../../../constants/api_constants.dart';
import '../../../../constants/app_sizes.dart';
import '../../../../constants/constants.dart';
import '../../../../constants/texts.dart';
import '../../../../utils/size_config.dart';
import '../../data/item_repository.dart';
import '../../domain/category.dart';
import '../home/carousel_slider.dart';
import '../item_screen/items_by_category_grid.dart';
import '../widgets/notification_widget.dart';

class CategoryScreen extends ConsumerWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemCategory = ref.watch(fetchCategoriesProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: Sizes.p16, vertical: Sizes.p8),
          decoration: BoxDecoration(
              color: secondaryColor, borderRadius: BorderRadius.circular(8)),
          child: const Text('Categories'),
        ),
        actions: const [NotificationWidget(), gapW16],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.p12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomCarouselSlider(
                value: ref.watch(fetchSlidersProvider(screen: categoryParam)),
              ),
              gapH24,
              AsyncValueWidget<List<Category>>(
                  value: itemCategory,
                  data: (category) {
                    return ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return ItemCategoryWidget(
                            category: category[index],
                          );
                        },
                        separatorBuilder: (context, index) => gapH24,
                        itemCount: category.length);
                  }),
              gapH24,
              Text(
                'N.B.',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              gapH12,
              ...List.generate(categoryNBList.length, (index) {
                return Text(
                  categoryNBList[index],
                  style: Theme.of(context).textTheme.titleMedium,
                );
              })
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
          child: ItemsByCategoryGrid(
            categoryId: category.id,
          ),
        ),
      ],
    );
  }
}
