import 'package:flutter/material.dart';

import '../../../../constants/app_sizes.dart';
import '../../../../constants/constants.dart';
import 'photo.dart';
import 'primary_button.dart';
import 'secondary_button.dart';

class PackageCard extends StatelessWidget {
  const PackageCard({
    super.key,
    required this.assetName,
    required this.title,
    required this.description,
    required this.price,
    required this.pastPrice,
  });
  final String assetName;
  final String title;
  final String description;
  final String price;
  final String pastPrice;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(Sizes.p4),
        decoration: BoxDecoration(
          color: neutralColor,
          border: Border.all(color: tertiaryColor),
          borderRadius: BorderRadius.circular(Sizes.p8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(children: [
              AspectRatio(aspectRatio: 1.5, child: Photo(assetName)),
              Positioned(
                top: Sizes.p4,
                right: Sizes.p4,
                child: Container(
                  padding: const EdgeInsets.all(Sizes.p4),
                  decoration: const BoxDecoration(
                    color: tertiaryColor,
                    borderRadius: BorderRadius.all(Radius.circular(Sizes.p4)),
                  ),
                  child: const Icon(
                    Icons.favorite_outline,
                    color: Colors.black,
                    size: Sizes.p12,
                  ),
                ),
              ),
            ]),
            gapH8,
            Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            gapH4,
            Text(
              description,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            gapH8,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  pastPrice,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        decoration: TextDecoration.lineThrough,
                        fontSize: Sizes.p12,
                      ),
                ),
                gapW4,
                Text(
                  price,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: primaryColor,
                        fontSize: Sizes.p12,
                      ),
                ),
              ],
            ),
            gapH8,
            const SecondaryButton(),
            gapH8,
            const PrimaryButton(),
            gapH8,
          ],
        ),
      ),
    );
  }
}
