import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:place_picker_google/place_picker_google.dart';

import '../../../common_widgets/primary_button.dart';
import '../../../constants/app_sizes.dart';
import '../../../constants/constants.dart';
import '../../../l10n/string_hardcoded.dart';

class SelectLocationScreen extends ConsumerWidget {
  const SelectLocationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        apiKey: Platform.isAndroid
            ? const String.fromEnvironment('MAP')
            : 'GOOGLE_MAPS_API_KEY_IOS',
        onPlacePicked: (LocationResult result) {
          debugPrint('Place picked: ${result.formattedAddress}');
        },
        initialLocation: const LatLng(
          23.8041,
          90.4152,
        ),
        minMaxZoomPreference: const MinMaxZoomPreference(12, 20),
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        myLocationFABConfig: const MyLocationFABConfig(
          backgroundColor: secondaryColor,
          foregroundColor: Colors.black87,
          bottom: 100,
        ),
        selectedPlaceWidgetBuilder: (context, selectedPlace) {
          selectedPlace ??= LocationResult();
          return Container(
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
                    selectedPlace.administrativeAreaLevel2?.shortName ??
                        'No name',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    selectedPlace.formattedAddress ?? 'No name',
                    style: const TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                  gapH8,
                  Align(
                    child: PrimaryButton(
                      width: 200,
                      onPressed: () {
                        Navigator.of(context).pop();
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
