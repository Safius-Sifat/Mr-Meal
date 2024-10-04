import 'dart:async';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../constants/api_constants.dart';
import '../../../utils/dio_provider.dart';
part 'meal_on_off_repository.g.dart';

class MealOnOffRepository {
  MealOnOffRepository(this.client);

  final Dio client;

  Future<void> postMealOff({
    required String token,
    required String noOfMeals,
    required String startDate,
    required String endDate,
  }) async {
    final uri = Uri(
      scheme: 'https',
      host: baseUrl,
      path: mealOnOffUrl,
    );
    await client.postUri(uri,
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
        data: {
          'no_of_meals': noOfMeals,
          'start_date': startDate,
          'end_date': endDate,
        });
  }

  Future<void> addGuestMeal({
    required String token,
    required String noOfMeals,
    required String startDate,
    required String endDate,
  }) async {
    final uri = Uri(
      scheme: 'https',
      host: baseUrl,
      path: guestMealUrl,
    );

    await client.postUri(uri,
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
        data: {
          'no_of_meals': noOfMeals,
          'start_date': startDate,
          'end_date': endDate,
        });
  }
}

@riverpod
MealOnOffRepository mealOnOffRepository(MealOnOffRepositoryRef ref) {
  final dio = ref.watch(dioProvider);
  return MealOnOffRepository(dio);
}
