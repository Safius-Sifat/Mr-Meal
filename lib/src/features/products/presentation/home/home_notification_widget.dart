import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../constants/app_sizes.dart';
import '../../../../constants/constants.dart';
import '../../../../routing/app_router.dart';
import '../widgets/photo.dart';

class HomeNotificationWidget extends StatelessWidget {
  const HomeNotificationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.goNamed(AppRoute.notification.name);
      },
      child: Badge.count(
        count: 2,
        child: Container(
          padding: const EdgeInsets.all(Sizes.p8),
          decoration: const BoxDecoration(
            color: neutralColor,
            shape: BoxShape.circle,
          ),
          child: const Photo(
            alarm,
            color: primaryColor,
          ),
        ),
      ),
    );
  }
}
