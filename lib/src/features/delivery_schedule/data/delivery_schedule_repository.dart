import 'dart:async';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../constants/api_constants.dart';
import '../../../exception/app_exception.dart';
import '../../../utils/dio_provider.dart';
import '../../authentication/data/auth_repository.dart';
import '../../meal_on_off/doamin/meal_settings.dart';
part 'delivery_schedule_repository.g.dart';

class DeliverScheduleRepository {
  DeliverScheduleRepository(this.client);

  final Dio client;

  Future<List<MealSetting>> fetchMealSetting(
      {required String token, CancelToken? cancelToken}) async {
    final uri = Uri(
      scheme: 'https',
      host: baseUrl,
      path: mealOnOffSettingsUrl,
    );
    final response = await client.getUri(
      uri,
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ),
    );
    return (response.data['meal_settings'] as List)
        .map((e) => MealSetting.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}

@riverpod
DeliverScheduleRepository deliveryScheduleRepository(
    DeliveryScheduleRepositoryRef ref) {
  final dio = ref.watch(dioProvider);
  return DeliverScheduleRepository(dio);
}

@riverpod
Future<List<MealSetting>> fetchMealSetting(FetchMealSettingRef ref) {
  final user = ref.read(authRepositoryProvider).currentUser;
  if (user == null) {
    throw UserNotAuthenticated();
  }
  final repo = ref.watch(deliveryScheduleRepositoryProvider);
  final cancelToken = CancelToken();
  ref.listenSelf((_, st) {
    if (st.hasValue) {
      final link = ref.keepAlive();
      Timer? timer;
      ref.onDispose(() {
        cancelToken.cancel();
        timer?.cancel();
      });
      ref.onCancel(() {
        timer = Timer(const Duration(seconds: 30), link.close);
      });
      ref.onResume(() {
        timer?.cancel();
      });
    }
  });
  return repo.fetchMealSetting(token: user.token, cancelToken: cancelToken);
}
