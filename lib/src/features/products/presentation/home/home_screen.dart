import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../constants/app_sizes.dart';
import '../../../../constants/constants.dart';
import '../../../../routing/app_router.dart';
import '../../../../utils/size_config.dart';
import '../../data/item_repository.dart';
import '../../data/package_repository.dart';
import '../food_grid.dart';
import '../widgets/notification_widget.dart';
import '../widgets/photo.dart';
import '../widgets/search_field.dart';
import 'carousel_slider.dart';
import 'feature_grid.dart';
import 'home_packages_widget.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});
  final carouselController = CarouselController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            InkWell(
              onTap: () {
                context.goNamed(AppRoute.location.name);
              },
              child: const SizedBox(
                height: Sizes.p16,
                width: Sizes.p16,
                child: Photo(
                  location,
                ),
              ),
            ),
            gapW4,
            InkWell(
              onTap: () {
                context.goNamed(AppRoute.location.name);
              },
              child: Text(
                'Dhaka, Bangladesh',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            gapW8,
            const Expanded(
              child: SearchField(),
            ),
          ],
        ),
        actions: const [NotificationWidget(), gapW16],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.p12),
          child: Column(
            children: [
              CustomCarouselSlider(
                value: ref.watch(fetchSlidersProvider),
              ),
              gapH12,
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
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
                                offset:
                                    Offset(0, 2), // changes position of shadow
                              ),
                            ]),
                        child: const FoodsGrid(),
                      ),
                      Container(
                        height: Sizes.p16,
                        width: double.infinity,
                        color: Colors.transparent,
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 0,
                    right:
                        SizeConfig.screenWidth / 2 - Sizes.p96 / 2 - Sizes.p12,
                    width: Sizes.p96,
                    height: Sizes.p32,
                    child: ElevatedButton(
                      onPressed: () {
                        context.goNamed(AppRoute.items.name);
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: tertiaryColor,
                        elevation: Sizes.p4,
                        textStyle: const TextStyle(
                          fontSize: Sizes.p12,
                        ),
                        padding: const EdgeInsets.only(
                            left: Sizes.p8, right: Sizes.p4),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'SEE MORE',
                          ),
                          Icon(
                            Icons.keyboard_arrow_down,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              gapH32,
              const FeatureGrid(),
              gapH24,
              const HomePackagesWidget(),
              gapH16,
            ],
          ),
        ),
      ),
    );
  }
}
