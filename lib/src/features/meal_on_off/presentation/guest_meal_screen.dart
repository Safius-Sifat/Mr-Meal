import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common_widgets/primary_button.dart';
import '../../../constants/app_sizes.dart';
import '../../../constants/constants.dart';
import '../../../l10n/string_hardcoded.dart';
import '../../products/data/item_repository.dart';
import '../../products/presentation/home/carousel_slider.dart';
import 'meal_count_container_widget.dart';
import 'meal_increase_container_widget.dart';

class GuestMealScreen extends ConsumerWidget {
  const GuestMealScreen({super.key});

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
            child: Text('Guest Meal'.hardcoded),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.p12),
            child: Column(
              children: [
                CustomCarouselSlider(
                  value: ref.watch(fetchSlidersProvider(screen: 'Home Page')),
                ),
                gapH12,
                Text(
                  'Your todays meal'.hardcoded,
                  style: const TextStyle(fontSize: Sizes.p12),
                ),
                gapH12,
                Wrap(
                  alignment: WrapAlignment.center,
                  runAlignment: WrapAlignment.center,
                  spacing: Sizes.p8,
                  runSpacing: Sizes.p12,
                  children: [
                    MealCountContainerWidget(
                      mealTime: 'Breakfast'.hardcoded,
                      mealCount: '1'.hardcoded,
                    ),
                    gapW8,
                    MealCountContainerWidget(
                      mealTime: 'Lunch'.hardcoded,
                      mealCount: '2'.hardcoded,
                    ),
                    gapW8,
                    MealCountContainerWidget(
                      mealTime: 'Dinner'.hardcoded,
                      mealCount: '3'.hardcoded,
                    ),
                  ],
                ),
                gapH16,
                Text(
                  'Select Guest Meal'.hardcoded,
                  style: const TextStyle(fontSize: Sizes.p12),
                ),
                gapH16,
                Wrap(
                  spacing: Sizes.p8,
                  runSpacing: Sizes.p12,
                  alignment: WrapAlignment.center,
                  runAlignment: WrapAlignment.center,
                  children: [
                    MealIncreaseContainerWidget(
                      mealTime: 'Breakfast'.hardcoded,
                      mealCount: 1,
                    ),
                    MealIncreaseContainerWidget(
                      mealTime: 'Lunch'.hardcoded,
                      mealCount: 2,
                    ),
                    MealIncreaseContainerWidget(
                      mealTime: 'Dinner'.hardcoded,
                      mealCount: 3,
                    ),
                  ],
                ),
                gapH24,
                PrimaryButton(
                  width: 150,
                  onPressed: () {},
                  text: 'Submit Order'.hardcoded,
                ),
                gapH16,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Condition'.hardcoded,
                        style: Theme.of(context).textTheme.titleLarge),
                    gapH8,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text('• '),
                        Expanded(
                          child: Text(
                              'You can only order 3 meals per day'.hardcoded),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        const Text('• '),
                        Expanded(
                          child: Text('You have to recharge before'.hardcoded),
                        ),
                      ],
                    ),
                  ],
                ),
                gapH12,
              ],
            ),
          ),
        ));
  }
}
