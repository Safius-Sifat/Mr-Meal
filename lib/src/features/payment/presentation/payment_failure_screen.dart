import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../common_widgets/primary_button.dart';
import '../../../constants/app_sizes.dart';
import '../../../constants/constants.dart';
import '../../../routing/app_router.dart';
import '../../products/presentation/widgets/photo.dart';

class PaymentFailureScreen extends StatelessWidget {
  const PaymentFailureScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Spacer(flex: 2),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: const Photo(paymentFailed),
              ),
              const Spacer(flex: 2),
              ErrorInfo(
                title: 'Payment Failure',
                description:
                    'The payment for your order has failed. Please verify your credentials or check back later!',
                btnText: 'Back to Home',
                press: () {
                  context.goNamed(AppRoute.home.name);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ErrorInfo extends StatelessWidget {
  const ErrorInfo({
    super.key,
    required this.title,
    required this.description,
    this.button,
    this.btnText,
    required this.press,
  });

  final String title;
  final String description;
  final Widget? button;
  final String? btnText;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              description,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontSize: Sizes.p12,
                  ),
            ),
            const SizedBox(height: 16 * 2.5),
            button ??
                PrimaryButton(
                  text: btnText ?? 'Retry',
                  height: 48,
                  onPressed: press,
                ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
