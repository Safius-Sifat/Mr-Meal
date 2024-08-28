import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common_widgets/primary_button.dart';
import '../../../../constants/app_sizes.dart';
import '../../../../constants/constants.dart';
import '../../../../l10n/string_hardcoded.dart';
import '../email_password_validators.dart';

class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({required this.email, super.key});
  final String email;

  @override
  ConsumerState<ForgotPasswordScreen> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends ConsumerState<ForgotPasswordScreen>
    with EmailAndPasswordValidators {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String get password => _passwordController.text;
  String get confirmPassword => _confirmPasswordController.text;
  var _submitted = false;
  Future<void> _submit() async {
    setState(() => _submitted = true);
    // only submit the form if validation passes
    if (_formKey.currentState!.validate()) {
      // final controller = ref.read(loginControllerProvider.notifier);
      // final success = await controller.loginWithEmailAndPassword(
      //   email,
      //   password,
      // );
      // if (context.mounted && success) {
      //   widget.onSignedIn?.call();
      //   context.pushReplacementNamed(AppRoute.home.name);
      // }
    }
  }

  // void _passwordEditingComplete() {
  //   if (!canSubmitEmail(email)) {
  //     _node.previousFocus();
  //     return;
  //   }
  //   // _submit();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: <Widget>[
          Text(
            'Reset Password'.hardcoded,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const Spacer(),
              Expanded(
                flex: 9,
                child: TextFormField(
                  controller: _passwordController,
                  textAlign: TextAlign.center,
                  textInputAction: TextInputAction.done,
                  obscureText: true,
                  autocorrect: false,
                  keyboardType: TextInputType.visiblePassword,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  // onEditingComplete: _passwordEditingComplete,
                  validator: (password) => !_submitted
                      ? null
                      : passwordErrorText(
                          password ?? '', EmailPasswordSignInFormType.signIn),
                  decoration: InputDecoration(
                    hintText: 'Password',
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
          gapH20,
          Row(
            children: [
              const Spacer(),
              Expanded(
                flex: 9,
                child: TextFormField(
                  textAlign: TextAlign.center,
                  controller: _confirmPasswordController,
                  textInputAction: TextInputAction.done,
                  obscureText: true,
                  autocorrect: false,
                  keyboardType: TextInputType.visiblePassword,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  // onEditingComplete: _passwordEditingComplete,
                  validator: (confirmPassword) => !_submitted
                      ? null
                      : confirmPasswordErrorText(
                          password, confirmPassword ?? ''),
                  decoration: InputDecoration(
                    hintText: 'Confirm password',
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
          const Spacer(
            flex: 3,
          ),
          Row(
            children: [
              const Spacer(),
              Expanded(
                flex: 9,
                child: PrimaryButton(
                  onPressed: _submit,
                  text: 'Submit'.hardcoded,
                ),
              ),
              const Spacer(),
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
