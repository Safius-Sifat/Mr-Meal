import 'package:flutter/material.dart';

import '../../../../constants/app_sizes.dart';
import '../../../../constants/constants.dart';
import '../../domain/package_by_category.dart';
import 'package_card.dart';

class PackageType extends StatelessWidget {
  const PackageType({
    super.key,
    required this.type,
  });
  final Category type;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 380,
      width: double.infinity,
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
              type.categoryName,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          gapH16,
          if (type.packages.data.isNotEmpty)
            SizedBox(
              height: 290,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final package = type.packages.data[index];
                    return PackageCard(data: package);
                  },
                  separatorBuilder: (context, index) => gapW8,
                  itemCount: type.packages.data.length),
            )
          else
            const Text('No packages available'),
        ],
      ),
    );
  }
}
