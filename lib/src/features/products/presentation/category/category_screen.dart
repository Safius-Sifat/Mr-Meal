import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_sizes.dart';
import '../../../../constants/constants.dart';
import '../../../../utils/size_config.dart';
import '../../data/item_repository.dart';
import '../food_grid.dart';
import '../home/carousel_slider.dart';
import '../widgets/notification_widget.dart';
import 'category_grid.dart';

class CategoryScreen extends ConsumerWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: Sizes.p16, vertical: Sizes.p8),
          decoration: BoxDecoration(
              color: secondaryColor, borderRadius: BorderRadius.circular(8)),
          child: const Text('Our All Category'),
        ),
        actions: const [NotificationWidget(), gapW16],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.p12),
          child: Column(
            children: [
              CustomCarouselSlider(
                value: ref.watch(fetchSlidersProvider(screen: 'Home Page')),
              ),
              // gapH12,
              // const CategoryGrid(),
              gapH32,
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: Sizes.p12, vertical: Sizes.p8),
                        decoration: BoxDecoration(
                            color: tertiaryColor,
                            borderRadius: BorderRadius.circular(8)),
                        child: Text(
                          'Lunch Time',
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: Sizes.p12, vertical: Sizes.p8),
                        decoration: BoxDecoration(
                            color: tertiaryColor,
                            borderRadius: BorderRadius.circular(8)),
                        child: Text(
                          'Order between 9:00 AM - 12:00 PM',
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    ],
                  ),
                  gapH8,
                  Container(
                    height: SizeConfig.isMobile ? 260 : 300,
                    // padding: const EdgeInsets.all(Sizes.p8),
                    decoration: const BoxDecoration(
                        color: tertiaryColor,
                        borderRadius:
                            BorderRadius.all(Radius.circular(Sizes.p12)),
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
              ),
              gapH32,
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: Sizes.p12, vertical: Sizes.p8),
                        decoration: BoxDecoration(
                            color: tertiaryColor,
                            borderRadius: BorderRadius.circular(8)),
                        child: Text(
                          'Special Item',
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: Sizes.p12, vertical: Sizes.p8),
                        decoration: BoxDecoration(
                            color: tertiaryColor,
                            borderRadius: BorderRadius.circular(8)),
                        child: Text(
                          'Order between 9:00 AM - 12:00 PM',
                          style:
                              Theme.of(context).textTheme.titleMedium!.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    ],
                  ),
                  gapH8,
                  Container(
                    height: SizeConfig.isMobile ? 260 : 300,
                    // padding: const EdgeInsets.all(Sizes.p8),
                    decoration: const BoxDecoration(
                        color: tertiaryColor,
                        borderRadius:
                            BorderRadius.all(Radius.circular(Sizes.p12)),
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
              ),
              gapH16,
            ],
          ),
        ),
      ),
    );
  }
}
