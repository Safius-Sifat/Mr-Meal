// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import '../../../../constants/app_sizes.dart';
import '../../../../constants/constants.dart';

import '../../../../utils/size_config.dart';
import 'photo.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({
    super.key,
    required this.assetName,
    required this.name,
  });
  final String assetName;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Stack(
          children: [
            SizedBox(
                width: getProportionateScreenWidth(67),
                height: getProportionateScreenWidth(43),
                child: Photo(assetName)),
            Positioned(
              top: 2,
              right: 2,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  color: tertiaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                ),
                child: const Icon(
                  Icons.favorite_outline,
                  color: Colors.black,
                  size: Sizes.p8,
                ),
              ),
            ),
          ],
        ),
        gapH4,
        Text(
          name,
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ],
    );
  }
}
