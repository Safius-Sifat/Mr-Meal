import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../constants/app_sizes.dart';
import '../../../../constants/constants.dart';
import '../../data/package_repository.dart';
import '../../domain/package_category.dart';
import 'package_card.dart';

class PackageType extends ConsumerWidget {
  const PackageType({
    super.key,
    required this.type,
  });
  final PackageCategory type;

  static const pageSize = 10;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final packagesList = ref
        .watch(fetchPackagesByCategoryProvider(page: 1, categoryId: type.id));

    final totalItems = packagesList.valueOrNull?.total ?? 0;
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
          SizedBox(
            height: 290,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final page = index ~/ pageSize + 1;
                  final indexInPage = index % pageSize;

                  final packagesList = ref.watch(
                      fetchPackagesByCategoryProvider(
                          page: page, categoryId: type.id));
                  return packagesList.when(
                      data: (packages) {
                        if (indexInPage >= packages.data.length) {
                          return null;
                        }
                        final item = packages.data[indexInPage];
                        return PackageCard(data: item);
                      },
                      error: (e, st) => const Text(''),
                      loading: () => const CircularProgressIndicator());
                },
                separatorBuilder: (context, index) => gapW8,
                itemCount: totalItems),
          )
        ],
      ),
    );
  }
}
