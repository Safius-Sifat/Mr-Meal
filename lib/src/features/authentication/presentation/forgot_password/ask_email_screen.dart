import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../common_widgets/primary_button.dart';
import '../../../../constants/app_sizes.dart';
import '../../../../constants/constants.dart';
import '../../../../l10n/string_hardcoded.dart';
import '../../../../routing/app_router.dart';
import '../../../../utils/async_value_ui.dart';
import '../../../../utils/toastification.dart';
import '../email_password_validators.dart';
import '../string_validators.dart';
import 'forgot_password_controller.dart';

class AskEmailScreen extends ConsumerStatefulWidget {
  const AskEmailScreen({super.key});
  @override
  ConsumerState<AskEmailScreen> createState() => _AskEmailState();
}

class _AskEmailState extends ConsumerState<AskEmailScreen>
    with EmailAndPasswordValidators {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String get email => _emailController.text;
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  var _submitted = false;
  Future<void> _submit() async {
    setState(() => _submitted = true);
    // only submit the form if validation passes
    if (_formKey.currentState!.validate()) {
      final controller = ref.read(sendOtpControllerProvider.notifier);
      final success = await controller.sendOtp(email);

      if (mounted && success) {
        successToast(
            ctx: context, title: 'Verification code sent successfully');
        await context.pushNamed(AppRoute.forgotPassword.name,
            pathParameters: {'email': email});
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(sendOtpControllerProvider);
    ref.listen<AsyncValue<dynamic>>(
      sendOtpControllerProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Text('Forgot Password?',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      )),
              Padding(
                padding: const EdgeInsets.all(Sizes.p16),
                child: Text(
                    "Enter your email address and we'll send a verification code to your email.",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge),
              ),
              gapH32,
              Row(
                children: [
                  const Spacer(),
                  Expanded(
                    flex: 9,
                    child: TextFormField(
                      controller: _emailController,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (email) =>
                          !_submitted ? null : emailErrorText(email ?? ''),
                      autocorrect: false,
                      inputFormatters: <TextInputFormatter>[
                        ValidatorInputFormatter(
                            editingValidator: EmailEditingRegexValidator()),
                      ],
                      decoration: InputDecoration(
                        hintText: 'Email address',
                        hintStyle: const TextStyle(
                          color: textFieldHint,
                          fontSize: Sizes.p16,
                        ),
                        // enabled: !state.isLoading,
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: textFieldColor),
                          borderRadius: BorderRadius.circular(Sizes.p8),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(Sizes.p8),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(Sizes.p8),
                        ),
                        filled: true,
                        fillColor: textFieldColor,
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              const Spacer(flex: 4),
              Row(
                children: [
                  const Spacer(),
                  Expanded(
                    flex: 9,
                    child: PrimaryButton(
                      text: 'Confirm'.hardcoded,
                      isLoading: state.isLoading,
                      onPressed: state.isLoading ? null : _submit,
                    ),
                  ),
                  const Spacer(),
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
