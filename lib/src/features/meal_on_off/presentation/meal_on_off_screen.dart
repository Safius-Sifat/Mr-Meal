import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../common_widgets/primary_button.dart';
import '../../../constants/app_sizes.dart';
import '../../../constants/constants.dart';
import '../../../l10n/string_hardcoded.dart';
import '../../products/data/item_repository.dart';
import '../../products/presentation/home/carousel_slider.dart';
import 'calendar_grid.dart';

class MealOnOffScreen extends ConsumerWidget {
  const MealOnOffScreen({super.key});

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
            child: Text('Meal On/Off'.hardcoded),
          ),
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
                const CalendarGrid(),
                gapH24,
                PrimaryButton(
                  width: 120,
                  onPressed: () {},
                  text: 'Meal off'.hardcoded,
                ),
                gapH12
              ],
            ),
          ),
        ));
  }
}
