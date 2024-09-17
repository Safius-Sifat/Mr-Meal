import 'dart:async';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../constants/api_constants.dart';
import '../../../utils/dio_provider.dart';
import '../domain/item_detail.dart';
import '../domain/items.dart';
import '../domain/items_by_category.dart' hide Items;
import '../domain/slider.dart';
part 'item_repository.g.dart';

class ItemRepository {
  final Dio _client;
  const ItemRepository({required Dio client}) : _client = client;
  Future<List<SliderModel>> fetchSliders(CancelToken? cancelToken) async {
    final uri = Uri(
      scheme: 'https',
      host: baseUrl,
      path: sliderUrl,
      queryParameters: {'page_name': 'Home Page'},
    );
    final response = await _client.getUri(
      uri,
      cancelToken: cancelToken,
    );
    return (response.data['sliders'] as List)
        .map((e) => SliderModel.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<Items> fetchItems(int page, CancelToken? cancelToken) async {
    final uri = Uri(
      scheme: 'https',
      host: baseUrl,
      path: itemsUrl,
      queryParameters: {'page': '$page'},
    );
    final response = await _client.getUri(
      uri,
      cancelToken: cancelToken,
    );
    return Items.fromJson(response.data['items'] as Map<String, dynamic>);
  }

  Future<ItemDetail> getItemDetail(int id, CancelToken? cancelToken) async {
    final uri = Uri(
      scheme: 'https',
      host: baseUrl,
      path: itemDetailUrl,
      queryParameters: {'item_id': '$id'},
    );
    final response = await _client.getUri(
      uri,
      cancelToken: cancelToken,
    );
    return ItemDetail.fromJson(response.data['item'] as Map<String, dynamic>);
  }

  Future<ItemsByCategory> fetchItemsByCategory(CancelToken? cancelToken) async {
    final uri = Uri(
      scheme: 'https',
      host: baseUrl,
      path: itemByCategoryUrl,
    );
    final response = await _client.getUri(
      uri,
      cancelToken: cancelToken,
    );
    return ItemsByCategory.fromJson(
        response.data['data'] as Map<String, dynamic>);
  }
}

@riverpod
ItemRepository itemRepository(ItemRepositoryRef ref) {
  return ItemRepository(client: ref.watch(dioProvider));
}

@riverpod
Future<List<SliderModel>> fetchSliders(FetchSlidersRef ref) {
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
  return repo.fetchSliders(cancelToken);
}

@riverpod
Future<Items> fetchItems(FetchItemsRef ref, {required int page}) {
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
  return repo.fetchItems(page, cancelToken);
}

@riverpod
Future<ItemDetail> getItemDetail(GetItemDetailRef ref, {required int id}) {
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
  return repo.getItemDetail(id, cancelToken);
}

@riverpod
Future<ItemsByCategory> fetchItemsByCategory(FetchItemsByCategoryRef ref) {
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
  return repo.fetchItemsByCategory(cancelToken);
}
