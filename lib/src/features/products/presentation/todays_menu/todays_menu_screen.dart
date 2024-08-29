import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_sizes.dart';
import '../../../../constants/constants.dart';
import '../../../../utils/size_config.dart';
import '../../data/item_repository.dart';
import '../home/carousel_slider.dart';
import '../widgets/notification_widget.dart';
import '../widgets/photo.dart';
import 'todays_menu_grid.dart';

class TodaysMenuScreen extends ConsumerWidget {
  const TodaysMenuScreen({super.key});

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
          child: const Text("Our Today's Menu"),
        ),
        actions: const [NotificationWidget(), gapW16],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Sizes.p12),
          child: Column(
            children: [
              CustomCarouselSlider(
                value: ref.watch(fetchSlidersProvider),
              ),
              gapH24,
              const TodaysMenuGrid(),
            ],
          ),
        ),
      ),
    );
  }
}

class MenuContainer extends StatelessWidget {
  const MenuContainer({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
              horizontal: Sizes.p12, vertical: Sizes.p8),
          decoration: BoxDecoration(
              color: tertiaryColor,
              borderRadius: BorderRadius.circular(Sizes.p8)),
          child: Center(
            child: Text(
              title,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
              horizontal: Sizes.p12, vertical: Sizes.p8),
          decoration: BoxDecoration(
              color: tertiaryColor,
              borderRadius: BorderRadius.circular(Sizes.p32)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.p12, vertical: Sizes.p8),
                margin: const EdgeInsets.all(Sizes.p8),
                decoration: BoxDecoration(
                    color: neutralColor,
                    borderRadius: BorderRadius.circular(Sizes.p16)),
                child: Center(
                  child: Text(
                    'Breakfast Item List',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.p12, vertical: Sizes.p8),
                margin: const EdgeInsets.all(Sizes.p8),
                decoration: BoxDecoration(
                    color: neutralColor,
                    borderRadius: BorderRadius.circular(Sizes.p16)),
                child: Center(
                  child: Text(
                    'Lunch Item List',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.p12, vertical: Sizes.p8),
                margin: const EdgeInsets.all(Sizes.p8),
                decoration: BoxDecoration(
                    color: neutralColor,
                    borderRadius: BorderRadius.circular(Sizes.p16)),
                child: Center(
                  child: Text(
                    'Dinner Item List',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
