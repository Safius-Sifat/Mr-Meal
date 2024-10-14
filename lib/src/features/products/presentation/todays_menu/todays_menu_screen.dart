import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';

import '../../../../common_widgets/error.dart';
import '../../../../constants/api_constants.dart';
import '../../../../constants/app_sizes.dart';
import '../../../../constants/constants.dart';
import '../../data/item_repository.dart';
import '../../domain/todays_meal.dart';
import '../home/carousel_slider.dart';
import '../widgets/notification_widget.dart';
import 'todays_menu_grid.dart';

class TodaysMenuScreen extends ConsumerWidget {
  const TodaysMenuScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(fetchTodaysMealProvider);
    final sliderState =
        ref.watch(fetchSlidersProvider(screen: todaysMenuParam));
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
      body: state.hasError || sliderState.hasError
          ? ErrorScreen(onRetry: () {
              ref.invalidate(fetchSlidersProvider(screen: todaysMenuParam));
              ref.invalidate(fetchTodaysMealProvider);
            })
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(Sizes.p12),
                child: Column(
                  children: [
                    CustomCarouselSlider(
                      value: sliderState,
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
    required this.todaysMeal,
  });

  final TodaysMeal todaysMeal;
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
              todaysMeal.title,
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
              Text(todaysMeal.itemName,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge),
              gapH8,
              HtmlWidget(
                todaysMeal.longDescription,
                // customStylesBuilder: (element) {
                //   return {'text-align': 'center'};
                // },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
