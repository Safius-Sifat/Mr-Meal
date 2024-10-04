import 'package:flutter/material.dart';

import '../../../constants/app_sizes.dart';
import '../../../constants/constants.dart';
import '../../address/domain/address.dart';

Future<String?> showAddressSelector(
    BuildContext context, Address address) async {
  return showModalBottomSheet<String?>(
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
                    Navigator.of(context).pop<String?>(address.primaryLocation);
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
                    Navigator.of(context)
                        .pop<String?>(address.secondaryLocation);
                  },
                ),
            ],
          ),
        );
      });
}
