// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../constants/app_sizes.dart';
import '../../../../constants/constants.dart';

import '../../domain/features.dart';
import 'photo.dart';

class FeatureCard extends StatelessWidget {
  const FeatureCard({
    super.key,
    required this.feature,
  });

  final Feature feature;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: () {
            context.goNamed(feature.route.name);
          },
          child: Container(
            width: 56,
            height: 56,
            padding: const EdgeInsets.all(Sizes.p16),
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
            child: Photo(feature.image),
          ),
        ),
        gapH4,
        Text(feature.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  fontSize: 10,
                )),
      ],
    );
  }
}
