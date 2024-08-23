import 'package:flutter/material.dart';

import '../../../../constants/app_sizes.dart';
import '../../../../constants/constants.dart';
import '../../../../constants/package_list.dart';
import '../widgets/package_card.dart';

class PackageType extends StatelessWidget {
  const PackageType({
    super.key,
    required this.type,
  });
  final String type;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(Sizes.p8),
        decoration: const BoxDecoration(
            color: tertiaryColor,
            borderRadius: BorderRadius.all(Radius.circular(Sizes.p12)),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                // spreadRadius: 1,
                blurRadius: 8,
                offset: Offset(0, 2), // changes position of shadow
              ),
            ]),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.p12, vertical: Sizes.p8),
              decoration: BoxDecoration(
                  color: neutralColor, borderRadius: BorderRadius.circular(8)),
              child: Text(
                type,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            gapH16,
            Row(
              children: List.generate(2, (index) {
                return PackageCard(
                  title: kPackages[index].name,
                  assetName: kPackages[index].image,
                  description: kPackages[index].description,
                  price: kPackages[index].price,
                  pastPrice: kPackages[index].pastPrice,
                );
              }),
            ),
          ],
        ));
  }
}
