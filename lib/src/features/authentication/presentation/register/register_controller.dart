import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/auth_repository.dart';

part 'register_controller.g.dart';

@riverpod
class RegisterController extends _$RegisterController {
  @override
  FutureOr<void> build() async {}

  final _cancelToken = CancelToken();
  //  ref.onDispose(() {
  //   cancelToken.cancel();
  // });

  Future<bool> registerWithEmailPassword(
    String name,
    String email,
    String phone,
    String password,
    String confirmPassword,
  ) async {
    final repo = ref.watch(authRepositoryProvider);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => repo.registerWithEmailPassword(
          name,
          email,
          phone,
          password,
          confirmPassword,
          _cancelToken,
        ));
    ref.onDispose(_cancelToken.cancel);
    return !state.hasError;
  }
}
