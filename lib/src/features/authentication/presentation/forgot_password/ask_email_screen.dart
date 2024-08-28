import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../common_widgets/primary_button.dart';
import '../../../../constants/app_sizes.dart';
import '../../../../constants/constants.dart';
import '../../../../l10n/string_hardcoded.dart';
import '../../../../routing/app_router.dart';
import '../email_password_validators.dart';
import '../string_validators.dart';

class AskEmailScreen extends ConsumerStatefulWidget {
  const AskEmailScreen({super.key});
  @override
  ConsumerState<AskEmailScreen> createState() => _AskEmailState();
}

class _AskEmailState extends ConsumerState<AskEmailScreen>
    with EmailAndPasswordValidators {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  var _submitted = false;
  @override
  Widget build(BuildContext context) {
    // final state = ref.watch(authControllerProvider);
    // ref.listen(authControllerProvider, (_, state) {
    //   if (state.hasError) {
    //     final error = state.error! as AuthFailure;
    //     error.when(unKnown: () {
    //       return showSnackBar(l10n.unknownError);
    //     }, server: (code, message) {
    //       return showSnackBar(l10n.resetPasswordError);
    //     }, noConnection: () {
    //       return showSnackBar(l10n.noConnectionError);
    //     });
    //   }
    // });
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
                        // isLoading: state.isLoading,
                        // onPressed: state.isLoading ? null : _submit,
                        onPressed: () {}),
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
