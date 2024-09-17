// import 'package:location/location.dart';
// import 'package:riverpod_annotation/riverpod_annotation.dart';
//
// import '../../../exception/app_exception.dart';
// import '../../../utils/location_provider.dart';
// part 'location_repository.g.dart';
//
// class LocationRepository {
//   final Location location;
//   const LocationRepository(this.location);
//   Future<LocationData> getCurrentLocation() async {
//     final permissionGranted = await location.requestPermission();
//     if (permissionGranted != PermissionStatus.granted) {
//       throw LocationPermissionDeniedException();
//     }
//     final serviceEnabled = await location.serviceEnabled();
//     if (!serviceEnabled) {
//       await location.requestService();
//     }
//     return location.getLocation();
//   }
// }
//
// @riverpod
// LocationRepository locationRepository(LocationRepositoryRef ref) {
//   final location = ref.watch(locationProvider);
//   return LocationRepository(location);
// }
//
// @riverpod
// Future<LocationData> currentLocation(CurrentLocationRef ref) async {
//   return ref.read(locationRepositoryProvider).getCurrentLocation();
// }
