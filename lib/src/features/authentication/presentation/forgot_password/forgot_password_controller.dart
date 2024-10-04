import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/auth_repository.dart';

part 'forgot_password_controller.g.dart';

@riverpod
class SendOtpController extends _$SendOtpController {
  @override
  FutureOr<void> build() async {
    return;
  }

  Future<bool> sendOtp(String email) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      return ref.read(authRepositoryProvider).sendOtp(email);
    });
    return !state.hasError;
  }
}

@riverpod
class PasswordResetController extends _$PasswordResetController {
  @override
  FutureOr<void> build() async {
    return;
  }

  Future<bool> resetPassword(String email, String code, String password) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      return ref
          .read(authRepositoryProvider)
          .forgotPasswordReset(email, code, password);
    });
    return !state.hasError;
  }
}
