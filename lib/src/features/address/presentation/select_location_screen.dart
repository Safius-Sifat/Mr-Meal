import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:place_picker_google/place_picker_google.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../common_widgets/primary_button.dart';
import '../../../constants/app_sizes.dart';
import '../../../constants/constants.dart';
import '../../../constants/texts.dart';
import '../../../l10n/string_hardcoded.dart';
import '../../../utils/async_value_ui.dart';
import '../../../utils/toastification.dart';
import '../data/location_repository.dart';
import 'location_controller.dart';

class SelectLocationScreen extends ConsumerWidget {
  const SelectLocationScreen({
    super.key,
    required this.locationType,
    this.latitude = '23.8041',
    this.longitude = '90.4152',
  });
  final String locationType;
  final String latitude;
  final String longitude;
  Future<void> _submit(
      BuildContext context, LocationResult selectedPlace, WidgetRef ref) async {
    if (locationType == 'primary') {
      final success =
          await ref.read(locationControllerProvider.notifier).setLocation(
                locationType: locationType,
                primaryLocation: selectedPlace.formattedAddress,
                primaryLocLongitude: selectedPlace.latLng?.longitude.toString(),
                primaryLocLattitude: selectedPlace.latLng?.latitude.toString(),
              );
      if (success && context.mounted) {
        context.pop();
        successToast(ctx: context, title: 'Primary location set successfully');

        ref.invalidate(fetchAddressProvider);
      }
    } else {
      final success = await ref
          .read(locationControllerProvider.notifier)
          .setLocation(
            locationType: locationType,
            secondaryLocation: selectedPlace.formattedAddress,
            secondaryLocLongitude: selectedPlace.latLng?.longitude.toString(),
            secondaryLocLattitude: selectedPlace.latLng?.latitude.toString(),
          );
      if (success && context.mounted) {
        Navigator.of(context).pop();
        successToast(
            ctx: context, title: 'Secondary location set successfully');

        ref.invalidate(fetchAddressProvider);
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<dynamic>>(
      locationControllerProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: Sizes.p16, vertical: Sizes.p8),
          decoration: BoxDecoration(
              color: secondaryColor, borderRadius: BorderRadius.circular(8)),
          child: Text('Location'.hardcoded),
        ),
      ),
      body: PlacePicker(
        apiKey: const String.fromEnvironment('MAP'),
        onPlacePicked: (LocationResult result) {
          debugPrint('Place picked: ${result.formattedAddress}');
        },
        initialLocation: LatLng(
          double.parse(latitude),
          double.parse(longitude),
        ),
        minMaxZoomPreference: const MinMaxZoomPreference(12, 20),
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        myLocationFABConfig: const MyLocationFABConfig(
          backgroundColor: secondaryColor,
          foregroundColor: Colors.black87,
          bottom: 100,
        ),
        selectedPlaceWidgetBuilder: (context, searchingState, selectedPlace) {
          if (selectedPlace == null) {
            return Skeletonizer(
              child: Container(
                decoration: BoxDecoration(
                  color: tertiaryColor,
                  borderRadius: BorderRadius.circular(Sizes.p12),
                ),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.p16, vertical: Sizes.p8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        loremIpsum.substring(0, 40),
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        loremIpsum.substring(0, 25),
                        style: const TextStyle(
                            fontSize: 16, color: Colors.black54),
                      ),
                      gapH8,
                      Align(
                        child: PrimaryButton(
                          width: 200,
                          onPressed: () async {},
                          text: 'Confirm location'.hardcoded,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }

          return Container(
            decoration: const BoxDecoration(
              color: tertiaryColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Sizes.p12),
                  topRight: Radius.circular(Sizes.p12)),
              boxShadow: [BoxShadow(blurRadius: 2, color: Colors.grey)],
            ),
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.p16, vertical: Sizes.p8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    selectedPlace.administrativeAreaLevel2?.shortName ?? '',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    selectedPlace.formattedAddress ?? '',
                    style: const TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  gapH12,
                  Align(
                    child: PrimaryButton(
                      width: 200,
                      onPressed: () async {
                        await _submit(context, selectedPlace, ref);
                      },
                      text: 'Confirm location'.hardcoded,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        enableNearbyPlaces: false,
        searchInputConfig: const SearchInputConfig(
          padding: EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          textDirection: TextDirection.ltr,
        ),
        searchInputDecorationConfig: SearchInputDecorationConfig(
          fillColor: neutralColor.withOpacity(0.8),
          hintText: 'Search for a building, street or ...',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Sizes.p12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
