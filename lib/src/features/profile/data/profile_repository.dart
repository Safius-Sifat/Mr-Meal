import 'dart:async';

import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../constants/api_constants.dart';
import '../../../exception/app_exception.dart';
import '../../../utils/dio_provider.dart';
import '../../authentication/data/auth_repository.dart';
import '../domain/profile.dart';
part 'profile_repository.g.dart';

class ProfileRepository {
  ProfileRepository(this.client);

  final Dio client;

  Future<Profile> fetchProfile(
      {required String token, CancelToken? cancelToken}) async {
    final uri = Uri(
      scheme: 'https',
      host: baseUrl,
      path: profileUrl,
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
    return Profile.fromJson(response.data['profile'] as Map<String, dynamic>);
  }

  Future<void> changePassword({
    required String token,
    required String newPassword,
    required String oldPassword,
  }) async {
    final uri = Uri(
      scheme: 'https',
      host: baseUrl,
      path: changePasswordUrl,
    );
    await client.postUri(
      uri,
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ),
      data: {
        'old_password': oldPassword,
        'new_password': newPassword,
        'password_confirmation': newPassword,
      },
    );
  }
}

@riverpod
ProfileRepository profileRepository(ProfileRepositoryRef ref) {
  final dio = ref.watch(dioProvider);
  return ProfileRepository(dio);
}

@riverpod
Future<Profile> fetchProfile(FetchProfileRef ref) {
  final user = ref.read(authRepositoryProvider).currentUser;
  if (user == null) {
    throw UserNotAuthenticated();
  }
  final repo = ref.watch(profileRepositoryProvider);
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
  return repo.fetchProfile(token: user.token, cancelToken: cancelToken);
}
