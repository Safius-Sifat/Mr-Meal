// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import '../../constants/app_sizes.dart';
import '../../constants/constants.dart';

import '../../utils/size_config.dart';
import 'photo.dart';

class FeatureCard extends StatelessWidget {
  const FeatureCard({
    super.key,
    required this.assetName,
    required this.title,
  });
  final String assetName;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: getProportionateScreenWidth(54),
          height: getProportionateScreenWidth(54),
          padding: const EdgeInsets.all(15),
          decoration: const BoxDecoration(
              color: tertiaryColor,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: tertiaryColor,
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ]),
          child: Photo(assetName),
        ),
        gapH4,
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }
}
