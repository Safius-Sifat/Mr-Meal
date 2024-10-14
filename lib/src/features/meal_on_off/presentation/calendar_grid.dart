import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../constants/app_sizes.dart';
import '../../../constants/constants.dart';
import 'dropdown.dart';
import 'meal_on_off_controller.dart';

class CalendarGrid extends ConsumerWidget {
  CalendarGrid({super.key});

  final DateTime firstDay = DateTime.now().add(const Duration(days: 1));
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fromDate = ref.watch(fromDateProvider);
    final toDate = ref.watch(toDateProvider);
    final fromDateDayTime = ref.watch(fromDateDayTimeProvider);
    final toDateDayTime = ref.watch(toDateDayTimeProvider);
    return LayoutBuilder(builder: (context, constraints) {
      final width = constraints.maxWidth;
      // 1 column for width < 500px
      // then add one more column for each 250px
      final crossAxisCount = max(1, width ~/ 300);
      // print(crossAxisCount);
      // once the crossAxisCount is known, calculate the column and row sizes
      // set some flexible track sizes based on the crossAxisCount with 1.fr
      final columnSizes = List.generate(crossAxisCount, (_) => 1.fr);
      final numRows = (2 / crossAxisCount).ceil();
      // set all the row sizes to auto (self-sizing height)
      final rowSizes = List.generate(numRows, (_) => auto);
      return LayoutGrid(
        columnSizes: columnSizes,
        rowSizes: rowSizes,
        rowGap: Sizes.p24, // equivalent to mainAxisSpacing
        columnGap: Sizes.p24, // equivalent to crossAxisSpacing
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Meal off from',
                style:
                    TextStyle(fontSize: Sizes.p20, fontWeight: FontWeight.w500),
              ),
              gapH8,
              Container(
                height: 300,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(
                  horizontal: Sizes.p12,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: tertiaryColor,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(Sizes.p12),
                ),
                child: TableCalendar(
                  shouldFillViewport: true,
                  headerStyle: const HeaderStyle(
                    titleCentered: true,
                    formatButtonVisible: false,
                  ),
                  calendarStyle: const CalendarStyle(
                    todayDecoration: BoxDecoration(
                      color: primaryColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  currentDay: fromDate,
                  firstDay: firstDay,
                  lastDay: DateTime.utc(2030, 12, 31),
                  focusedDay: fromDate,
                  onDaySelected: (date, time) {
                    ref.read(fromDateProvider.notifier).update(date);
                  },
                ),
              ),
              gapH12,
              Container(
                height: Sizes.p48,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(
                  horizontal: Sizes.p12,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: tertiaryColor,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(Sizes.p24),
                ),
                child: Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Select Daytime',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: Sizes.p16,
                        ),
                      ),
                    ),
                    const VerticalDivider(
                      thickness: 2,
                      color: tertiaryColor,
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: Sizes.p8),
                        child: CustomDropDown(
                          selectedValue: fromDateDayTime,
                          onChange: (value) {
                            if (value == null) return;
                            ref
                                .read(fromDateDayTimeProvider.notifier)
                                .update(value);
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Until',
                style:
                    TextStyle(fontSize: Sizes.p20, fontWeight: FontWeight.w500),
              ),
              gapH8,
              Container(
                height: 300,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(
                  horizontal: Sizes.p12,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: tertiaryColor,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(Sizes.p12),
                ),
                child: TableCalendar(
                  shouldFillViewport: true,
                  headerStyle: const HeaderStyle(
                    titleCentered: true,
                    formatButtonVisible: false,
                  ),
                  calendarStyle: const CalendarStyle(
                    todayDecoration: BoxDecoration(
                      color: primaryColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                  currentDay: toDate,
                  firstDay: firstDay,
                  lastDay: DateTime.utc(2030, 12, 31),
                  focusedDay: toDate,
                  onDaySelected: (date, time) {
                    ref.read(toDateProvider.notifier).update(date);
                  },
                ),
              ),
              gapH12,
              Container(
                height: Sizes.p48,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(
                  horizontal: Sizes.p12,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: tertiaryColor,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(Sizes.p24),
                ),
                child: Row(
                  children: [
                    const Expanded(
                      child: Text(
                        'Select Daytime',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: Sizes.p16,
                        ),
                      ),
                    ),
                    const VerticalDivider(
                      thickness: 2,
                      color: tertiaryColor,
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsets.symmetric(horizontal: Sizes.p8),
                        child: CustomDropDown(
                          selectedValue: toDateDayTime,
                          onChange: (value) {
                            if (value == null) return;
                            ref
                                .read(toDateDayTimeProvider.notifier)
                                .update(value);
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      );
    });
  }
}
