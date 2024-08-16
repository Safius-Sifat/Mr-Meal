import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'error_message_widget.dart';

class AsyncValueWidget<T> extends StatelessWidget {
  const AsyncValueWidget(
      {super.key,
      required this.value,
      required this.data,
      this.loading = const Center(child: CircularProgressIndicator())});
  final AsyncValue<T> value;
  final Widget Function(T) data;
  final Widget loading;

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: data,
      error: (e, st) => Center(child: ErrorMessageWidget(e.toString())),
      loading: () => loading,
    );
  }
}
