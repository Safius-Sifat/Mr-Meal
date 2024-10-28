import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../exception/app_exception.dart';
import '../../data/auth_repository.dart';

part 'change_password_controller.g.dart';

@riverpod
class ChangePasswordController extends _$ChangePasswordController {
  @override
  FutureOr<void> build() async {
    return;
  }

  Future<bool> changePassword(
      {required String newPassword, required String oldPassword}) async {
    final user = ref.read(authRepositoryProvider).currentUser;
    if (user == null) {
      throw UserNotAuthenticated();
    }

    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      return ref.read(authRepositoryProvider).changePassword(
            token: user.token,
            newPassword: newPassword,
            oldPassword: oldPassword,
          );
    });
    return !state.hasError;
  }
}
