import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common_widgets/error.dart';
import '../../../../constants/api_constants.dart';
import '../../../../constants/app_sizes.dart';
import '../../../../constants/constants.dart';
import '../../../../constants/texts.dart';
import '../../data/item_repository.dart';
import '../../data/package_repository.dart';
import '../home/carousel_slider.dart';
import '../widgets/notification_widget.dart';
import 'package_grid.dart';

class AllPackageScreen extends ConsumerWidget {
  const AllPackageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final packageCategories = ref.watch(fetchPackageCategoriesProvider);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Container(
            padding: const EdgeInsets.symmetric(
                horizontal: Sizes.p16, vertical: Sizes.p8),
            decoration: BoxDecoration(
                color: secondaryColor, borderRadius: BorderRadius.circular(8)),
            child: const Text('Package'),
          ),
          actions: const [NotificationWidget(), gapW16],
        ),
        body: packageCategories.when(
          data: (data) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: Sizes.p12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomCarouselSlider(
                      value: ref.watch(
                          fetchSlidersProvider(screen: allPackagesParam)),
                    ),
                    gapH12,
                    PackageGrid(
                      categories: data,
                    ),
                    gapH24,
                    Text(
                      'N.B.',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    gapH12,
                    ...List.generate(packagesNBList.length, (index) {
                      return Text(
                        packagesNBList[index],
                        style: Theme.of(context).textTheme.titleMedium,
                      );
                    }),
                    gapH12,
                  ],
                ),
              ),
            );
          },
          error: (e, st) => ErrorScreen(
            error: e,
            onRetry: () {
              ref.invalidate(fetchPackageCategoriesProvider);
              ref.invalidate(fetchSlidersProvider(screen: allPackagesParam));
            },
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ));
  }
}
