import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../exception/app_exception.dart';
import '../../authentication/data/auth_repository.dart';
import '../data/profile_repository.dart';

part 'profile_controller.g.dart';

@riverpod
class ProfileController extends _$ProfileController {
  @override
  FutureOr<void> build() async {
    return;
  }

  Future<String?> pickImage(ImageSource source) async {
    state = const AsyncValue.loading();
    try {
      final imagePath =
          await ref.read(profileRepositoryProvider).pickImage(source);
      state = const AsyncValue.data(null);
      return imagePath;
    } catch (e) {
      state = AsyncValue.error(e, StackTrace.current);
    }
    return null;
  }

  Future<bool> uploadImage(String imagePath) async {
    final user = ref.read(authRepositoryProvider).currentUser;
    if (user == null) {
      throw UserNotAuthenticated();
    }

    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      return ref.read(profileRepositoryProvider).uploadImage(
            token: user.token,
            imagePath: imagePath,
          );
    });
    return !state.hasError;
  }
}
