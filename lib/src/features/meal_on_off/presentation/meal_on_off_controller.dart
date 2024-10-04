import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../exception/app_exception.dart';
import '../../authentication/data/auth_repository.dart';
import '../data/meal_on_off_repository.dart';
part 'meal_on_off_controller.g.dart';

@riverpod
class MealOnOffController extends _$MealOnOffController {
  @override
  FutureOr<void> build() async {
    return;
  }

  Future<bool> postMealOff({
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
      () => repo.postMealOff(
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
