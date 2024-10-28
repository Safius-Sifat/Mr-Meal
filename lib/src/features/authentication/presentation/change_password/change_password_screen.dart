import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common_widgets/primary_button.dart';
import '../../../../constants/app_sizes.dart';
import '../../../../constants/constants.dart';
import '../../../../l10n/string_hardcoded.dart';
import '../../../../utils/async_value_ui.dart';
import '../../../../utils/toastification.dart';
import '../../data/auth_repository.dart';
import '../email_password_validators.dart';
import 'change_password_controller.dart';

class ChangePasswordScreen extends ConsumerStatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  ConsumerState<ChangePasswordScreen> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends ConsumerState<ChangePasswordScreen>
    with EmailAndPasswordValidators {
  final _oldPasswordController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String get password => _passwordController.text;
  String get confirmPassword => _confirmPasswordController.text;
  String get oldPassword => _oldPasswordController.text;
  var _submitted = false;
  Future<void> _submit() async {
    setState(() => _submitted = true);
    // only submit the form if validation passes
    if (_formKey.currentState!.validate()) {
      final controller = ref.read(changePasswordControllerProvider.notifier);
      final success = await controller.changePassword(
        newPassword: password,
        oldPassword: oldPassword,
      );

      if (context.mounted && success) {
        successToast(
            ctx: context,
            title: 'Password changed successfully, please login again');
        await Future.delayed(const Duration(seconds: 2));

        await ref.read(authRepositoryProvider).signOut();
      }
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
    final state = ref.watch(changePasswordControllerProvider);

    ref.listen<AsyncValue<dynamic>>(
      changePasswordControllerProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Text(
            'Change Password'.hardcoded,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          gapH24,
          Row(
            children: [
              const Spacer(),
              Expanded(
                flex: 9,
                child: TextFormField(
                  controller: _oldPasswordController,
                  textInputAction: TextInputAction.next,
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
                    hintText: 'Old password',
                    hintStyle: const TextStyle(
                      color: textFieldHint,
                      fontSize: Sizes.p16,
                    ),
                    prefixIcon: const Icon(Icons.key_sharp),
                    enabled: !state.isLoading,
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
          gapH12,
          Row(
            children: [
              const Spacer(),
              Expanded(
                flex: 9,
                child: TextFormField(
                  controller: _passwordController,
                  textInputAction: TextInputAction.next,

                  obscureText: true,
                  autocorrect: false,
                  keyboardType: TextInputType.visiblePassword,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  // onEditingComplete: _passwordEditingComplete,
                  validator: (password) => !_submitted
                      ? null
                      : passwordErrorText(
                          password ?? '', EmailPasswordSignInFormType.register),
                  decoration: InputDecoration(
                    hintText: 'New password',
                    hintStyle: const TextStyle(
                      color: textFieldHint,
                      fontSize: Sizes.p16,
                    ),
                    prefixIcon: const Icon(Icons.key_sharp),
                    enabled: !state.isLoading,
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
          gapH12,
          Row(
            children: [
              const Spacer(),
              Expanded(
                flex: 9,
                child: TextFormField(
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
                    prefixIcon: const Icon(Icons.key_sharp),
                    enabled: !state.isLoading,
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
