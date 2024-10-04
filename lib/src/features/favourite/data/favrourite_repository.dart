import 'dart:async';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../constants/api_constants.dart';
import '../../../exception/app_exception.dart';
import '../../../utils/dio_provider.dart';
import '../../authentication/data/auth_repository.dart';
import '../domain/favourite_model.dart';

part 'favrourite_repository.g.dart';

class FavouriteRepository {
  final Dio client;
  const FavouriteRepository(this.client);
  Future<FavouriteModel> fetchFavourite(CancelToken? cancelToken,
      {required String token}) async {
    final uri = Uri(
      scheme: 'https',
      host: baseUrl,
      path: favouriteItemsUrl,
    );
    final response = await client.getUri(uri,
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token',
          },
        ),
        cancelToken: cancelToken);
    print(response.data);
    return FavouriteModel.fromJson(response.data as Map<String, dynamic>);
  }

  Future<void> addToFavourite(
      {required int id, required String type, required String token}) async {
    final uri = Uri(
      scheme: 'https',
      host: baseUrl,
      path: addToFavouriteUrl,
    );

    final response = await client.postUri(
      uri,
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ),
      data: type == 'package' ? {'package_id': id} : {'item_id': id},
    );
  }

  Future<void> removeFromFavourite(
      {required int id, required String token}) async {
    final uri = Uri(
      scheme: 'https',
      host: baseUrl,
      path: addToFavouriteUrl,
    );

    final response = await client.postUri(
      uri,
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ),
      data: {'favourite_id': id},
    );
  }
}

@riverpod
FavouriteRepository favouriteRepository(FavouriteRepositoryRef ref) {
  final dio = ref.read(dioProvider);
  return FavouriteRepository(dio);
}

@riverpod
FutureOr<FavouriteModel> fetchFavourite(FetchFavouriteRef ref) {
  final user = ref.read(authRepositoryProvider).currentUser;
  if (user == null) {
    throw UserNotAuthenticated();
  }
  final repo = ref.watch(favouriteRepositoryProvider);
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
  return repo.fetchFavourite(cancelToken, token: user.token);
}
