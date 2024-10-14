import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/app_sizes.dart';
import '../../../constants/constants.dart';
import '../../../l10n/string_hardcoded.dart';
import '../data/report_repository.dart';

class RechargeHistoryScreen extends ConsumerWidget {
  const RechargeHistoryScreen({super.key});

  static const pageSize = 10;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemsListValue =
        ref.watch(fetchHistoryProvider(page: 1, type: 'Recharge'));
    final totalItems = itemsListValue.valueOrNull?.total;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: Sizes.p16, vertical: Sizes.p8),
          decoration: BoxDecoration(
              color: secondaryColor, borderRadius: BorderRadius.circular(8)),
          child: Text('Recharge History'.hardcoded),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(Sizes.p12),
        child: ListView.separated(
            itemBuilder: (_, index) {
              final page = index ~/ pageSize + 1;
              final indexInPage = index % pageSize;

              final itemsListValue =
                  ref.watch(fetchHistoryProvider(page: page, type: 'Recharge'));
              return itemsListValue.when(
                  data: (history) {
                    if (indexInPage >= history.data.length) {
                      return null;
                    }
                    final item = history.data[indexInPage];
                    return ListTile(
                      title: Text(item.totalPrice.toString()),
                      subtitle: Text(item.createdAt.toString()),
                      trailing: Text(item.status),
                    );
                  },
                  error: (e, st) => const Text(''),
                  loading: () => const ListTile(
                        title: Text('lasdjfl'),
                        subtitle: Text(';laksdfjl'),
                        trailing: Text(';laskdjf'),
                      ));
            },
            separatorBuilder: (_, index) => gapH12,
            itemCount: totalItems ?? 0),
      ),
    );
  }
}
