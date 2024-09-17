import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../common_widgets/primary_button.dart';
import '../../../constants/app_sizes.dart';
import '../../../constants/constants.dart';
import '../../../l10n/string_hardcoded.dart';
import '../../../routing/app_router.dart';
import '../../products/presentation/widgets/photo.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
          child: Column(
            children: [
              gapH20,
              const Expanded(
                child: Photo(logo),
              ),
              gapH64,
              const Expanded(
                child: Photo(welcome),
              ),
              const Spacer(),
              Text('Hello, Foodies!'.hardcoded,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: Sizes.p32,
                      )),
              gapH16,
              Text('Welcome to Mr Meal'.hardcoded,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: Sizes.p16,
                      )),
              const Spacer(),
              PrimaryButton(
                text: "Let's start with us".hardcoded,
                onPressed: () {
                  context.goNamed(AppRoute.login.name);
                },
              ),
              gapH48,
            ],
          ),
        ),
      ),
    );
  }
}
