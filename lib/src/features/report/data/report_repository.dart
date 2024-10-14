import 'dart:async';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../constants/api_constants.dart';
import '../../../exception/app_exception.dart';
import '../../../utils/dio_provider.dart';
import '../../authentication/data/auth_repository.dart';
import '../domain/history_model.dart';
part 'report_repository.g.dart';

class ReportRepository {
  ReportRepository(this.client);

  final Dio client;

  Future<History> fetchHistory({
    required String token,
    CancelToken? cancelToken,
    required int page,
    required String type,
  }) async {
    final uri = Uri(
      scheme: 'https',
      host: baseUrl,
      path: orderHistoryUrl,
      queryParameters: {
        'page': '$page',
        'type': type,
      },
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
    return History.fromJson(response.data['data'] as Map<String, dynamic>);
  }
}

@riverpod
ReportRepository reportRepository(
  ReportRepositoryRef ref,
) {
  final dio = ref.watch(dioProvider);
  return ReportRepository(dio);
}

@riverpod
Future<History> fetchHistory(FetchHistoryRef ref,
    {required int page, required String type}) {
  final user = ref.read(authRepositoryProvider).currentUser;
  if (user == null) {
    throw UserNotAuthenticated();
  }
  final repo = ref.watch(reportRepositoryProvider);
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
  return repo.fetchHistory(
    token: user.token,
    cancelToken: cancelToken,
    page: page,
    type: type,
  );
}
