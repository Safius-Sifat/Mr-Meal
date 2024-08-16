import 'package:flutter/material.dart';

import '../../../../constants/app_sizes.dart';
import '../../../../constants/constants.dart';
import 'photo.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.all(Sizes.p8),
          decoration: const BoxDecoration(
            color: secondaryColor,
            shape: BoxShape.circle,
          ),
          child: const Photo(alarm),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: Container(
            padding: const EdgeInsets.all(Sizes.p4),
            decoration: const BoxDecoration(
              color: primaryColor,
              shape: BoxShape.circle,
            ),
            child: const Text(
              '2',
              style: TextStyle(
                color: neutralColor,
                fontSize: 8,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
