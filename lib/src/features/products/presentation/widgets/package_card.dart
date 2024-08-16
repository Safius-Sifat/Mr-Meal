// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../constants/app_sizes.dart';
import '../../../../constants/constants.dart';
import '../../../../utils/size_config.dart';
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
    return Container(
      width: getProportionateScreenWidth(70),
      padding: const EdgeInsets.all(Sizes.p4),
      decoration: BoxDecoration(
        color: neutralColor,
        border: Border.all(color: tertiaryColor),
        borderRadius: BorderRadius.circular(Sizes.p8),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(children: [
            SizedBox(
              height: getProportionateScreenWidth(42),
              width: getProportionateScreenWidth(60),
              child: Photo(assetName),
            ),
            Positioned(
              top: 2,
              right: 2,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  color: tertiaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                ),
                child: const Icon(Icons.favorite_outline,
                    color: Colors.black, size: Sizes.p8),
              ),
            ),
          ]),
          gapH8,
          Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          gapH4,
          Text(
            description,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall,
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
    );
  }
}
