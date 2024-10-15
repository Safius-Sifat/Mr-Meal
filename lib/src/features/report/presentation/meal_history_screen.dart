import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../common_widgets/error_message_widget.dart';
import '../../../constants/app_sizes.dart';
import '../../../constants/constants.dart';
import '../../../l10n/string_hardcoded.dart';
import '../data/report_repository.dart';

class MealHistoryScreen extends ConsumerWidget {
  const MealHistoryScreen({super.key});

  static const pageSize = 10;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemsListValue =
        ref.watch(fetchHistoryProvider(page: 1, type: 'Purchase Product'));
    final totalItems = itemsListValue.valueOrNull?.total ?? 0;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: Sizes.p16, vertical: Sizes.p8),
          decoration: BoxDecoration(
              color: secondaryColor, borderRadius: BorderRadius.circular(8)),
          child: Text('Order History'.hardcoded),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(Sizes.p12),
        child: totalItems == 0
            ? const Center(
                child: Text('You have not ordered anything yet'),
              )
            : ListView.separated(
                itemBuilder: (_, index) {
                  final page = index ~/ pageSize + 1;
                  final indexInPage = index % pageSize;

                  final itemsListValue = ref.watch(fetchHistoryProvider(
                      page: page, type: 'Purchase Product'));
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
                            'Ordered at ${DateFormat('d MMM, h:mm a').format(item.createdAt)}',
                          ),
                          trailing: Text(item.status),
                          shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(color: Colors.grey.shade300),
                          ),
                        );
                      },
                      error: (e, st) => ErrorMessageWidget(e),
                      loading: () => Skeletonizer(
                            child: ListTile(
                              title: const Text('lasdjfl'),
                              subtitle: const Text(';laksdfjl'),
                              trailing: const Text(';laskdjf'),
                              shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide:
                                    BorderSide(color: Colors.grey.shade300),
                              ),
                            ),
                          ));
                },
                separatorBuilder: (_, index) => gapH12,
                itemCount: totalItems),
      ),
    );
  }
}
