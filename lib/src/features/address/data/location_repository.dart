import 'dart:async';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../constants/api_constants.dart';
import '../../../exception/app_exception.dart';
import '../../../utils/dio_provider.dart';
import '../../authentication/data/auth_repository.dart';
import '../domain/address.dart';
part 'location_repository.g.dart';

class LocationRepository {
  final Dio client;
  const LocationRepository(this.client);
  Future<Address> fetchAddress(
      {required String token, required CancelToken? cancelToken}) async {
    final uri = Uri(
      scheme: 'https',
      host: baseUrl,
      path: getUserLocationUrl,
    );
    final response = await client.getUri(
      uri,
      options: Options(headers: {'Authorization': 'Bearer $token'}),
      cancelToken: cancelToken,
    );
    return Address.fromJson(response.data['location'] as Map<String, dynamic>);
  }

  Future<void> setAddress({
    required String token,
    String? primaryLocation,
    String? secondaryLocation,
    String? primaryLocLongitude,
    String? primaryLocLattitude,
    String? secondaryLocLattitude,
    String? secondaryLocLongitude,
  }) async {
    final uri = Uri(
      scheme: 'https',
      host: baseUrl,
      path: postUserLocationUrl,
    );
    final response = await client.postUri(
      uri,
      options: Options(headers: {'Authorization': 'Bearer $token'}),
      data: {
        'primary_location': primaryLocation,
        'secondary_location': secondaryLocation,
        'primary_loc_longitude': primaryLocLongitude,
        'primary_loc_lattitude': primaryLocLattitude,
        'secondary_loc_lattitude': secondaryLocLattitude,
        'secondary_loc_longitude': secondaryLocLongitude,
      },
    );
  }
}

@riverpod
LocationRepository locationRepository(LocationRepositoryRef ref) {
  final dio = ref.read(dioProvider);
  return LocationRepository(dio);
}

@riverpod
FutureOr<Address> fetchAddress(FetchAddressRef ref) {
  final user = ref.read(authRepositoryProvider).currentUser;
  if (user == null) {
    throw UserNotAuthenticated();
  }
  final repo = ref.watch(locationRepositoryProvider);
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
  return repo.fetchAddress(token: user.token, cancelToken: cancelToken);
}
