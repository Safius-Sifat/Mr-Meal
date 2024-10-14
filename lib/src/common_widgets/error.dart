import 'package:flutter/material.dart';

import '../constants/app_sizes.dart';
import '../constants/constants.dart';
import '../features/products/presentation/widgets/photo.dart';
import 'primary_button.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key, required this.onRetry});
  final void Function() onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Opacity(
              opacity: 0.5,
              child: SizedBox(height: Sizes.p64, child: Photo(logo))),
          gapH32,
          const Text(
            'Ooops! An unexpected error occurred',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
          gapH8,
          const Text(
            'Something went wrong! Please try again later',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          gapH16,
          PrimaryButton(text: 'Retry', width: 160, onPressed: onRetry),
        ],
      ),
    );
  }
}
