import 'package:flutter/material.dart';

import '../constants/app_sizes.dart';
import '../constants/constants.dart';
import '../features/products/presentation/widgets/photo.dart';
import '../l10n/string_hardcoded.dart';

class ComingSoonScreen extends StatelessWidget {
  const ComingSoonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: Sizes.p16, vertical: Sizes.p8),
          decoration: BoxDecoration(
              color: secondaryColor, borderRadius: BorderRadius.circular(8)),
          child: Text('Coming soon'.hardcoded),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Opacity(
                opacity: 0.5,
                child: SizedBox(height: Sizes.p64, child: Photo(logo))),
            gapH32,
            Text(
              'Coming soon',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            gapH8,
            Text(
              'This feature is currently under development. Please check back later.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
