import 'dart:async';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../constants/api_constants.dart';
import '../../../exception/app_exception.dart';
import '../../../utils/dio_provider.dart';
import '../../authentication/data/auth_repository.dart';
import '../domain/profile.dart';
part 'profile_repository.g.dart';

class ProfileRepository {
  ProfileRepository(this.client, this.imagePicker);

  final Dio client;
  final ImagePicker imagePicker;

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

  Future<void> uploadImage(
      {required String token, required String imagePath}) async {
    final uri = Uri(
      scheme: 'https',
      host: baseUrl,
      path: updateProfileUrl,
    );

    await client.postUri(
      uri,
      data: FormData.fromMap({
        'image': await MultipartFile.fromFile(
          imagePath,
          filename: imagePath.split('/').last,
          contentType: MediaType('image', 'jpeg'),
        ),
      }),
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      ),
    );
  }

  Future<String?> pickImage(ImageSource source) async {
    final XFile? image = await imagePicker.pickImage(
      source: source,
      imageQuality: 50,
      maxWidth: 500,
      maxHeight: 500,
    );
    return image?.path;
  }
}

@riverpod
ProfileRepository profileRepository(ProfileRepositoryRef ref) {
  final dio = ref.watch(dioProvider);
  final imagePicker = ref.watch(imagePickerProvider);
  return ProfileRepository(dio, imagePicker);
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

@riverpod
ImagePicker imagePicker(ImagePickerRef ref) {
  return ImagePicker();
}
