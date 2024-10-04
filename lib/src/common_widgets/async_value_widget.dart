import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../constants/app_sizes.dart';
import 'error_message_widget.dart';

class AsyncValueWidget<T> extends StatelessWidget {
  const AsyncValueWidget(
      {super.key,
      required this.value,
      required this.data,
      this.errorButton,
      this.loading = const Center(child: CircularProgressIndicator())});

  final AsyncValue<T> value;
  final Widget Function(T) data;
  final Widget loading;
  final Widget? errorButton;

  @override
  Widget build(BuildContext context) {
    return value.when(
      skipLoadingOnRefresh: false,
      data: data,
      error: (e, st) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ErrorMessageWidget(e),
            if (errorButton != null) gapH12,
            if (errorButton != null) errorButton!,
          ],
        ),
      ),
      loading: () => loading,
    );
  }
}
