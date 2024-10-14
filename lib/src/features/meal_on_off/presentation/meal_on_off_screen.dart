import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common_widgets/primary_button.dart';
import '../../../constants/api_constants.dart';
import '../../../constants/app_sizes.dart';
import '../../../constants/constants.dart';
import '../../../l10n/string_hardcoded.dart';
import '../../../utils/async_value_ui.dart';
import '../../../utils/toastification.dart';
import '../../products/data/item_repository.dart';
import '../../products/presentation/home/carousel_slider.dart';
import 'calendar_grid.dart';
import 'meal_on_off_controller.dart';

class MealOnOffScreen extends ConsumerWidget {
  const MealOnOffScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<dynamic>>(
      mealOnOffControllerProvider,
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
            child: Text('Meal On/Off'.hardcoded),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.p12),
            child: Column(
              children: [
                CustomCarouselSlider(
                  value:
                      ref.watch(fetchSlidersProvider(screen: mealOnOffParam)),
                ),
                gapH12,
                CalendarGrid(),
                gapH24,
                PrimaryButton(
                  width: 120,
                  isLoading: ref.watch(mealOnOffControllerProvider).isLoading,
                  onPressed: () async {
                    final success = await ref
                        .read(mealOnOffControllerProvider.notifier)
                        .postMealOff();
                    if (success) {
                      successToast(
                          ctx: context, title: 'Meal off successfully');
                    }
                  },
                  text: 'Meal off'.hardcoded,
                ),
                gapH12
              ],
            ),
          ),
        ));
  }
}
