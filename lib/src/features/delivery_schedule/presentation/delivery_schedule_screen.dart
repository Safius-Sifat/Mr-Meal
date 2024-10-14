import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/api_constants.dart';
import '../../../constants/app_sizes.dart';
import '../../../constants/constants.dart';
import '../../../l10n/string_hardcoded.dart';
import '../../meal_on_off/doamin/meal_settings.dart';
import '../../products/data/item_repository.dart';
import '../../products/presentation/home/carousel_slider.dart';
import '../data/delivery_schedule_repository.dart';

class DeliveryScheduleScreen extends ConsumerWidget {
  const DeliveryScheduleScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final schedule = ref.watch(fetchMealSettingProvider);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Container(
            padding: const EdgeInsets.symmetric(
                horizontal: Sizes.p16, vertical: Sizes.p8),
            decoration: BoxDecoration(
                color: secondaryColor, borderRadius: BorderRadius.circular(8)),
            child: Text('Delivery Schedule'.hardcoded),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.p12),
            child: Column(
              children: [
                CustomCarouselSlider(
                  value: ref.watch(
                      fetchSlidersProvider(screen: deliveryScheduleParam)),
                ),
                gapH12,
                schedule.when(
                  data: (data) {
                    return const ScheduleRowWidget();
                  },
                  loading: () => const ScheduleRowWidget(),
                  error: (error, stack) => const ScheduleRowWidget(),
                ),
                gapH20,
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

class ScheduleRowWidget extends StatelessWidget {
  const ScheduleRowWidget({
    super.key,
    this.meal,
  });
  final MealSetting? meal;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        gapH16,
        Text(
          meal != null
              ? meal!.mealName
              : 'Breakfast delivery schedule'.hardcoded,
          style: const TextStyle(fontSize: Sizes.p12),
        ),
        gapH12,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('From'.hardcoded),
            Container(
              height: Sizes.p48,
              constraints: const BoxConstraints(maxWidth: 130),
              margin: const EdgeInsets.symmetric(
                horizontal: Sizes.p8,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: tertiaryColor,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(Sizes.p12),
              ),
              child: Center(
                child: Text(
                  meal != null ? meal!.startTime : '09:30:17 AM'.hardcoded,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: Sizes.p16,
                  ),
                ),
              ),
            ),
            Text('To'.hardcoded),
            Container(
              height: Sizes.p48,
              constraints: const BoxConstraints(maxWidth: 130),
              margin: const EdgeInsets.symmetric(
                horizontal: Sizes.p8,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: tertiaryColor,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(Sizes.p12),
              ),
              child: Center(
                child: Text(
                  meal != null ? meal!.endTime : '09:30:17 AM'.hardcoded,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: Sizes.p16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
