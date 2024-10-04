import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:go_router/go_router.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../constants/app_sizes.dart';
import '../../../../constants/constants.dart';
import '../../../../utils/toastification.dart';
import '../../../address/data/location_repository.dart';
import '../../../address/domain/address.dart';
import '../../../address/presentation/select_location_screen.dart';
import '../widgets/photo.dart';

class SetLocationWidget extends ConsumerWidget {
  const SetLocationWidget({super.key});

  Future<void> setLocation(BuildContext context, Address address) async {
    final permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      errorToast(
          ctx: context,
          title: 'Location Permission Denied',
          description: 'Please enable location permission to continue');
    } else if (permission == LocationPermission.deniedForever) {
      errorToast(
          ctx: context,
          title: 'Location Permission Permanently Denied',
          description:
              'Please enable location permission from the app settings to continue');
    } else {
      await showModalBottomSheet(
          backgroundColor: tertiaryColor,
          context: context,
          builder: (context) {
            return DecoratedBox(
              decoration: const BoxDecoration(
                  color: tertiaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(Sizes.p12))),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (address.primaryLocation != null)
                    ListTile(
                      leading: const Icon(
                        Icons.location_on_rounded,
                        color: primaryColor,
                      ),
                      title: const Text('Primary Address'),
                      subtitle: Text(address.primaryLocation!),
                      onTap: () {
                        context.pop();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SelectLocationScreen(
                                  locationType: 'primary',
                                  latitude: address.primaryLocLattitude!,
                                  longitude: address.primaryLocLongitude!,
                                )));
                      },
                    ),
                  if (address.primaryLocation == null)
                    ListTile(
                      leading: const Icon(
                        Icons.add_location_alt_rounded,
                        color: primaryColor,
                      ),
                      splashColor: primaryColor.withOpacity(0.2),
                      title: const Text('Add primary address'),
                      onTap: () {
                        context.pop();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SelectLocationScreen(
                                  locationType: 'primary',
                                )));
                      },
                    ),
                  if (address.secondaryLocation != null)
                    ListTile(
                      leading: const Icon(
                        Icons.location_on_rounded,
                        color: primaryColor,
                      ),
                      title: const Text('Secondary Address'),
                      subtitle: Text(address.secondaryLocation!),
                      onTap: () {
                        context.pop();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SelectLocationScreen(
                                  locationType: 'secondary',
                                  latitude: address.secondaryLocLattitude!,
                                  longitude: address.secondaryLocLongitude!,
                                )));
                      },
                    ),
                  if (address.secondaryLocation == null)
                    ListTile(
                      leading: const Icon(
                        Icons.add_location_alt_rounded,
                        color: primaryColor,
                      ),
                      title: const Text('Add secondary address'),
                      onTap: () {
                        context.pop();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SelectLocationScreen(
                                  locationType: 'secondary',
                                )));

                        // context.goNamed(AppRoute.location.name,
                        //     pathParameters: {'locationType': 'secondary'});
                      },
                    ),
                ],
              ),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(fetchAddressProvider);
    return state.when(
      data: (address) {
        late final String thikana;
        try {
          if (address.primaryLocation != null) {
            final arr = address.primaryLocation!.split(',');
            thikana = '${arr[arr.length - 2]}, ${arr.last}';
          } else if (address.secondaryLocation != null) {
            final arr = address.secondaryLocation!.split(',');
            thikana = '${arr[arr.length - 2]}, ${arr.last}';
          } else {
            thikana = 'Select Location';
          }
        } catch (e) {
          thikana = address.primaryLocation ??
              address.secondaryLocation ??
              'Select Location';
        }
        return InkWell(
          onTap: () async {
            await setLocation(context, address);
          },
          borderRadius: BorderRadius.circular(Sizes.p8),
          child: SizedBox(
            height: 30,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: Sizes.p16,
                  width: Sizes.p16,
                  child: Photo(
                    location,
                  ),
                ),
                gapW4,
                Text(
                  thikana,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        );
      },
      error: (e, st) => InkWell(
        onTap: () {
          ref.invalidate(fetchAddressProvider);
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: Sizes.p16,
              width: Sizes.p16,
              child: Photo(
                location,
              ),
            ),
            gapW4,
            Text(
              'Select Location',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
      loading: () => Skeletonizer(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: Sizes.p16,
              width: Sizes.p16,
              child: Photo(
                location,
              ),
            ),
            gapW4,
            Text(
              'Dhaka, Bangladesh',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
