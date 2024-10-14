import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../exception/app_exception.dart';
import '../../authentication/data/auth_repository.dart';
import '../data/meal_on_off_repository.dart';
import 'dropdown.dart';
part 'meal_on_off_controller.g.dart';

@riverpod
class MealOnOffController extends _$MealOnOffController {
  @override
  FutureOr<void> build() async {
    return;
  }

  int? calculateMealNumber() {
    final fromDate = ref.watch(fromDateProvider);
    final toDate = ref.watch(toDateProvider);
    final fromDateDayTime = ref.watch(fromDateDayTimeProvider);
    final toDateDayTime = ref.watch(toDateDayTimeProvider);
    final diff = toDate.difference(fromDate).inDays;
    final fromIndex = fromDateDayTime.index;
    final toIndex = toDateDayTime.index;
    if (toIndex - fromIndex < 0) {
      state = AsyncValue.error(DayTimeSelectionException(), StackTrace.current);
      return null;
    }
    if (diff == 0) {
      return toIndex - fromIndex + 1;
    }
    return (diff + 1) * 3 - fromIndex + toIndex;
  }

  Future<bool> postMealOff() async {
    final user = ref.read(authRepositoryProvider).currentUser;
    if (user == null) {
      throw UserNotAuthenticated();
    }
    final repo = ref.watch(mealOnOffRepositoryProvider);
    final noOfMeals = calculateMealNumber();
    if (noOfMeals == null) {
      return false;
    }
    final startDate = ref.watch(fromDateProvider).toIso8601String();
    final endDate = ref.watch(toDateProvider).toIso8601String();
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () => repo.postMealOff(
        token: user.token,
        noOfMeals: noOfMeals.toString(),
        startDate: startDate,
        endDate: endDate,
      ),
    );
    return !state.hasError;
  }
}

@riverpod
class GuestMealController extends _$GuestMealController {
  @override
  FutureOr<void> build() async {
    return;
  }

  Future<bool> addGuestMeal({
    required String noOfMeals,
    required String startDate,
    required String endDate,
  }) async {
    final user = ref.read(authRepositoryProvider).currentUser;
    if (user == null) {
      throw UserNotAuthenticated();
    }
    final repo = ref.watch(mealOnOffRepositoryProvider);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () => repo.addGuestMeal(
        token: user.token,
        noOfMeals: noOfMeals,
        startDate: startDate,
        endDate: endDate,
      ),
    );
    return !state.hasError;
  }
}

@riverpod
class FromDate extends _$FromDate {
  @override
  DateTime build() {
    return DateTime.now().add(const Duration(days: 1));
  }

  void update(DateTime date) {
    state = date;

    if (ref.read(toDateProvider).isBefore(date)) {
      ref.read(toDateProvider.notifier).update(date);
    }
  }
}

@riverpod
class ToDate extends _$ToDate {
  @override
  DateTime build() {
    return DateTime.now().add(const Duration(days: 1));
  }

  void update(DateTime date) {
    if (date.isBefore(ref.read(fromDateProvider))) {
      return;
    }

    state = date;
  }
}

@riverpod
class FromDateDayTime extends _$FromDateDayTime {
  @override
  DayTime build() {
    return DayTime.breakfast;
  }

  void update(DayTime time) {
    state = time;
    // if (ref.watch(fromDateProvider).day == ref.watch(toDateProvider).day &&
    //     time.index > ref.read(toDateDayTimeProvider).index) {
    //   ref.read(toDateDayTimeProvider.notifier).update(time);
    // }
    // print('from date day time: $time');
    // print('to date day time: ${ref.watch(toDateDayTimeProvider)}');
  }
}

@riverpod
class ToDateDayTime extends _$ToDateDayTime {
  @override
  DayTime build() {
    return DayTime.breakfast;
  }

  void update(DayTime time) {
    // if (ref.watch(fromDateProvider).day == ref.watch(toDateProvider).day &&
    //     time.index < ref.watch(fromDateDayTimeProvider).index) {
    //   return;
    // }
    state = time;
    // print('to date day time: $time');
    // print(' from date day time: ${ref.watch(fromDateDayTimeProvider)}');
  }
}
