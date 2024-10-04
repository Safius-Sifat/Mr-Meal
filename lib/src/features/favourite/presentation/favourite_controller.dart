import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../exception/app_exception.dart';
import '../../authentication/data/auth_repository.dart';
import '../data/favrourite_repository.dart';
part 'favourite_controller.g.dart';

@riverpod
class AddToFavourite extends _$AddToFavourite {
  @override
  FutureOr<void> build() async {
    return;
  }

  Future<bool> addToFavourite(int id, String type) async {
    final user = ref.read(authRepositoryProvider).currentUser;
    if (user == null) {
      throw UserNotAuthenticated();
    }
    final repository = ref.read(favouriteRepositoryProvider);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
        () => repository.addToFavourite(id: id, type: type, token: user.token));
    return !state.hasError;
  }
}

@riverpod
class RemoveFavourite extends _$RemoveFavourite {
  @override
  FutureOr<void> build() async {
    return;
  }

  Future<bool> removeFromFavourite(int id) async {
    final user = ref.read(authRepositoryProvider).currentUser;
    if (user == null) {
      throw UserNotAuthenticated();
    }
    final repository = ref.read(favouriteRepositoryProvider);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
        () => repository.removeFromFavourite(id: id, token: user.token));
    return !state.hasError;
  }
}
