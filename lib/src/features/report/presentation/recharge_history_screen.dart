import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
    final totalItems = itemsListValue.valueOrNull?.total ?? 0;
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
        child: totalItems == 0
            ? Center(
                child: Text('No recharge history yet',
                    style: Theme.of(context).textTheme.titleMedium),
              )
            : ListView.separated(
                itemBuilder: (_, index) {
                  final page = index ~/ pageSize + 1;
                  final indexInPage = index % pageSize;

                  final itemsListValue = ref.watch(
                      fetchHistoryProvider(page: page, type: 'Recharge'));
                  return itemsListValue.when(
                      data: (history) {
                        if (indexInPage >= history.data.length) {
                          return null;
                        }
                        final item = history.data[indexInPage];
                        return ListTile(
                          title: Text(
                            '৳${NumberFormat('', 'bn').format(item.totalPrice)}',
                          ),
                          subtitle: Text(
                            'Recharged at ${DateFormat('d MMM, h:mm a').format(item.createdAt)}',
                          ),
                          trailing: Text(item.status),
                          shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                        );
                      },
                      error: (e, st) => const Text(''),
                      loading: () => const Skeletonizer(
                            child: ListTile(
                              title: Text('lasdjfl'),
                              subtitle: Text(';laksdfjl'),
                              trailing: Text(';laskdjf'),
                            ),
                          ));
                },
                separatorBuilder: (_, index) => gapH12,
                itemCount: totalItems),
      ),
    );
  }
}
