import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../exception/app_exception.dart';
import '../../authentication/data/auth_repository.dart';
import '../data/location_repository.dart';

part 'location_controller.g.dart';

@riverpod
class LocationController extends _$LocationController {
  @override
  FutureOr<void> build() async {
    return;
  }

  Future<bool> setLocation({
    required String locationType,
    String? primaryLocation,
    String? secondaryLocation,
    String? primaryLocLongitude,
    String? primaryLocLattitude,
    String? secondaryLocLattitude,
    String? secondaryLocLongitude,
  }) async {
    final user = ref.read(authRepositoryProvider).currentUser;
    if (user == null) {
      throw UserNotAuthenticated();
    }
    state = const AsyncLoading();
    final address = await ref.read(fetchAddressProvider.future);
    print(address);
    if (locationType == 'primary') {
      secondaryLocation = address.secondaryLocation;
      secondaryLocLongitude = address.secondaryLocLongitude;
      secondaryLocLattitude = address.secondaryLocLattitude;
    } else {
      primaryLocation = address.primaryLocation;
      primaryLocLongitude = address.primaryLocLongitude;
      primaryLocLattitude = address.primaryLocLattitude;
    }
    state = await AsyncValue.guard(() => ref
        .read(locationRepositoryProvider)
        .setAddress(
            token: user.token,
            primaryLocation: primaryLocation,
            secondaryLocation: secondaryLocation,
            primaryLocLongitude: primaryLocLongitude,
            primaryLocLattitude: primaryLocLattitude,
            secondaryLocLattitude: secondaryLocLattitude,
            secondaryLocLongitude: secondaryLocLongitude));
    return !state.hasError;
  }
}
