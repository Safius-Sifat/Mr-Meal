import 'dart:async';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../constants/api_constants.dart';
import '../../../exception/app_exception.dart';
import '../../../utils/dio_provider.dart';
import '../../authentication/data/auth_repository.dart';
import '../domain/announcement.dart';
part 'announcement_repository.g.dart';

class AnnouncementRepository {
  AnnouncementRepository(this.client);

  final Dio client;

  Future<List<Announcement>> fetchAnnouncement(
      {required String token, CancelToken? cancelToken}) async {
    final uri = Uri(
      scheme: 'https',
      host: baseUrl,
      path: announcementUrl,
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
    return (response.data['announcements'] as List)
        .map((e) => Announcement.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}

@riverpod
AnnouncementRepository announcementRepository(AnnouncementRepositoryRef ref) {
  final dio = ref.watch(dioProvider);
  return AnnouncementRepository(dio);
}

@riverpod
Future<List<Announcement>> fetchAnnouncement(FetchAnnouncementRef ref) {
  final user = ref.read(authRepositoryProvider).currentUser;
  if (user == null) {
    throw UserNotAuthenticated();
  }
  final repo = ref.watch(announcementRepositoryProvider);
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
  return repo.fetchAnnouncement(token: user.token, cancelToken: cancelToken);
}
