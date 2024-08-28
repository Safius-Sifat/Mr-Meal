import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common_widgets/async_value_widget.dart';
import '../../../../common_widgets/primary_button.dart';
import '../../../../constants/app_sizes.dart';
import '../../../../l10n/string_hardcoded.dart';
import 'verification_controller.dart';
import 'verification_text_field.dart';

class VerificationScreen extends ConsumerStatefulWidget {
  final String email;
  const VerificationScreen({super.key, required this.email});

  @override
  ConsumerState<VerificationScreen> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends ConsumerState<VerificationScreen> {
  final List<TextEditingController> otpController =
      List.generate(4, (index) => TextEditingController());

  bool _areAllFieldsFilled() {
    return otpController.every((controller) => controller.text.isNotEmpty);
  }

  @override
  void dispose() {
    for (final element in otpController) {
      element.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: Sizes.p24),
            Text(
              'Verification',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 20),
            Text(
              'Enter the four digit code we have sent to your email',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 60),
            const Center(
              child: Text(
                'Verification code',
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < 4; i++)
                  VerificationTextfield(
                    controller: otpController[i],
                    onChanged: (value) {
                      if (value.length == 1 && i < 3) {
                        FocusScope.of(context).nextFocus();
                      } else if (value.isEmpty && i > 0) {
                        FocusScope.of(context).previousFocus();
                      }
                      // if (_areAllFieldsFilled()) {
                      //   setState(() {
                      //     isActive = true;
                      //   });
                      // } else {
                      //   setState(() {
                      //     isActive = false;
                      //   });
                      // }
                    },
                  ),
              ],
            ),
            const SizedBox(height: 50),
            Row(
              children: [
                const Spacer(),
                Expanded(
                  flex: 9,
                  child: PrimaryButton(
                      text: 'Verify'.hardcoded,
                      // isLoading: state.isLoading,
                      // onPressed: state.isLoading ? null : _submit,
                      onPressed: () {}),
                ),
                const Spacer(),
              ],
            ),
            // const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Didn't receive OTP? "),
                AsyncValueWidget(
                    value: ref.watch(timerProvider),
                    data: (time) {
                      return TextButton(
                          child: Text('Resend ($time)'), onPressed: () {});
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
