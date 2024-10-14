import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common_widgets/async_value_widget.dart';
import '../../../../constants/app_sizes.dart';
import '../../../../constants/constants.dart';
import '../../domain/packages.dart';
import 'home_package_card.dart';

class HomePackagesWidget extends ConsumerWidget {
  const HomePackagesWidget({
    super.key,
    required this.packages,
  });

  final AsyncValue<Packages> packages;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AsyncValueWidget<Packages>(
      value: packages,
      data: (packs) {
        return Container(
          height: 290,
          width: double.infinity,
          padding: const EdgeInsets.all(Sizes.p8),
          decoration: const BoxDecoration(
              color: tertiaryColor,
              borderRadius: BorderRadius.all(Radius.circular(Sizes.p12)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 8,
                  offset: Offset(0, 2), // changes position of shadow
                ),
              ]),
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final data = packs.data[index];
                return HomePackageCard(
                  data: data,
                );
              },
              separatorBuilder: (context, index) => gapW8,
              itemCount: packs.data.length),
        );
      },
    );
  }
}
