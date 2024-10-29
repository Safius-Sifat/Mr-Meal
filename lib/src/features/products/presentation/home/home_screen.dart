import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../common_widgets/error.dart';
import '../../../../constants/api_constants.dart';
import '../../../../constants/app_sizes.dart';
import '../../../../constants/constants.dart';
import '../../../../routing/app_router.dart';
import '../../../../utils/size_config.dart';
import '../../data/item_repository.dart';
import '../../data/package_repository.dart';
import '../item_grid.dart';
import '../search/search_field.dart';
import 'carousel_slider.dart';
import 'feature_grid.dart';
import 'home_notification_widget.dart';
import 'home_packages_widget.dart';
import 'set_location.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});
  final carouselController = CarouselController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    SizeConfig().init(context);
    // ref.watch(cartProvider).valueOrNull;

    final itemsListValue = ref.watch(fetchItemsProvider(page: 1));
    final sliders = ref.watch(fetchSlidersProvider(screen: homeParam));

    final packages = ref.watch(fetchPackagesProvider);
    final bool isLoaded =
        (itemsListValue.hasError || sliders.hasError || packages.hasError) &&
            (!packages.isRefreshing &&
                !itemsListValue.isRefreshing &&
                !sliders.isRefreshing);

    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          toolbarHeight: 0,
          pinned: true,
          expandedHeight: 110,
          backgroundColor: primaryColor,
          flexibleSpace: FlexibleSpaceBar(
            expandedTitleScale: 1,
            background: SafeArea(
              child: Container(
                alignment: Alignment.topCenter,
                padding: const EdgeInsets.symmetric(horizontal: Sizes.p12),
                decoration: const BoxDecoration(
                  color: primaryColor,
                ),
                child: const Row(
                  children: [
                    SetLocationWidget(),
                    Spacer(),
                    HomeNotificationWidget()
                  ],
                ),
              ),
            ),
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.p12, vertical: Sizes.p8),
              child: SearchField(),
            ),
          ),
        ),
        if (isLoaded)
          ErrorScreen(
              error: itemsListValue.error,
              onRetry: () {
                ref.invalidate(fetchItemsProvider(page: 1));
                ref.invalidate(fetchSlidersProvider(screen: homeParam));
                ref.invalidate(fetchPackagesProvider);
              })
        else
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Sizes.p12),
                child: Column(
                  children: [
                    gapH12,
                    CustomCarouselSlider(
                      value: sliders,
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
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(Sizes.p12)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      // spreadRadius: 1,
                                      blurRadius: 8,
                                      offset: Offset(
                                          0, 2), // changes position of shadow
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
                          right: SizeConfig.screenWidth / 2 -
                              Sizes.p96 / 2 -
                              Sizes.p12,
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
                    gapH16,
                    HomePackagesWidget(
                      packages: packages,
                    ),
                    gapH16,
                  ],
                ),
              ),
            ]),
          ),
      ],
    ));
  }
}
