import 'dart:async';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../constants/api_constants.dart';
import '../../../utils/dio_provider.dart';
import '../domain/package_by_category.dart' hide Packages;
import '../domain/package_detail.dart';
import '../domain/packages.dart';
part 'package_repository.g.dart';

class PackageRepository {
  final Dio _client;
  const PackageRepository({required Dio client}) : _client = client;

  Future<PackageDetail> fetchPackageDetail(
      int id, CancelToken? cancelToken) async {
    final uri = Uri(
      scheme: 'https',
      host: baseUrl,
      path: packageDetailUrl,
      queryParameters: {'package_id': '$id'},
    );
    final response = await _client.getUri(
      uri,
      cancelToken: cancelToken,
    );
    return PackageDetail.fromJson(
        response.data['package'] as Map<String, dynamic>);
  }

  Future<Packages> fetchPackages(CancelToken? cancelToken) async {
    final uri = Uri(
      scheme: 'https',
      host: baseUrl,
      path: packagesUrl,
    );
    final response = await _client.getUri(
      uri,
      cancelToken: cancelToken,
    );
    return Packages.fromJson(response.data['package'] as Map<String, dynamic>);
  }

  Future<PackagesByCategory> fetchPackagesByCategory(
      CancelToken? cancelToken) async {
    final uri = Uri(
      scheme: 'https',
      host: baseUrl,
      path: packageByCategoryUrl,
      queryParameters: {'per_page': '10'},
    );
    final response = await _client.getUri(
      uri,
      cancelToken: cancelToken,
    );
    return PackagesByCategory.fromJson(
        response.data['data'] as Map<String, dynamic>);
  }
}

@riverpod
PackageRepository packageRepository(PackageRepositoryRef ref) {
  return PackageRepository(client: ref.watch(dioProvider));
}

@riverpod
Future<PackagesByCategory> fetchPackagesByCategory(
    FetchPackagesByCategoryRef ref) {
  final repo = ref.watch(packageRepositoryProvider);
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
  return repo.fetchPackagesByCategory(cancelToken);
}

@riverpod
Future<Packages> fetchPackages(FetchPackagesRef ref) {
  final repo = ref.watch(packageRepositoryProvider);
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
  return repo.fetchPackages(cancelToken);
}

//
@riverpod
Future<PackageDetail> getPackageDetail(GetPackageDetailRef ref,
    {required int id}) {
  final repo = ref.watch(packageRepositoryProvider);
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
  return repo.fetchPackageDetail(id, cancelToken);
}
