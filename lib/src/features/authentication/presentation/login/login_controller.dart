import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/auth_repository.dart';

part 'login_controller.g.dart';

@riverpod
class LoginController extends _$LoginController {
  @override
  FutureOr<void> build() async {}
  final cancelToken = CancelToken();
  Future<bool> loginWithEmailAndPassword(String email, String password) async {
    final repo = ref.watch(authRepositoryProvider);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
        () => repo.loginWithEmailAndPassword(email, password, cancelToken));
    ref.onDispose(cancelToken.cancel);
    return !state.hasError;
  }
}
