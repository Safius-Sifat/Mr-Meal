import 'dart:async';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../constants/api_constants.dart';
import '../../../exception/app_exception.dart';
import '../../../utils/dio_provider.dart';
import '../../authentication/data/auth_repository.dart';
import '../domain/items.dart';
import '../domain/slider.dart';
part 'item_repository.g.dart';

class ItemRepository {
  final Dio _client;
  const ItemRepository({required Dio client}) : _client = client;
  Future<List<SliderModel>> fetchSliders(
      String token, CancelToken? cancelToken) async {
    final uri = Uri(
      scheme: 'https',
      host: baseUrl,
      path: sliderUrl,
      queryParameters: {'page_name': 'Home Page'},
    );
    final response = await _client.get(
      uri.toString(),
      cancelToken: cancelToken,
      options: Options(
        headers: {'token': 'Bearer $token'},
      ),
    );
    return (response.data['sliders'] as List)
        .map((e) => SliderModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<Items> fetchItems(
      int page, String token, CancelToken? cancelToken) async {
    final uri = Uri(
      scheme: 'https',
      host: baseUrl,
      path: itemsUrl,
      queryParameters: {'page': '$page'},
    );
    final response = await _client.get(
      uri.toString(),
      cancelToken: cancelToken,
      options: Options(
        headers: {'token': 'Bearer $token'},
      ),
    );
    return Items.fromJson(response.data['items'] as Map<String, dynamic>);
  }
}

@riverpod
ItemRepository itemRepository(ItemRepositoryRef ref) {
  return ItemRepository(client: ref.watch(dioProvider));
}

@riverpod
Future<List<SliderModel>> fetchSliders(FetchSlidersRef ref) {
  final user = ref.watch(authRepositoryProvider).currentUser;
  if (user == null) {
    throw UserNotFoundException();
  }
  final repo = ref.watch(itemRepositoryProvider);
  final cancelToken = CancelToken();
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
  return repo.fetchSliders(user.token, cancelToken);
}

@riverpod
Future<Items> fetchItems(FetchItemsRef ref, {required int page}) {
  final user = ref.watch(authRepositoryProvider).currentUser;
  if (user == null) {
    throw UserNotFoundException();
  }
  final repo = ref.watch(itemRepositoryProvider);
  final cancelToken = CancelToken();
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
  return repo.fetchItems(page, user.token, cancelToken);
}
