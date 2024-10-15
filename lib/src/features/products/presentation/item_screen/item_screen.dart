import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/api_constants.dart';
import '../../../../constants/app_sizes.dart';
import '../../../../constants/constants.dart';
import '../../data/item_repository.dart';
import '../home/carousel_slider.dart';
import '../widgets/notification_widget.dart';
import 'item_grid.dart';

class ItemScreen extends ConsumerWidget {
  const ItemScreen({super.key});

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
                value: ref.watch(fetchSlidersProvider(screen: allItemsParam)),
              ),
              gapH24,
              const ItemsGrid(),
            ],
          ),
        ),
      ),
    );
  }
}
