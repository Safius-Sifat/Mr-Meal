import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../common_widgets/error_message_widget.dart';
import '../../../common_widgets/primary_button.dart';
import '../../../constants/api_constants.dart';
import '../../../constants/app_sizes.dart';
import '../../../constants/constants.dart';
import '../../../l10n/string_hardcoded.dart';
import '../../../utils/async_value_ui.dart';
import '../../../utils/time_formatter.dart';
import '../../../utils/toastification.dart';
import '../../delivery_schedule/data/delivery_schedule_repository.dart';
import '../../products/data/item_repository.dart';
import '../../products/presentation/home/carousel_slider.dart';
import 'meal_count_container_widget.dart';
import 'meal_increase_container_widget.dart';
import 'meal_on_off_controller.dart';

class GuestMealScreen extends ConsumerStatefulWidget {
  const GuestMealScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _GuestMealScreenState();
}

class _GuestMealScreenState extends ConsumerState<GuestMealScreen> {
  List<int> mealCount = [1, 1, 1];
  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue<dynamic>>(
      guestMealControllerProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );
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
                  value:
                      ref.watch(fetchSlidersProvider(screen: guestMealParam)),
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
                      mealCount: mealCount[0].toString(),
                    ),
                    gapW8,
                    MealCountContainerWidget(
                      mealTime: 'Lunch'.hardcoded,
                      mealCount: mealCount[1].toString(),
                    ),
                    gapW8,
                    MealCountContainerWidget(
                      mealTime: 'Dinner'.hardcoded,
                      mealCount: mealCount[2].toString(),
                    ),
                  ],
                ),
                gapH16,
                Text(
                  'Select Guest Meal'.hardcoded,
                  style: const TextStyle(fontSize: Sizes.p12),
                ),
                gapH16,
                ref.watch(fetchMealSettingProvider).when(
                      data: (data) {
                        return Wrap(
                          spacing: Sizes.p8,
                          runSpacing: Sizes.p12,
                          alignment: WrapAlignment.center,
                          runAlignment: WrapAlignment.center,
                          children: List.generate(data.length, (index) {
                            final settings = data[index];

                            return MealIncreaseContainerWidget(
                              mealTime: settings.mealName,
                              timeRange:
                                  '${formatTime(settings.startTime)} - ${formatTime(settings.endTime)}',
                              mealCount: mealCount[index],
                              onChanged: (quantity) {
                                setState(() {
                                  mealCount[index] = quantity;
                                });
                              },
                            );
                          }),
                        );
                      },
                      error: (e, st) => ErrorMessageWidget(e),
                      loading: () => Skeletonizer(
                        child: MealIncreaseContainerWidget(
                          mealTime: 'Loading'.hardcoded,
                          timeRange: 'Loading'.hardcoded,
                          mealCount: 0,
                          onChanged: (quantity) {},
                        ),
                      ),
                    ),
                gapH24,
                PrimaryButton(
                  isLoading: ref.watch(guestMealControllerProvider).isLoading,
                  width: 150,
                  onPressed: () async {
                    final noOfMeals =
                        mealCount.fold<int>(0, (a, b) => a + b) - 3;
                    if (noOfMeals == 0) {
                      successToast(
                          ctx: context, title: 'Please add meals first');
                      return;
                    }
                    final success = await ref
                        .read(guestMealControllerProvider.notifier)
                        .addGuestMeal(
                          noOfMeals: noOfMeals.toString(),
                          startDate: DateTime.now().toString(),
                          endDate: DateTime.now().toString(),
                        );
                    if (success) {
                      successToast(
                          ctx: context, title: 'Guest Meal added successfully');
                    }
                  },
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
