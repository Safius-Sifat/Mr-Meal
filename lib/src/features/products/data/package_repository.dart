import 'dart:async';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../constants/api_constants.dart';
import '../../../utils/dio_provider.dart';
import '../domain/package_category.dart';
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

  Future<List<PackageCategory>> fetchPackageCategories(
      CancelToken? cancelToken) async {
    final uri = Uri(
      scheme: 'https',
      host: baseUrl,
      path: packageCategoriesUrl,
    );
    final response = await _client.getUri(
      uri,
      cancelToken: cancelToken,
    );
    return (response.data['categories'] as List).map((e) {
      return PackageCategory.fromJson(e as Map<String, dynamic>);
    }).toList();
  }

  Future<Packages> fetchPackagesByCategory(
      {required int categoryId,
      CancelToken? cancelToken,
      required int page}) async {
    final uri = Uri(
      scheme: 'https',
      host: baseUrl,
      path: packagesUrl,
      queryParameters: {
        'per_page': '10',
        'package_category_id': '$categoryId',
        'page': '$page'
      },
    );
    final response = await _client.getUri(
      uri,
      cancelToken: cancelToken,
    );
    return Packages.fromJson(response.data['package'] as Map<String, dynamic>);
  }
}

@riverpod
PackageRepository packageRepository(PackageRepositoryRef ref) {
  return PackageRepository(client: ref.watch(dioProvider));
}

@riverpod
Future<Packages> fetchPackagesByCategory(FetchPackagesByCategoryRef ref,
    {required int categoryId, required int page}) {
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
  return repo.fetchPackagesByCategory(
      page: page, categoryId: categoryId, cancelToken: cancelToken);
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

@riverpod
Future<List<PackageCategory>> fetchPackageCategories(
    FetchPackageCategoriesRef ref) {
  final repo = ref.watch(packageRepositoryProvider);
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
  return repo.fetchPackageCategories(cancelToken);
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
